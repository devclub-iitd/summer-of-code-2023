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
import '../providers/product_provider.dart';
import '../widgets/orders_item_widget.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  OrderApi orderApi = OrderApi();
  bool isLoading = true;

  getOrders(String email) {
    orderApi.getMyOrders(email, context).then((value) {
      Provider.of<ProductProvider>(context, listen: false).setOrders(value);
      isLoading = false;
      setState(() {});
    });
  }

  @override
  void initState() {
    getOrders(FirebaseAuth.instance.currentUser!.email!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final list = context.watch<ProductProvider>().orderList;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 35.0, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Card(
                  elevation: 10,
                  color: Colors.grey,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                ),
              ),
              Text(
                "Orders",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 20),
              ),
              GestureDetector(
                child: Card(
                  elevation: 10,
                  color: Colors.grey,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            )
          : (list.isNotEmpty)
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: list.length,
                            itemBuilder: (context, i) {
                              final order = list[i];
                              int items = 0;
                              for (var i = 0; i < order.quantity.length; i++) {
                                items += order.quantity[i];
                              }
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: OrdersItemWidget(
                                  order: order,
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                )
              : Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 200,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/e2.jpg"))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "No orders placed",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                            fontSize: 22),
                      ),
                    ],
                  ),
                ),
    );
  }
}
