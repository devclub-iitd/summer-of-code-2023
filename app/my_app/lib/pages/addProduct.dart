
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/ApiService/api.dart';
import 'package:my_app/homepage.dart';

import '../Utils/widgets.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

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
  ApiService apiService=ApiService();
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
          userId: "adi@gmail.com",
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
      body: SafeArea(child: SingleChildScrollView(
        child: Form(
          key: formKey,
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
                    Text("Add Product",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Icon(Icons.sort_outlined),
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
