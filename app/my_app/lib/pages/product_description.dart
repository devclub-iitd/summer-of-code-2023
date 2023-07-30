
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/ApiService/CartApi.dart';
import 'package:my_app/ApiService/addedProductApi.dart';
import 'package:my_app/ApiService/api.dart';
import 'package:my_app/Models/AddedProduct.dart';
import 'package:my_app/Models/Product.dart';
import 'package:my_app/Models/cartItem.dart';
import 'package:my_app/Utils/widgets.dart';
import 'package:my_app/pages/AddressDetails.dart';
import 'package:my_app/pages/CheckOutPage.dart';
import 'package:my_app/pages/addProduct.dart';
import 'package:my_app/pages/mycart.dart';
import 'package:my_app/providers/product_provider.dart';
import 'package:my_app/providers/userProvider.dart';
import 'package:provider/provider.dart';

class ProductDescription extends StatefulWidget {
  AddedProduct product;
  String category;
  bool isMYProduct;
   ProductDescription({Key? key,required this.product,required this.category,required this.isMYProduct}) : super(key: key);

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  ProductProvider productProvider=ProductProvider();
  CartApiService cartApiService=CartApiService();
  MyProductApi myProductApi =MyProductApi();
  ApiService apiService=ApiService();
  getCart(){
    cartApiService.getMyCart(FirebaseAuth.instance.currentUser!.email!,context).then((value){
      Provider.of<ProductProvider>(context, listen: false).setCartLength(value[2]);
    });
  }
  bool isInWishlist=false;

  addTowishlist(){
    apiService.addTowishlist(email:FirebaseAuth.instance.currentUser!.email!, id: widget.product.id);
    setState(() {
      isInWishlist=true;
    });
  }

  checkifinwish(){
    if(widget.product.id.isNotEmpty){
      apiService.isInWishlist(widget.product.id,FirebaseAuth.instance.currentUser!.email!).then((value) {
        setState(() {
          isInWishlist=value;
        });
      });
    }
  }


  @override
  void initState() {
    super.initState();
    checkifinwish();
    myProductApi.addSuggestion(context: context, email:FirebaseAuth.instance.currentUser!.email!, category: widget.product.category);
  }



  @override
  Widget build(BuildContext context) {
    final user=context.watch<UserProvider>().user;
    return Scaffold(
      appBar: AppBar(
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
                  elevation: 10,
                  color: Colors.grey,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                ),
              ),
              Text(widget.category,style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
              GestureDetector(
                onTap:(){
                  if(widget.product.id.isEmpty){
                    showSnakbar(context, Colors.red, "can't be added");
                  }else{
                    if(!isInWishlist){
                      addTowishlist();
                    }else{

                    }

                  }
                },
                child: Card(
                  elevation: 10,
                  color: Colors.grey,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Container(
                    height: 50,
                    width: 50,
                    child:  Icon(isInWishlist?Icons.favorite:Icons.favorite_outline_outlined,color: isInWishlist?Colors.red:Colors.black,),
                  ),
                ),
              ),
            ],
          ),
        ) ,
      ),
      bottomNavigationBar:submit(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                
                const SizedBox(height: 15,),
                Card(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(15),
                            ),
                            image: DecorationImage(image: NetworkImage(widget.product.image),fit: BoxFit.contain)
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0,top: 10),
                          child: Row(
                            children: [
                              Container(
                                width:250,
                                  child: Text(widget.product.title,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 20),)),
                              Expanded(child: Container()),
                              Text("Rs. ${widget.product.price}",style: const TextStyle(color: Colors.blue,fontSize: 18),),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Padding(padding: const EdgeInsets.only(left: 8),
                          child: Text(widget.product.desc,style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: 17),)
                          ,),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                          RatingBar.builder(
                          initialRating: double.parse("3"),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),


                          ],
                        ),
                        const SizedBox(height: 10,),



                      ],
                    ),
                  ),
                ),
                Padding(
                 padding: EdgeInsets.symmetric(horizontal: 2),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text("Deliver to: ",style: TextStyle(fontSize: 20),),
                               Text(user.address.isEmpty?"":user.address[1],style: TextStyle(fontSize: 20,color: Colors.blue),),
                              Expanded(child: Container()),
                              GestureDetector(
                                onTap: (){
                                  nextScreen(context, AddressDetails(onCheckOut: false));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    border: Border.fromBorderSide(BorderSide(color: Colors.grey))
                                  ),
                                  child: Text("Change",style: GoogleFonts.poppins(color: Colors.blue,fontSize: 18),),),
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          Text(user.address.isEmpty?"No saved address":address(user.address),style: const TextStyle(fontSize: 15),)
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*0.4,
                            child: Column(
                              children: const[
                                 CircleAvatar(
                                   backgroundColor: Colors.yellow,
                                     child: Icon(Icons.restart_alt)),
                                SizedBox(height: 5,),
                                 Text("7 Day Replacement")
                              ],
                            ),
                          ),


                          Container(
                            width: MediaQuery.of(context).size.width*0.4,
                            child: Column(
                              children: const[
                                 CircleAvatar(
                                   backgroundColor: Colors.green,
                                     child: Icon(Icons.currency_rupee_outlined)),
                                SizedBox(height: 5,),
                                 Text("Cash on Delivery ")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget submit(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(
        bottom: 10
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              if(widget.product.id.isEmpty){
                showSnakbar(context, Colors.red, "can't be added");
              }else{
                cartApiService.addTocart(context: context, userId:FirebaseAuth.instance.currentUser!.email!, id: widget.product.id, quantity: 1).then((value) {
                  if(value){
                    getCart();
                  }
                });
              }

            },
            child: Container(
              height: 50,
           width: (MediaQuery.of(context).size.width-25)*0.5,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                  gradient:LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black,Colors.black45],),
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              child:  Center(
                child: Text("Add to Cart",style: const TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              List<CartItem> orders=[CartItem(widget.product, 1)];
              if(widget.product.id.isNotEmpty){
                nextScreenReplace(context, CheckOutPage(orders: orders,fromCart: false,));
              }
            },
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: (MediaQuery.of(context).size.width-25)*0.5,
              decoration: const BoxDecoration(
                  gradient:LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black,Colors.black45],),
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              child:  const Center(
                child: Text("Buy Now",style: TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  String address(List add){
    String ad='';
    for(var i=0;i<add.length;i++){
      ad+="${add[i]} ";
    }
    return ad;
  }
}
