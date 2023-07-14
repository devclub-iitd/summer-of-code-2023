
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/homepage.dart';

import '../Utils/widgets.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  int sel=0;
  final registerKey=GlobalKey<FormState>();
  final loginKey=GlobalKey<FormState>();
  String email="";
  String password="";
  String name="";
  bool isloading=false;
  bool obscure=true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: isloading?Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),): SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 230,
                decoration: const BoxDecoration(
                   color: Colors.white,
                    image: DecorationImage(image: AssetImage("assets/e2.jpg"),fit: BoxFit.contain)
                ),

              ),
              const SizedBox(height: 10,),
              Card(
                elevation: 10,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      height: 500,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: const Color(0xff2E4237).withOpacity(0.1),
                          borderRadius: const BorderRadius.all(Radius.circular(15))),
                      width: 350,
                      child: Column(
                        children: [
                          Text("Welcome Back",style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            height: 40,
                            width: 230,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30),),
                            ),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      sel=0;
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 105,
                                    decoration:  BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(30),),color:sel==0?  Colors.black:Colors.white
                                    ),
                                    child: Row(
                                      children: [
                                        const SizedBox(width: 10,),
                                        Text("Sign In",style: GoogleFonts.poppins(color:sel==0? Colors.white: Colors.black),),
                                        const SizedBox(width: 5,),
                                        Icon(Icons.login,color:sel==0? Colors.white: Colors.black),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20,),

                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      sel=1;
                                    });
                                  },
                                  child: Container(
                                    height: 45,
                                    width: 105,
                                    decoration:  BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(30),),color:sel==1? Colors.black:Colors.white
                                    ),
                                    child: Center(
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 10,),
                                          Text("Sign Up",style: GoogleFonts.poppins(color:sel==1? Colors.white: Colors.black)),
                                          const SizedBox(width: 5,),
                                          Icon(Icons.app_registration,color:sel==1? Colors.white: Colors.black),
                                        ],
                                      ),
                                    ),
                                  ),
                                ) ,

                              ],
                            ),

                          ),
                          <Widget>[
                            FadeInLeft(
                              duration: const Duration(milliseconds: 500),
                              child: Form(
                                key: loginKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:<Widget> [
                                    const SizedBox(height: 70,),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          focusedBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color:Colors.grey,width: 2)
                                          ),
                                          enabledBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.black,width: 2)
                                          ),
                                          errorBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color:Colors.red,width: 2)
                                          ),
                                          labelText: "email ",
                                          labelStyle: GoogleFonts.poppins(color: Colors.black.withOpacity(0.5)),
                                          prefixIcon: const Icon(Icons.email,
                                            color: Colors.black,
                                          )
                                      ),
                                      onChanged:(val){
                                        setState(() {
                                          email=val;
                                        });
                                      },
                                      validator: (val){
                                        if(val!.isEmpty){
                                          return "enter valid email";
                                        }else{
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 15,),
                                    TextFormField(
                                      obscureText: obscure,
                                      decoration: InputDecoration(
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(color:Colors.grey,width: 2)
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,width: 2)
                                        ),
                                        errorBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(color:Colors.red,width: 2)
                                        ),
                                        labelText: "Password",
                                        labelStyle: GoogleFonts.poppins(color: Colors.black.withOpacity(0.5)),
                                        prefixIcon: const Icon(Icons.lock,
                                          color: Colors.black ,
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: (){
                                            setState(() {
                                              obscure=!obscure;
                                            });
                                          },
                                          child: obscure?const Icon(Icons.visibility,
                                            color:Colors.black ,
                                          ):const Icon(Icons.visibility_off,
                                            color:Colors.black ,
                                          ),
                                        ),
                                      ),
                                      validator: (val){
                                        if(val!.isEmpty){
                                          return "enter password";
                                        }else{
                                          return null;
                                        }
                                      },
                                      onChanged:(val){
                                        setState(() {
                                          password=val;
                                        });
                                      },
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Expanded(child: Container()),
                                        GestureDetector(
                                            onTap: (){
                                              pop(context);
                                            },
                                            child: Text("Forgot Password?",textAlign:TextAlign.end,style: GoogleFonts.poppins(color:Colors.blue,fontSize: 17 ),)),
                                      ],
                                    ),
                                    const SizedBox(height: 15,),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style:ElevatedButton.styleFrom(
                                            primary: Colors.black,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(30)
                                            )
                                        ) ,
                                        child: const Text("Sign In",style: TextStyle(color:Colors.white,fontSize: 16),
                                        ),onPressed: (){
                                          nextScreenReplace(context, const HomePage());
                                      },
                                      ),
                                    ),



                                  ],
                                ),
                              ),
                            ),
                            FadeInRight(
                              duration: const Duration(milliseconds: 400),
                              child: Form(
                                key: registerKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:<Widget> [
                                    const SizedBox(height: 69,),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          focusedBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color:Colors.grey,width: 2)
                                          ),
                                          enabledBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.black,width: 2)
                                          ),
                                          errorBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color:Colors.red,width: 2)
                                          ),
                                          labelText: "Name",
                                          labelStyle: GoogleFonts.poppins(color: Colors.black.withOpacity(0.5)),
                                          prefixIcon: const Icon(Icons.person,
                                            color: Colors.black,
                                          )
                                      ),
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
                                    const SizedBox(height: 13,),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          focusedBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color:Colors.grey,width: 2)
                                          ),
                                          enabledBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.black,width: 2)
                                          ),
                                          errorBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color:Colors.red,width: 2)
                                          ),
                                          labelText: "email ",
                                          labelStyle: GoogleFonts.poppins(color: Colors.black.withOpacity(0.5)),
                                          prefixIcon: const Icon(Icons.email,
                                            color: Colors.black,
                                          )
                                      ),
                                      onChanged:(val){
                                        setState(() {
                                          email=val;
                                        });
                                      },
                                      validator: (val){

                                      },
                                    ),
                                    const SizedBox(height: 13,),
                                    TextFormField(
                                      obscureText: obscure,
                                      decoration: InputDecoration(
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(color:Colors.grey,width: 2)
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black,width: 2)
                                        ),
                                        errorBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(color:Colors.red,width: 2)
                                        ),
                                        labelText: "Password",
                                        labelStyle: GoogleFonts.poppins(color: Colors.black.withOpacity(0.5)),
                                        prefixIcon: const Icon(Icons.lock,
                                          color: Colors.black ,
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: (){
                                            setState(() {
                                              obscure=!obscure;
                                            });
                                          },
                                          child: obscure?const Icon(Icons.visibility,
                                            color:Colors.black ,
                                          ):const Icon(Icons.visibility_off,
                                            color:Colors.black ,
                                          ),
                                        ),
                                      ),
                                      validator: (val){
                                        if(val!.isEmpty){
                                          return "enter password";
                                        }else{
                                          return null;
                                        }
                                      },
                                      onChanged:(val){
                                        setState(() {
                                          password=val;
                                        });
                                      },
                                    ),
                                    const SizedBox(height: 20,),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style:ElevatedButton.styleFrom(
                                            primary: Colors.black,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(30)
                                            )
                                        ) ,
                                        child: const Text("Sign Up",style: TextStyle(color:Colors.white,fontSize: 16),
                                        ),onPressed: (){
                                      },
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ][sel],


                        ],
                      ),
                    ),
                  ),),
              )
            ],
          ),
        ),
      ),
    );
  }

  pop(BuildContext context){
    String p="";
    Future.delayed(Duration.zero,(){
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          content: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Reset Password",style: TextStyle(fontSize: 20),),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Material(
                    color: Colors.transparent,
                    child: TextField(
                      onChanged: (val){
                        setState(() {
                          p=val;
                        });
                      },
                      style: const TextStyle(color:Colors.black ,fontSize: 25),
                      decoration: InputDecoration(
                          hintText: "enter email",
                          hintStyle: const TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color:Colors.green),
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child:  const Text("send email"),
              onPressed: () async {

              },),
            CupertinoDialogAction(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();

              },
            )
          ],
        ),
      );
    });
  }
}
