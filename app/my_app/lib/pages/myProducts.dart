
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
    myProductApi.getMyProducts(FirebaseAuth.instance.currentUser!.email!).then((value) {
      setState(() {
        myProducts=value;
        isLoading=false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              Text("My Products",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
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
      body: isLoading?const Center(child:  CircularProgressIndicator( )):SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
              child: ListView.builder(
                  itemCount: myProducts.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,i){
                    final product=myProducts[i];
                    return GestureDetector(
                      onTap: (){
                        nextScreen(context, ProductDescription(product: myProducts[i], category: product.category,isMYProduct: true,));
                      },
                      child: Slidable(
                        startActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children:  [
                            SlidableAction(
                              onPressed: (context){

                              },
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.red,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                            SlidableAction(
                              onPressed: (context){
                              },
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF21B7CA),
                              icon: Icons.share,
                              label: 'Share',
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(Radius.circular(15)),
                                image: DecorationImage(image: NetworkImage(product.image),fit: BoxFit.contain)
                            ),
                          ),
                          title: Text(product.title,),
                          subtitle: Text("Rs. "+product.price,style: const TextStyle(color: Colors.blue),),

                          ),
                      ),

                    );

                  }),
            ),
          ],
        ),
      ),
    );
  }
}
