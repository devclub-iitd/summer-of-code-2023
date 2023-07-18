
import 'dart:ffi';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/Models/AddedProduct.dart';
import 'package:my_app/pages/searchPage.dart';
import '../ApiService/addedProductApi.dart';
import '../ApiService/api.dart';
import '../ApiService/authApi.dart';
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

  ImagePicker picker =ImagePicker();
  File? _image;
  late XFile pickedimage;
  ApiService api=ApiService();
  AuthApi authApi=AuthApi();
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
        if(_image!=null){
          authApi.productImage(_image).then((uri){
            apiService.addProduct(context: context,
                userId: FirebaseAuth.instance.currentUser!.email!,
                title: name,
                category: category,
                desc: description,
                price: price,
                location: location,
                isNegotiable: isSwitched,
                image: uri).then((value){
              isLoading = false;
              formKey.currentState!.reset();
              _image=null;
              setState(() {
              });
            });

          });

        } else{
          apiService.addProduct(context: context,
              userId: FirebaseAuth.instance.currentUser!.email!,
              title: name,
              category: category,
              desc: description,
              price: price,
              location: location,
              isNegotiable: isSwitched,
              image: imageAddress).then((value){
            isLoading = false;
            formKey.currentState!.reset();
            _image=null;
            setState(() {
            });
          });

        }

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
              const SizedBox(width: 1,
                height: 1,),
              Text("Add Product",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 22),),
              GestureDetector(
                onTap: (){
                  nextScreen(context, const SearchPage());
                },
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
      body: SafeArea(child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [

              _image!=null?Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 150,
                  width: 120,
                  decoration: BoxDecoration(
                    border:Border.all(color: Colors.grey),
                    image: DecorationImage(image: FileImage(_image!,),fit: BoxFit.cover)
                  ),
                ),
              ):const SizedBox(height: 10,),
              Align(
                alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text("Title",style: GoogleFonts.roboto(fontSize: 20),),
                  )),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
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
              const SizedBox(height: 15,),
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
                          const SizedBox(height: 10,),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(15)),
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
                          const SizedBox(height: 10,),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(15)),
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
              const SizedBox(height: 15,),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text("Image ",style: GoogleFonts.roboto(fontSize: 20),),
                        Expanded(child: Container()),
                        InkWell(
                          onTap: (){
                            showModalBottomSheet<void>(context: context,
                                isScrollControlled: true,
                                isDismissible: true,
                                enableDrag: true,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20)
                                    )
                                ),
                                builder:(BuildContext context){
                                  return Container(
                                    height: 180,
                                    child: Column(
                                        children:[
                                          const Text("Choose an option ):",style: TextStyle(color:Color(0xff2E4237),fontSize: 25,fontWeight: FontWeight.bold),),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              GestureDetector(
                                                onTap:()async{
                                                  Navigator.pop(context);
                                                  pickedimage = (await picker.pickImage(source: ImageSource.gallery))!;
                                                  setState(() {
                                                    if(pickedimage!=null){
                                                      _image=File(pickedimage!.path);
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets.only(left: 25,top: 20,bottom: 10,right: 20),
                                                  padding: const EdgeInsets.only(bottom: 5),
                                                  height: 120,
                                                  width: 120,
                                                  decoration: const BoxDecoration(
                                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                                    color: Color(0xff488381),
                                                  ),
                                                  child: Stack(
                                                      children: const [
                                                        Center(child: Icon(Icons.browse_gallery,size: 50,color: Colors.white,)),
                                                        Align(
                                                            alignment: Alignment.bottomCenter,
                                                            child: Text("Gallery",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),))
                                                      ]),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap:()async{
                                                  Navigator.pop(context);
                                                  pickedimage = (await picker.pickImage(source: ImageSource.camera))!;
                                                  setState(() {
                                                    if(pickedimage!=null){
                                                      _image=File(pickedimage.path);
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets.only(left: 15,top: 20,bottom: 10,right: 20),
                                                  padding: const EdgeInsets.only(bottom: 5),
                                                  height: 120,
                                                  width: 120,
                                                  decoration: const BoxDecoration(
                                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                                    color: Color(0xff488381),
                                                  ),
                                                  child: Stack(
                                                      children: const [
                                                        Center(child: Icon(Icons.camera,size: 50,color: Colors.white,)),
                                                        Align(
                                                            alignment: Alignment.bottomCenter,
                                                            child: Text("Camera",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),))
                                                      ]),
                                                ),
                                              ),

                                            ],
                                          ),

                                        ]
                                    ),
                                  );
                                });

                          },
                            child: const Icon(Icons.add,size: 30,color: Colors.blue,))
                      ],
                    ),
                  )),
              const SizedBox(height: 10,),
              Visibility(
                visible: _image==null,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        color: Colors.grey.withOpacity(0.2)
                    ),
                    child: TextFormField(
                      initialValue: widget.addedProduct==null?null:widget.addedProduct!.image,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: textInputdec.copyWith(
                        hintText: "enter image address Or upload image manually",
                        hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                        border:InputBorder.none,),
                      onChanged:(val){
                        setState(() {
                          imageAddress=val;
                        });
                      },
                      validator: (val){
                        if(_image==null){
                          if(val!.isEmpty){
                            return "image is mandatory";
                          }else{
                            return null;
                          }
                        }

                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text("Location ",style: GoogleFonts.roboto(fontSize: 20),),
                  )),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
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
              const SizedBox(height: 15,),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text("Description",style: GoogleFonts.roboto(fontSize: 20),),
                  )),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 150,

                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
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
              const SizedBox(height: 10,),
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
                        activeColor: const Color(0xff77b493),
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
            child: Text(isLoading? "Adding Product" :"Add Product",style: const TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
