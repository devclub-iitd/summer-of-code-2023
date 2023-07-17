
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_app/Utils/widgets.dart';
import 'package:my_app/pages/orderpage.dart';
import 'package:my_app/providers/userProvider.dart';
import 'package:provider/provider.dart';

import '../ApiService/ordersApi.dart';
import '../Models/order.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  List<Order> list=[];
  OrderApi orderApi=OrderApi();
  bool isLoading=true;


  getOrders(String email){
    orderApi.getMyOrders(email, context).then((value){
      list=value;
      isLoading=false;
      setState(() {

      });

    });
  }

  @override
  void initState() {
    getOrders(FirebaseAuth.instance.currentUser!.email!);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final user=context.watch<UserProvider>().user;
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
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
              Text("Orders",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
              GestureDetector(
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
      body: isLoading?const Center(child: CircularProgressIndicator(color: Colors.grey,),)
          :(list.isNotEmpty)?Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ListView.builder(
              shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context,i){
                  final order=list[i];
                  int items=0;
                  for(var i=0;i<order.quantity.length;i++){
                    items+=order.quantity[i];
                  }
                  return GestureDetector(
                    onTap: (){
                      nextScreen(context, OrderDetailPage(order: order));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        child: Row(
                          children: [
                            Container(
                              height:70,
                              width: 70,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage(order.products[0].image))
                              ),
                            ),
                            SizedBox(width: 15,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(order.id,style: TextStyle(color:Colors.blue),),
                                Row(
                                  children: [
                                    Text("Rs. ${order.totalPrice.toString()}"),
                                  ],
                                ),
                                Text("$items items "),
                                Text( DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch(order.orderedAt)))

                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
            }),
          )
        ],
      ):Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(height: 200,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/e2.jpg"))),),
            SizedBox(height: 20,),
            Text("No orders placed",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500,fontSize: 22),),
          ],
        ),
      ),
    );
  }
}
