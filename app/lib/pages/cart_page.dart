import 'dart:convert';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter/material.dart';
import 'package:myproject/core/store.dart';
import 'package:myproject/models/cart.dart';
// ignore: unused_import
import 'package:myproject/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}
//Map<String, dynamic>? paymentIntentData;
class _CartPageState extends State<CartPage> {
  Map<String, dynamic>? paymentIntentData;
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final CartModel _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.xl2.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          //final CartModel _cart = (VxState.store as MyStore).cart;
          SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
           VxBuilder(
            // ignore: prefer_const_literals_to_create_immutables
            mutations: {RemoveMutation},
            builder: (context,_,__){
              return "\$${_cart.totalPrice}" .text
                  .xl5
                  .color(context.theme.hintColor)
                  .make();
            },
          ),
          30.widthBox,
          InkWell(
            onTap: (){
               ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please try after sometime")),
      );
               makePayment(context);
            },
            child: Container(
  height: 35,
  width: 45,
  decoration: BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.circular(10.0),
  ),
  child: "Buy".text.xl2.center.white.make(),
).w32(context),
          )
        ],
      ),
    
        ),
     ] ),
    );
  }

  Future<void> makePayment(BuildContext context) async {
    try {
      final paymentIntentData = await createPaymentIntent('20', 'USD');
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData['client_secret'],
        ),
      );

      // ignore: use_build_context_synchronously
      await displayPaymentSheet(context);
    } catch (e, s) {
      print('Payment exception: $e $s');
    }
  }

  Future<void> displayPaymentSheet(BuildContext context) async {
    try {
      await Stripe.instance.presentPaymentSheet();

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Paid successfully")),
      );
    } on StripeException {
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          content: Text("Cancelled"),
        ),
      );
    } catch (e) {
      print('$e');
    }
  }
  Future<Map<String, dynamic>> createPaymentIntent(String amount, String currency) async {
  try {
    final body = {
      'amount': calculateAmount(amount),
      'currency': currency,
      'payment_method_types[]': 'card',
    };

    final response = await http.post(
      Uri.parse('https://api.stripe.com/v1/payment_intents'),
      body: body,
      headers: {
        'Authorization': 'Bearer sk_test_51NNuSiSCO0sVI4p6Wa2757Eruo6DXnZdgqjAsBUyGkW9xOFgJ0e61NvvRSS51foFNub97nLOfH5ivHKnDkIRhGNc00N8C4OXgT',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create payment intent');
    }
  } catch (err) {
    print('Error creating payment intent: $err');
    rethrow;
  }
}


  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}
// class _CartTotal extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//   // ignore: no_leading_underscores_for_local_identifiers
//   final CartModel _cart = (VxState.store as MyStore).cart;
//     return SizedBox(
//       height: 200,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//            VxBuilder(
//             // ignore: prefer_const_literals_to_create_immutables
//             mutations: {RemoveMutation},
//             builder: (context,_,__){
//               return "\$${_cart.totalPrice}" .text
//                   .xl5
//                   .color(context.theme.hintColor)
//                   .make();
//             },
//           ),
//           30.widthBox,
//           InkWell(
//             onTap: ()async{
//               await makePayment();
//             },
//             child: Container(
//               height: 30,
//               width: 50,
//               decoration: const BoxDecoration(
//                 color: Colors.black
//               ),
//               child: "Buy".text.xl.white.make(),
//             ).w32(context),
//           )
//         ],
//       ),
//     );
//   }
  
//   }
class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    // ignore: no_leading_underscores_for_local_identifiers
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              // ignore: prefer_const_constructors
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () => RemoveMutation(_cart.items[index]),
              ),
              title: _cart.items[index].toString().text.bold.make(),
            ),
          );
  }
}