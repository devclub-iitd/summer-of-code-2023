
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/pages/CheckOutPage.dart';
import 'package:my_app/pages/searchPage.dart';

import '../ApiService/addedProductApi.dart';
import '../Utils/widgets.dart';

class AddressDetails extends StatefulWidget {
  bool onCheckOut;
  AddressDetails({Key? key,required this.onCheckOut}) : super(key: key);

  @override
  State<AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {

  String name="";
  String category="";
  String price="";
  String imageAddress="";
  String location="";
  String description="";
  final formKey=GlobalKey<FormState>();
  MyProductApi apiService=MyProductApi();
  bool isSwitched=false;
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
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        flexibleSpace:Padding(
          padding: const EdgeInsets.only(top: 40.0,left: 10,right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap:(){
                  Navigator.pop(context);
                },
                child: Card(
                  elevation: 10,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                ),
              ),
              Text("Address",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
              GestureDetector(
                onTap: (){
                  nextScreen(context, const SearchPage());
                },
                child: Card(
                  elevation: 10,
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
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      bottomNavigationBar: widget.onCheckOut?Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        child: GestureDetector(
          onTap: (){
            nextScreen(context, CheckOutPage());
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            decoration: const BoxDecoration(
                gradient:LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black,Colors.black45],),
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            height: 50,
            child:  Center(
              child: Text("Continue",style: const TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ):Container(height: 1,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.location_on_outlined),
                Text("Saved Address",style: GoogleFonts.roboto(fontSize: 20),),
                InkWell(
                  onTap: (){
                    setState(() {
                      isSwitched=true;
                    });
                  },
                    child: const Icon(Icons.edit)),
              ],
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text("address"),
            ),
            Visibility(
              visible: isSwitched,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 10,),

                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text("Name",style: GoogleFonts.roboto(fontSize: 20),),
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
                          decoration: textInputdec.copyWith(
                            hintText: "John Doe",
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
                                Text("Phone number",style: GoogleFonts.roboto(fontSize: 20),),
                                const SizedBox(height: 10,),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(Radius.circular(15)),
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
                                Text("Pincode",style: GoogleFonts.roboto(fontSize: 20),),
                                const SizedBox(height: 10,),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                                      color: Colors.grey.withOpacity(0.2)
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration: textInputdec.copyWith(
                                      hintText: "required",
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
                          child: Text("State",style: GoogleFonts.roboto(fontSize: 20),),
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
                    const SizedBox(height: 15,),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text("City ",style: GoogleFonts.roboto(fontSize: 20),),
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
                          child: Text("House no,Ward",style: GoogleFonts.roboto(fontSize: 20),),
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
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text("Area,Landmark,Colony",style: GoogleFonts.roboto(fontSize: 20),),
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


                    submitForm(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget submitForm(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
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
                child: Text(isLoading? "Updating Address" :"Update Address",style: const TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
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
              child:  const Center(
                child: Text("Cancel",style: TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
