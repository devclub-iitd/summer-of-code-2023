
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/ApiService/addedProductApi.dart';
import 'package:my_app/pages/product_description.dart';

import '../Models/AddedProduct.dart';
import '../Utils/widgets.dart';

class MyProducts extends StatefulWidget {
  const MyProducts({Key? key}) : super(key: key);

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {

  MyProductApi myProductApi=MyProductApi();
  List<AddedProduct> myProducts=[];
  bool isLoading=true;
  @override
  void initState() {

    super.initState();
    myProductApi.getMyProducts("adi@gmail.com").then((value) {
      setState(() {
        myProducts=value;
        isLoading=false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  Text("My Products",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
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
            isLoading?const CircularProgressIndicator( ):ListView.builder(
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
          ],
        ),
      )),
    );
  }
}
