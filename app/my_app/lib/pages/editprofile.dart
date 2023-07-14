
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/ApiService/api.dart';
import 'package:my_app/ApiService/authApi.dart';
import 'package:my_app/Utils/widgets.dart';
import 'package:provider/provider.dart';

import '../Models/user.dart';
import '../providers/userProvider.dart';


class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isLoading=false;
  ImagePicker picker =ImagePicker();
  File? _image;
  late XFile pickedimage;
  ApiService apiService=ApiService();
  AuthApi api=AuthApi();
  String phone='';
  String name="";
  TextEditingController controller_name=TextEditingController();
  TextEditingController controller_phone=TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  updateProfile(BuildContext context){
    if(_image!=null){
      showSnakbar(context, Colors.blue, "Updating details ..please wait");
      final user=context.read<UserProvider>().user;
      api.uploadImage(_image).then((uri){
        apiService.updateAddress(context: context, email: user.email, name:name, address: user.address, image: uri, phone: phone).then((value) {
          final user=context.read<UserProvider>().user;
          if(value){
            User updated=User(user.id, controller_name.text, user.email, user.password, controller_phone.text, user.address, uri,user.suggestion);
            Provider.of<UserProvider>(context, listen: false).setUserFromModel(updated);
          }

        });
      });
    }else{
      showSnakbar(context, Colors.blue, "Updating details ..please wait");
      final user=context.read<UserProvider>().user;
      apiService.updateAddress(context: context, email: user.email, name:name, address: user.address, image: user.image, phone: phone).then((value) {
        final user=context.read<UserProvider>().user;
        if(value){
          User updated=User(user.id, name, user.email, user.password, phone, user.address, user.image,user.suggestion);
          Provider.of<UserProvider>(context, listen: false).setUserFromModel(updated);
        }

      });
    }
  }

  @override
  void initState() {
    super.initState();
    final user=context.read<UserProvider>().user;
    setState(() {
      name=user.name;
      phone=user.phone;
    });
  }



  @override
  Widget build(BuildContext context) {
    final user=context.watch<UserProvider>().user;
    return  Scaffold(
      key: _scaffoldKey,
        appBar:  AppBar(
          automaticallyImplyLeading: false,
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
                Text("Edit Profile",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
                GestureDetector(
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
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              updateProfile(_scaffoldKey.currentContext!);
            },
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black,Colors.black45],),
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
                    child: profile(),
                  ),
                  Positioned(
                    left: 90,
                    top: 100,
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

                      child:   const CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Center(
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
                      initialValue: user.name,
                      style: const TextStyle(fontSize: 20),
                      onChanged: (val){
                        setState(() {
                          name=val;
                        });
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.person,color:Color(0xff2E4237) ,),

                      ),

                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text("email ",textAlign:TextAlign.start,style: GoogleFonts.poppins(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff2E4237).withOpacity(0.2),
                        borderRadius: const BorderRadius.all(Radius.circular(20))
                    ),
                    child: TextFormField(
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.confirmation_num,color:Color(0xff2E4237) ,),

                      ),
                      initialValue: user.email,
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text("Phone",textAlign:TextAlign.start,style: GoogleFonts.poppins(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff2E4237).withOpacity(0.2),
                        borderRadius: const BorderRadius.all(Radius.circular(20))
                    ),
                    child: TextFormField(
                      style: const TextStyle(fontSize: 20),
                      onChanged: (val){
                        setState(() {
                          phone=val;
                        });
                      },
                      decoration:  const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock,color:Color(0xff2E4237) ,),


                      ),
                      initialValue: user.phone,
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
