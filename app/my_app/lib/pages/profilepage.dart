
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/pages/AddressDetails.dart';
import 'package:my_app/pages/CardPage.dart';
import 'package:my_app/pages/authpage.dart';
import 'package:my_app/pages/myorders.dart';
import 'package:my_app/pages/wishlistpage.dart';
import 'package:my_app/providers/userProvider.dart';
import 'package:provider/provider.dart';

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
    final user=context.watch<UserProvider>().user;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 28.0,),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue,
              child: profile(),
            ),
            title: Text(user.name,style: GoogleFonts.poppins(fontSize: 23),),
            subtitle: Text(user.email),
            trailing: InkWell(
              onTap: (){
                nextScreen(context, EditProfile());
              },
                child: Icon(Icons.edit)),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [

              const SizedBox(height: 30,),

              titledBox(["Orders","Wishlist"], [Icons.shopping_basket_outlined,Icons.favorite_outline_outlined], [MyOrders(),const WishListPage()]),
              titledBox(["Coupons","Help Center"], [Icons.card_giftcard_outlined,Icons.live_help_outlined], ["",""]),

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
                        GestureDetector(
                          onTap: (){
                            nextScreen(context, MyOrders());
                          },
                          child: Row(
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
                        ),
                        GestureDetector(
                          onTap: (){
                            nextScreen(context, WishListPage());
                          },
                          child: Row(
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
                        ),

                        GestureDetector(
                          onTap: (){
                            nextScreen(context, CardPage());
                          },
                          child: Row(
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
                        ),

                        GestureDetector(
                          onTap: (){
                            nextScreen(context, AddressDetails(onCheckOut: false));
                          },
                          child: Row(
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
                                      FirebaseAuth.instance.signOut();
                                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                                          builder: (context) =>  AuthPage()), (Route route) => false);
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
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget titledBox(List title,List<IconData> icons,List pages){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(
          bottom: 10
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              nextScreen(context, pages[0]);
            },
            child: Container(
              height: 50,
              width: (MediaQuery.of(context).size.width-29)*0.5,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration:  BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              child:  Row(
                children: [
                  Icon(icons[0],color: Colors.blue,),
                  SizedBox(width: 10,),
                  Text(title[0],style: const TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              nextScreen(context, pages[1]);
            },
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: (MediaQuery.of(context).size.width-29)*0.5,
              decoration:  BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              child:   Row(
                children: [
                  Icon(icons[1],color: Colors.blue,),
                  SizedBox(width: 10,),
                  Text(title[1],style: TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  profile(){
    final user=context.watch<UserProvider>().user;
    if( user.image==""){
      return Text(user.name.substring(0,1).toUpperCase(),style: TextStyle(fontSize: 25),);
    }else {
      return ClipOval(
        child: Image.network(user.image,height: 150,width: 150,fit: BoxFit.cover,),
      );
    }
  }
}
