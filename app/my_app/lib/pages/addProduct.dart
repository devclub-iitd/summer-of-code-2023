
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/Models/AddedProduct.dart';
import 'package:my_app/pages/searchPage.dart';
import '../ApiService/addedProductApi.dart';
import '../Utils/widgets.dart';

class AddProduct extends StatefulWidget {
  final AddedProduct? addedProduct;
  const AddProduct({Key? key,this.addedProduct}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String name="";
  String category="";
  String price="";
  String imageAddress="";
  String location="";
  String description="";
  final formKey=GlobalKey<FormState>();
  MyProductApi apiService=MyProductApi();
  bool isSwitched=true;
  bool isLoading=false;
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    }
    else {
      setState(() {
        isSwitched = false;
      });
    }
  }

  void add() {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      apiService.addProduct(context: context,
          userId: FirebaseAuth.instance.currentUser!.email!,
          title: name,
          category: category,
          desc: description,
          price: price,
          location: location,
          isNegotiable: isSwitched,
          image: imageAddress);
      isLoading = false;
      formKey.currentState!.reset();
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar:submitForm() ,
      appBar: AppBar(
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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
              ),
              Text("Add Product",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
              GestureDetector(
                onTap: (){
                  nextScreen(context, SearchPage());
                },
                child: Card(
                  elevation: 10,color: Colors.grey,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Icon(Icons.search_outlined),
                  ),
                ),
              ),
            ],
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text("Title",style: GoogleFonts.roboto(fontSize: 20),),
                  )),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.grey.withOpacity(0.2)
                  ),
                  child: TextFormField(
                    initialValue: widget.addedProduct==null?null:widget.addedProduct!.title,
                    decoration: textInputdec.copyWith(
                      hintText: "half sleeve shirt",
                      hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                      border:InputBorder.none,),
                    onChanged:(val){
                      setState(() {
                        name=val;
                      });
                    },
                    validator: (val){
                      if(val!.isEmpty){
                        return "name is mandatory";
                      }else{
                        return null;
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Padding(

                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.4,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Category",style: GoogleFonts.roboto(fontSize: 20),),
                          SizedBox(height: 10,),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                color: Colors.grey.withOpacity(0.2)
                            ),
                            child: TextFormField(
                              initialValue: widget.addedProduct==null?null:widget.addedProduct!.category,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: textInputdec.copyWith(
                                hintText: "shirts,jeans",
                                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                                border:InputBorder.none,),
                              onChanged:(val){
                                setState(() {
                                  category=val;
                                });
                              },
                              validator: (val){
                                if(val!.isEmpty){
                                  return "category is mandatory";
                                }else{
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Price",style: GoogleFonts.roboto(fontSize: 20),),
                          SizedBox(height: 10,),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                color: Colors.grey.withOpacity(0.2)
                            ),
                            child: TextFormField(
                              initialValue: widget.addedProduct==null?null:widget.addedProduct!.price,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: textInputdec.copyWith(
                                hintText: "Rs. 250",
                                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                                border:InputBorder.none,),
                              onChanged:(val){
                                setState(() {
                                  price=val;
                                });
                              },
                              validator: (val){
                                if(val!.isEmpty){
                                  return "price is mandatory";
                                }else{
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text("Image Address",style: GoogleFonts.roboto(fontSize: 20),),
                  )),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.grey.withOpacity(0.2)
                  ),
                  child: TextFormField(
                    initialValue: widget.addedProduct==null?null:widget.addedProduct!.image,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: textInputdec.copyWith(
                      hintText: " ",
                      hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                      border:InputBorder.none,),
                    onChanged:(val){
                      setState(() {
                        imageAddress=val;
                      });
                    },
                    validator: (val){
                      if(val!.isEmpty){
                        return "name is mandatory";
                      }else{
                        return null;
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text("Location ",style: GoogleFonts.roboto(fontSize: 20),),
                  )),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.grey.withOpacity(0.2)
                  ),
                  child: TextFormField(
                    initialValue: widget.addedProduct==null?null:"Delhi,India",
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: textInputdec.copyWith(
                      hintText: "India ",
                      hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                      border:InputBorder.none,),
                    onChanged:(val){
                      setState(() {
                        location=val;
                      });
                    },
                    validator: (val){
                      if(val!.isEmpty){
                        return "name is mandatory";
                      }else{
                        return null;
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text("Description",style: GoogleFonts.roboto(fontSize: 20),),
                  )),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 150,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.grey.withOpacity(0.2)
                  ),
                  child: Center(
                    child: TextFormField(
                      initialValue: widget.addedProduct==null?null:widget.addedProduct!.desc,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: textInputdec.copyWith(
                        hintText: "ragged jeans of grey color..",
                        hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                        border:InputBorder.none,),
                      onChanged:(val){
                        setState(() {
                          description=val;
                        });
                      },
                      validator: (val){
                        if(val!.isEmpty){
                          return "name is mandatory";
                        }else{
                          return null;
                        }
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Text("is the price Negotiable ?",style: GoogleFonts.roboto(fontSize: 22),),
                    Expanded(child: Container()),
                    Transform.scale(
                      scale: 1.5,
                      child: Switch(value: isSwitched,
                        onChanged: toggleSwitch,
                        activeColor: Color(0xff77b493),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
 Widget submitForm(){
   return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      child: GestureDetector(
        onTap: (){
          add();
        },
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          decoration: const BoxDecoration(
              gradient:LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black,Colors.black45],),
              borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          child:  Center(
            child: Text(isLoading? "Adding Product" :"Add Product",style: TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
