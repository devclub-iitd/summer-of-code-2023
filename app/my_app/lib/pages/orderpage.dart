
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/pages/searchPage.dart';

import '../Models/order.dart';
import '../Utils/widgets.dart';
import 'package:intl/intl.dart';

class OrderDetailPage extends StatefulWidget {
  final Order order;
  const OrderDetailPage({Key? key,required this.order}) : super(key: key);

  @override
  State<OrderDetailPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderDetailPage> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
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
                  elevation: 10,
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
        backgroundColor: Colors.white,
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
                  Text('Order Date:      ${DateFormat().format(
                    DateTime.fromMillisecondsSinceEpoch(
                        widget.order.orderedAt),
                  )}'),
                  Text('Order ID:          ${widget.order.id}'),
                  Text('Order Total:      \$${widget.order.totalPrice}'),

                  const SizedBox(height: 10),
                  const Text(
                    'Purchase Details',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (int i = 0; i < widget.order.products.length; i++)
                          Row(
                            children: [
                              Image.network(
                                widget.order.products[i].image,
                                height: 120,
                                width: 120,
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.order.products[i].title,
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'Qty: ${widget.order.quantity[i]}',
                                    ),
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
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                    ),
                    child: Stepper(
                      currentStep: currentStep,
                      controlsBuilder: (context, details) {
                        return const SizedBox();
                      },
                      steps: [
                        Step(
                          title: const Text('Pending'),
                          content: const Text(
                            'Your order is yet to be delivered',
                          ),
                          isActive: currentStep > 0,
                          state: currentStep > 0
                              ? StepState.complete
                              : StepState.indexed,
                        ),
                        Step(
                          title: const Text('Completed'),
                          content: const Text(
                            'Your order has been delivered, you are yet to sign.',
                          ),
                          isActive: currentStep > 1,
                          state: currentStep > 1
                              ? StepState.complete
                              : StepState.indexed,
                        ),
                        Step(
                          title: const Text('Received'),
                          content: const Text(
                            'Your order has been delivered and signed by you.',
                          ),
                          isActive: currentStep > 2,
                          state: currentStep > 2
                              ? StepState.complete
                              : StepState.indexed,
                        ),
                        Step(
                          title: const Text('Delivered'),
                          content: const Text(
                            'Your order has been delivered and signed by you!',
                          ),
                          isActive: currentStep >= 3,
                          state: currentStep >= 3
                              ? StepState.complete
                              : StepState.indexed,
                        ),
                      ],
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
