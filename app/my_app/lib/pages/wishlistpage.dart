
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/ApiService/CartApi.dart';
import 'package:my_app/pages/product_description.dart';
import 'package:my_app/pages/searchPage.dart';
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
    cartApiService.getMyCart(FirebaseAuth.instance.currentUser!.email!,context).then((value){
      Provider.of<ProductProvider>(context, listen: false).setCartLength(value[2]);
    });
  }
  @override
  void initState() {

    super.initState();
    myProductApi.getWishlist(FirebaseAuth.instance.currentUser!.email!,context).then((value) {

      setState(() {
        myProducts=value;
        isLoading=false;
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace:Padding(
          padding: const EdgeInsets.only(top: 35.0,left: 10,right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap:(){
                  Navigator.pop(context);
                },
                child: Card(
                  elevation: 10,color: Colors.grey,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                ),
              ),
              Text("WishList",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
              GestureDetector(
                child: Card(
                  elevation: 10,color: Colors.grey,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: const Icon(Icons.search_outlined),
                  ),
                ),
              ),
            ],
          ),
        ),
        elevation: 0,
      ),
      body: isLoading?const Center(child: CircularProgressIndicator( )):Column(
        children: [
          Padding(
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
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        child: Row(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                height:90,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                    image: DecorationImage(image: NetworkImage(product.image),fit: BoxFit.fill)
                                ),
                              ),
                            ),
                            SizedBox(width: 15,),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.title.length>15?product.title.substring(0,15):product.title,style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 20),),
                                  SizedBox(height: 10,),
                                  Text("Rs. "+product.price,style: TextStyle(color:Colors.blue,fontSize: 19),),
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.delete,color: Colors.red,size:30,),
                                  SizedBox(width: 25,),
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
                                      child: Icon(Icons.add_shopping_cart_outlined,color: Colors.green,size: 30,)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );

                }),
          ),
        ],
      ),
    );
  }
}
