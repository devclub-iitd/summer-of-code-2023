

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/pages/product_description.dart';

import '../ApiService/addedProductApi.dart';
import '../Models/AddedProduct.dart';
import '../Utils/widgets.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {

  MyProductApi myProductApi=MyProductApi();
  List<AddedProduct> myProducts=[];
  bool isLoading=true;
  @override
  void initState() {

    super.initState();
    myProductApi.getWishlist("its8@gmail.com").then((value) {
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
                        nextScreen(context, ProductDescription(product: myProducts[i], category: product.category,isMYProduct: true,));
                      },
                      child: ListTile(
                        leading: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              image: DecorationImage(image: NetworkImage(product.image),fit: BoxFit.contain)
                          ),
                        ),
                        title: Text(product.title,),
                        subtitle: Text("Rs. "+product.price,style: TextStyle(color: Colors.blue),),

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
