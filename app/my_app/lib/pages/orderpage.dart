
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_app/ApiService/CartApi.dart';
import 'package:my_app/pages/searchPage.dart';
import 'package:provider/provider.dart';

import '../Models/order.dart';
import '../Utils/widgets.dart';
import '../providers/product_provider.dart';


class OrderDetailPage extends StatefulWidget {
  final Order order;
  const OrderDetailPage({Key? key,required this.order}) : super(key: key);

  @override
  State<OrderDetailPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderDetailPage> {
  CartApiService cartApiService=CartApiService();
  int currentStep = 0;
  @override
  void initState() {
    cartApiService.getMyCart(FirebaseAuth.instance.currentUser!.email!, context).then((value) {
      Provider.of<ProductProvider>(context, listen: false).setCartLength(value[2]);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
              ),
              Text("Order Details",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
              GestureDetector(
                onTap: (){
                  nextScreen(context, SearchPage());
                },
                child: Card(
                  elevation: 10,color: Colors.grey,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Icon(Icons.search_outlined),
                  ),
                ),
              ),
            ],
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Order Date: ',style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.w500),),
                      Text(DateFormat.yMMMMd().format(DateTime.fromMillisecondsSinceEpoch(widget.order.orderedAt)),style: GoogleFonts.roboto(fontSize: 17,),),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Order ID: ',style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.w500),),
                      Text(widget.order.id.toString(),style: GoogleFonts.roboto(fontSize: 17,),),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Total price: ',style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.w500),),
                      Text("Rs. "+widget.order.totalPrice.toString(),style: GoogleFonts.roboto(fontSize: 17,),),
                    ],
                  ),


                  const SizedBox(height: 10),
                  const Text(
                    'Purchase Details',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black45,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Card(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (int i = 0; i < widget.order.products.length; i++)
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  widget.order.products[i].image,
                                  height: 90,
                                  width: 90,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.order.products[i].title,
                                      style: const TextStyle(
                                        fontSize: 17,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'Qty: ${widget.order.quantity[i]}',
                                    ),
                                    Text("Rs. " +widget.order.products[i].price)
                                  ],
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Tracking',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Card(

                    child: Theme(
                      data: ThemeData(
                        accentColor: Colors.blue,
                          colorScheme: const ColorScheme.light(
                              primary: Colors.blue,
                              secondary: Colors.green,
                              background: Colors.red
                          )
                      ),
                      child: Stepper(
                        currentStep: widget.order.status+1,
                        controlsBuilder: (context, details) {
                          return const SizedBox();
                        },
                        steps: [
                          Step(
                            title:  Row(
                              children: [
                                Text('Order Received -',style: TextStyle(color: Colors.green),),
                                Text(' ${DateFormat.yMMMMd().format(DateTime.fromMillisecondsSinceEpoch(widget.order.orderedAt))}',style: TextStyle(color: Colors.green),),
                              ],
                            ),
                            content:  Text(
                              DateFormat.yMMMMd().format(DateTime.fromMillisecondsSinceEpoch(widget.order.orderedAt)),
                              style: TextStyle(color: Colors.blue),
                            ),
                            isActive: widget.order.status > 0,
                            state: StepState.complete,
                          ),
                          Step(
                            title: const Text('Order confirmed'),
                            content: const Text(
                              'Your order is being confirmed',
                            ),
                            isActive: widget.order.status+1 > 1,
                            state: widget.order.status+1 > 1
                                ? StepState.complete
                                : StepState.indexed,
                          ),
                          Step(
                            title: const Text('Shipped'),
                            content: const Text(
                              'Your order has been shipped',
                            ),
                            isActive: widget.order.status+1 > 2,
                            state: widget.order.status+1 > 2
                                ? StepState.complete
                                : StepState.indexed,
                          ),
                          Step(
                            title: const Text('Out for delivery'),
                            content: const Text(
                              'Your order is on the way for delivery',
                            ),
                            isActive: widget.order.status+1 >= 3,
                            state: widget.order.status+1 >= 3
                                ? StepState.complete
                                : StepState.indexed,
                          ),
                          Step(
                            title: const Text('Delivered'),
                            content: const Text(
                              'Your order has been delivered',
                            ),
                            isActive: widget.order.status+1 >= 3,
                            state: widget.order.status+1 >= 3
                                ? StepState.complete
                                : StepState.indexed,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
