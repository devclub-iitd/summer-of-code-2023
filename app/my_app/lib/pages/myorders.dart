
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  Widget build(BuildContext context) {
    final user=context.watch<UserProvider>().user;
    return  Scaffold(
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
              Text("Orders",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
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
      body: isLoading?const Center(child: CircularProgressIndicator(color: Colors.grey,),):Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ListView.builder(
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
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      child: Row(
                        children: [
                          Container(
                            height:50,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(order.products[0].image))
                            ),
                          ),
                          SizedBox(width: 15,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(order.id,style: TextStyle(color:Colors.blue),),
                              Text("Total price- ${order.totalPrice.toString()}"),
                              Text("$items items "),

                            ],
                          )
                        ],
                      ),
                    ),
                  );
            }),
          )
        ],
      ),
    );
  }
}
