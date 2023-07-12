
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/userProvider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool obscure=true;
  ImagePicker picker =ImagePicker();
  File? _image;
  late XFile pickedimage;

  @override
  Widget build(BuildContext context) {
    final user=context.watch<UserProvider>().user;
    return  Scaffold(
        appBar:  AppBar(
          title: Text("Edit Profile",style: GoogleFonts.poppins(fontSize: 25),),
          leading: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios,size: 28,color: Colors.white,)),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff88b49c), Color(0xff29353C)],),
            ),
          ),

        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff88b49c), Color(0xff29353C)],),
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              height: 50,
              child: const Center(
                child: Text("Update Profile",style: TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ),
        body:SafeArea(child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 15,),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 75,
                    backgroundColor:const Color(0xff2E4237) ,
                    child: profile(),
                  ),
                  Positioned(
                    left: 75,
                    top: 140,
                    child: GestureDetector(
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
                                      Text("Choose an option ):",style: TextStyle(color:Color(0xff2E4237),fontSize: 25,fontWeight: FontWeight.bold),),
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

                      child:   CircleAvatar(
                        backgroundColor: const Color(0xff2E4237).withOpacity(0.5),
                        child: const Center(
                          child: Icon(Icons.edit,color: Colors.white,),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name",textAlign:TextAlign.start,style: GoogleFonts.poppins(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff2E4237).withOpacity(0.2),
                        borderRadius: const BorderRadius.all(Radius.circular(20))
                    ),
                    child: TextFormField(
                      style: TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.person,color:Color(0xff2E4237) ,),

                      ),
                      initialValue: user.name,
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text("Entry No",textAlign:TextAlign.start,style: GoogleFonts.poppins(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff2E4237).withOpacity(0.2),
                        borderRadius: const BorderRadius.all(Radius.circular(20))
                    ),
                    child: TextFormField(
                      style: TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.confirmation_num,color:Color(0xff2E4237) ,),

                      ),
                      initialValue: "2022EE31760",
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text("Password",textAlign:TextAlign.start,style: GoogleFonts.poppins(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff2E4237).withOpacity(0.2),
                        borderRadius: const BorderRadius.all(Radius.circular(20))
                    ),
                    child: TextFormField(
                      obscureText: obscure,
                      style: TextStyle(fontSize: 20),
                      decoration:  InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock,color:Color(0xff2E4237) ,),
                          suffixIcon: InkWell(
                              onTap: (){
                                setState(() {
                                  obscure=!obscure;
                                });
                              },
                              child: Icon(obscure?Icons.visibility:Icons.visibility_off,color:Color(0xff2E4237) ,))

                      ),
                      initialValue: "783298cb",
                    ),
                  ),
                ],
              )


            ],
          ),
        ))
    );
  }

  profile(){
    final user=context.watch<UserProvider>().user;
    if(_image!=null || user.image==""){
      return _image!=null?ClipOval(
        child: Image.file(_image!,fit: BoxFit.cover,
          height: 150,width: 150,),
      ):Icon(Icons.account_circle,size: 150,color: Colors.grey[700],);
    }else {
      return ClipOval(
        child: Image.network(user.image,height: 150,width: 150,fit: BoxFit.cover,),
      );
    }
  }
}
