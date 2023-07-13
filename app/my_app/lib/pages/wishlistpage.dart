
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/ApiService/CartApi.dart';
import 'package:my_app/pages/product_description.dart';
import 'package:provider/provider.dart';
import '../ApiService/addedProductApi.dart';
import '../Models/AddedProduct.dart';
import '../Utils/widgets.dart';
import '../providers/product_provider.dart';



class WishListPage extends StatefulWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {

  MyProductApi myProductApi=MyProductApi();
  List<AddedProduct> myProducts=[];
  bool isLoading=true;
  CartApiService cartApiService=CartApiService();
  getCart(){
    cartApiService.getMyCart("adi@gmail.com",context).then((value){
      Provider.of<ProductProvider>(context, listen: false).setCartLength(value[2]);
    });
  }
  @override
  void initState() {

    super.initState();
    myProductApi.getWishlist("its8@gmail.com",context).then((value) {

      setState(() {
        myProducts=value;
        isLoading=false;
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:(){
                      Navigator.pop(context);
                    },
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Icon(Icons.arrow_back_ios),
                      ),
                    ),
                  ),
                  Text("Wishlist",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Icon(Icons.more_horiz),
                    ),
                  ),
                ],
              ),
            ),
            isLoading?const CircularProgressIndicator( ):Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
              child: ListView.builder(
                  itemCount: myProducts.length,
                  shrinkWrap: true,
                  itemBuilder: (context,i){
                    final product=myProducts[i];
                    return GestureDetector(
                      onTap: (){
                        nextScreen(context, ProductDescription(product: product, category: product.category, isMYProduct: false));
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        child: Row(
                          children: [
                            Container(
                              height:50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage(product.image),fit: BoxFit.contain)
                              ),
                            ),
                            SizedBox(width: 15,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(product.title,style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400),),
                                Text(product.price,style: TextStyle(color:Colors.blue,),),
                                Row(
                                  children: [
                                    Icon(Icons.delete,color: Colors.red,size: 23,),
                                    InkWell(
                                      onTap: (){
                                        if(product.id.isEmpty){
                                          showSnakbar(context, Colors.red, "can't be added");
                                        }else{
                                          cartApiService.addTocart(context: context, userId: "adi@gmail.com", id:product.id, quantity: 1).then((value) {
                                            if(value){
                                              getCart();
                                            }
                                          });
                                        }
                                      },
                                        child: Icon(Icons.add_shopping_cart_outlined,color: Colors.green,size: 23,)),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );

                  }),
            ),
          ],
        ),
      )),
    );
  }
}
