
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/ApiService/api.dart';
import 'package:my_app/pages/CheckOutPage.dart';
import 'package:my_app/pages/searchPage.dart';
import 'package:my_app/providers/userProvider.dart';
import 'package:provider/provider.dart';

import '../ApiService/addedProductApi.dart';
import '../Models/cartItem.dart';
import '../Models/order.dart';
import '../Models/user.dart';
import '../Utils/widgets.dart';




class AddressDetails extends StatefulWidget {
  bool onCheckOut;
  List<CartItem>? orders;
  AddressDetails({Key? key,required this.onCheckOut,this.orders}) : super(key: key);

  @override
  State<AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {

  String name="";
  String phone="";
  String pin="";
  String city="";
  String state="";
  String landmark="";
  String ward="";
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
  ApiService api=ApiService();

  @override
  void initState() {
    super.initState();
    User user=Provider.of<UserProvider>(context, listen: false).user;
    if(user.address.isEmpty){
      setState(() {
        isSwitched=true;
      });
    }
  }
  List<Step> stepList() => [
    Step(title: const Text('Address'), content: const SizedBox(height: 1,), isActive: currentStep > 0,
      state: currentStep > 0
          ? StepState.complete
          : StepState.indexed,),
    Step(title: const Text('Details'), content: const SizedBox(height: 1,), isActive: currentStep > 1,
      state: currentStep > 1
          ? StepState.complete
          : StepState.indexed,),
    Step(title: const Text('Payment'), content: const SizedBox(height: 1,), isActive: currentStep > 2,
      state: currentStep > 2
          ? StepState.complete
          : StepState.indexed,),
  ];


  updateAddress(List add,String email,String phone,String image,String name,BuildContext context,String id,String password){
    api.updateAddress(context: context, email: email, address: add,phone: phone,image: image,name: name).then((value) {
      setState(() {
        isSwitched=false;
        formKey.currentState!.reset();
      });
      if(value){
        final user=context.read<UserProvider>().user;
        User updated=User(id, name,email, password, phone, add, image,user.suggestion);
        Provider.of<UserProvider>(context, listen: false).setUserFromModel(updated);
      }

    });
  }
  int currentStep=0;


  @override
  Widget build(BuildContext context) {
    final user=context.watch<UserProvider>().user;
    return  Scaffold(
      appBar: AppBar(
        leading: null,
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
              Text("Address",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
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
      bottomNavigationBar: widget.onCheckOut?Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        child: GestureDetector(
          onTap: (){
            nextScreenReplace(context,  CheckOutPage(orders: widget.orders!,));
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
            child:  const Center(
              child: Text("Continue",style: TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ):Container(height: 1,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            widget.onCheckOut?Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: Stepper(
                type: StepperType.horizontal,
                currentStep: currentStep,
                physics: const ScrollPhysics(),
                steps: stepList(),
              ),
            ):SizedBox(height: 5,),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0).copyWith(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.location_on_outlined),
                        Text("Saved Address",style: GoogleFonts.roboto(fontSize: 20,color: Colors.blue),),
                        InkWell(
                            onTap: (){
                              setState(() {
                                isSwitched=true;
                              });
                            },
                            child: const Icon(Icons.edit)),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                        width: MediaQuery.of(context).size.width,
                        child: Text(user.address.isEmpty?"No saved address":address(user.address),style: TextStyle(fontSize: 18),)),
                  ),
                ],
              ),
            ),

            Visibility(
              visible: widget.onCheckOut?widget.onCheckOut:isSwitched,
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
                          initialValue: user.address.isNotEmpty?user.address[0]:null,
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
                                    initialValue: user.address.isNotEmpty?user.address[6]:null,
                                    decoration: textInputdec.copyWith(
                                      hintText: "with country code",
                                      hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                                      border:InputBorder.none,),
                                    onChanged:(val){
                                      setState(() {
                                        phone=val;
                                      });
                                    },
                                    validator: (val){
                                      if(val!.isEmpty){
                                        return "phone is mandatory";
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
                                    initialValue: user.address.isNotEmpty?user.address[1]:null,
                                    decoration: textInputdec.copyWith(
                                      hintText: "required",
                                      hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                                      border:InputBorder.none,),
                                    onChanged:(val){
                                      setState(() {
                                        pin=val;
                                      });
                                    },
                                    validator: (val){
                                      if(val!.isEmpty){
                                        return "pin is mandatory";
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
                          initialValue: user.address.isNotEmpty?user.address[3]:null,
                          decoration: textInputdec.copyWith(
                            hintText: "required",
                            hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                            border:InputBorder.none,),
                          onChanged:(val){
                            setState(() {
                              state=val;
                            });
                          },
                          validator: (val){
                            if(val!.isEmpty){
                              return "state is mandatory";
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
                          initialValue: user.address.isNotEmpty?user.address[2]:null,
                          decoration: textInputdec.copyWith(
                            hintText: "Delhi ",
                            hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                            border:InputBorder.none,),
                          onChanged:(val){
                            setState(() {
                              city=val;
                            });
                          },
                          validator: (val){
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

                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            color: Colors.grey.withOpacity(0.2)
                        ),
                        child: Center(
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            initialValue: user.address.isNotEmpty?user.address[4]:null,
                            decoration: textInputdec.copyWith(
                              hintText: "House/ward no",
                              hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                              border:InputBorder.none,),
                            onChanged:(val){
                              setState(() {
                                ward=val;
                              });
                            },
                            validator: (val){
                              if(val!.isEmpty){
                                return "required";
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

                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            color: Colors.grey.withOpacity(0.2)
                        ),
                        child: Center(
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            initialValue: user.address.isNotEmpty?user.address[5]:null,
                            decoration: textInputdec.copyWith(
                              hintText: "near temple..",
                              hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                              border:InputBorder.none,),
                            onChanged:(val){
                              setState(() {
                                landmark=val;
                              });
                            },
                            validator: (val){

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
    final user=context.watch<UserProvider>().user;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              if(formKey.currentState!.validate()){
                List add=[name,pin,city,state,ward,landmark,phone];
                showSnakbar(context, Colors.blue, "Saving Address");
                updateAddress(add,user.email,user.phone,user.image,user.name,context,user.id,user.password);

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
                child: Text("Submit",style: const TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                isSwitched=false;
              });
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
                child: Text("Cancel",style: TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.w600),
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
