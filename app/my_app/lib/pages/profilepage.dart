
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/widgets.dart';
import 'editprofile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Color colorP=Colors.black;
  Color colorS=Colors.black45;
  double font=17 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 190,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 140,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black, Colors.black45],),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40,left: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            const SizedBox(width: 10,),
                            Text("Profile",textAlign: TextAlign.center,style: GoogleFonts.poppins(color: Colors.white,fontSize: 25),),
                            Expanded(child: Container()),
                            IconButton(onPressed: (){
                              HapticFeedback.heavyImpact();
                            }, icon:const Icon( Icons.sort,color: Colors.white,size: 25,),),
                            const SizedBox(width: 10,),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CircleAvatar(
                        radius: 54,
                        backgroundColor:Colors.black ,
                        child: ClipOval(
                          child: Image.asset("assets/photo.jpg",height: 100,width: 100,fit: BoxFit.cover,),

                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text("Aditya",style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 25),),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  HapticFeedback.heavyImpact();
                  nextScreen(context, const EditProfile());
                },
                child: Container(
                  width: 150,
                  height: 40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.black],),
                  ),
                  child: const Center(child: Text("Edit Profile",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20,),)),
                ),
              ),
              const SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shadowColor: Colors.black,
                  elevation: 10,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Column(
                      children: [

                        Row(
                          children: [
                            Text("Account Settings",style: GoogleFonts.roboto(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                            Expanded(child: Container()),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 28,
                              width: 28,
                              decoration: const BoxDecoration(

                                  borderRadius: BorderRadius.all(Radius.circular(8))
                              ),
                              child: Icon(Icons.shopping_bag_outlined,color:colorP ,),),
                            const SizedBox(width: 15,),
                            Text("My orders ",style: GoogleFonts.roboto(color: Colors.black,fontSize: font),),

                            Expanded(child: Container()),
                            Center(
                              child: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios,color: Colors.black,)),
                            )

                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 28,
                              width: 28,
                              decoration: const BoxDecoration(

                                  borderRadius: BorderRadius.all(Radius.circular(8))
                              ),
                              child: Icon(Icons.favorite_border_outlined,color:colorP ,),),
                            const SizedBox(width: 15,),
                            Text("Wishlist ",style: GoogleFonts.roboto(color: Colors.black,fontSize: font),),

                            Expanded(child: Container()),
                            Center(
                              child: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios,color: Colors.black,)),
                            )

                          ],
                        ),

                        Row(
                          children: [
                            Container(
                              height: 28,
                              width: 28,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(8))
                              ),
                              child:  Icon(Icons.credit_card_outlined,color:colorP ,),),
                            const SizedBox(width: 15,),
                            Text("Saved Cards & Wallet",style: GoogleFonts.roboto(color: Colors.black,fontSize: font),),
                            Expanded(child: Container()),
                            Center(
                              child: IconButton(onPressed: (){

                              }, icon: const Icon(Icons.arrow_forward_ios,color: Colors.black,)),
                            )
                          ],
                        ),

                        Row(
                          children: [
                            Container(
                              height: 28,
                              width: 28,
                              decoration: const BoxDecoration(

                                  borderRadius: BorderRadius.all(Radius.circular(8))
                              ),
                              child: Icon(Icons.location_on_outlined,color:colorP ,),),
                            const SizedBox(width: 15,),
                            Text("Saved Addresses",style: GoogleFonts.roboto(color: Colors.black,fontSize: font),),

                            Expanded(child: Container()),
                            Center(
                              child: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios,color: Colors.black,)),
                            )

                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 28,
                              width: 28,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(8))
                              ),
                              child:
                              Icon(Icons.language_outlined,color:colorP ,),),
                            const SizedBox(width: 15,),
                            Text("Select Language",style: GoogleFonts.roboto(color: Colors.black,fontSize: font),),

                            Expanded(child: Container()),
                            Center(
                              child: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios,color: Colors.black,)),
                            )

                          ],
                        ),
                        const SizedBox(height: 10,),

                        Row(
                          children: [
                            Container(
                              height: 28,
                              width: 28,
                              decoration: const BoxDecoration(

                                  borderRadius: BorderRadius.all(Radius.circular(8))
                              ),
                              child: Icon(Icons.notifications_outlined,color:colorP ,),),
                            const SizedBox(width: 15,),
                            Text("Notification Settings",style: GoogleFonts.roboto(color: Colors.black,fontSize: font),),

                            Expanded(child: Container()),
                            Center(
                              child: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios,color: Colors.black,)),
                            )

                          ],
                        ),
                        const SizedBox(height: 10,),
                        const Divider(height: 2,color: Colors.grey,),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            Text("Feedback & Information",style: GoogleFonts.roboto(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                            Expanded(child: Container()),
                          ],
                        ),

                        Row(
                          children: [
                            Container(
                              height: 28,
                              width: 28,
                              decoration: const BoxDecoration(

                                  borderRadius: BorderRadius.all(Radius.circular(8))
                              ),
                              child:
                              Icon(Icons.privacy_tip_outlined,color:colorP ,),),
                            const SizedBox(width: 15,),
                            Text("Privacy Policies",style: GoogleFonts.roboto(color: Colors.black,fontSize: font),),
                            Expanded(child: Container()),
                            Center(
                              child: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios,color: Colors.black,)),
                            )

                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 28,
                              width: 28,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(8))
                              ),
                              child: Icon(Icons.language_outlined,color:colorP ,),),
                            const SizedBox(width: 15,),
                            Text("Select Language",style: GoogleFonts.roboto(color: Colors.black,fontSize: font),),

                            Expanded(child: Container()),
                            Center(
                              child: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios,color: Colors.black,)),
                            )

                          ],
                        ),
                        const SizedBox(height: 15,),
                        GestureDetector(
                          onTap: (){
                            showCupertinoDialog(
                              context: context,
                              builder: (context) => CupertinoAlertDialog(
                                content:  Text("Are you sure you want to logout?",style: GoogleFonts.poppins(fontSize: 17),),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                                    child:  Text("Log out",style: GoogleFonts.poppins(fontSize: 15),),
                                    onPressed: () {

                                    },
                                  ),
                                  CupertinoDialogAction(
                                    child:  Text('Cancel',style: GoogleFonts.poppins(fontSize: 15),),
                                    onPressed: () {
                                      HapticFeedback.heavyImpact();
                                      // Dismiss the dialog but don't
                                      // dismiss the swiped item
                                      return Navigator.of(context).pop(false);
                                    },
                                  )
                                ],
                              ),
                            );
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
                            child: const Center(
                              child: Text("Log Out",style: TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),

                      ],
                    ),
                  ),
                ),
              ),],
          ),
        ),
      ),
    );
  }
}
