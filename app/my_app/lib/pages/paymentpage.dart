
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/ApiService/ordersApi.dart';
import 'package:my_app/Utils/widgets.dart';
import 'package:my_app/pages/orderpage.dart';
import 'package:my_app/providers/userProvider.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentPage extends StatefulWidget {
  int price;
   PaymentPage({Key? key,required this.price}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  List<Step> stepList() => [
    Step(title: const Text('Address'), content: const SizedBox(height: 1,), isActive: currentStep > 0,
      state: currentStep > 0
          ? StepState.complete
          : StepState.indexed,),
    Step(title: const Text('Details'), content: const SizedBox(height: 1,), isActive: currentStep > 1,
      state: currentStep > 1
          ? StepState.complete
          : StepState.indexed,),
    Step(title: const Text('Payment'), content: const SizedBox(height: 1,), isActive: currentStep > 2,
      state: currentStep > 2
          ? StepState.complete
          : StepState.editing,),
  ];
  final _razorpay = Razorpay();
  int currentStep=2;
  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();

  }
  OrderApi api=OrderApi();
  placeOrder(){
    final user=context.read<UserProvider>().user;
    api.placeOrderFromCart(context: context, email: user.email, price: widget.price.toString(), address: address(user.address)).then((value) {
      if(value.id.isNotEmpty){
        nextScreenReplace(context, OrderDetailPage(order: value));
      }else{
      }
    });
  }

  String address(List add){
    String ad='';
    for(var i=0;i<add.length;i++){
      ad+="${add[i]} ";
    }
    return ad;
  }
  Map<String,dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    final user=context.watch<UserProvider>().user;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace:Padding(
          padding: const EdgeInsets.only(top: 35,left: 10,right: 10),
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
              Text("Payment ",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
              GestureDetector(
                child: Card(
                  elevation: 10,color: Colors.grey,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: const Icon(Icons.qr_code_outlined),
                  ),
                ),
              ),
            ],
          ),
        ),

        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: Theme(
                  data: ThemeData(

                      colorScheme: const ColorScheme.light(
                          primary: Colors.blue,
                          secondary: Colors.green,
                        background: Colors.red
                      )
                  ),
                  child: Stepper(
                    type: StepperType.horizontal,
                    currentStep: currentStep,
                    physics: const ScrollPhysics(),
                    steps: stepList(),
                  ),
                ),
              ),


               Card(
                 shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Choose mode of payment",style: GoogleFonts.poppins(fontSize: 20),),
                       SizedBox(height: 10,),
                       GestureDetector(
                         onTap: (){
                           var options = {
                             'key': 'rzp_test_lNxhLSjt3K4Aaa',
                             'amount': widget.price *100,
                             'name': 'Test',
                             'description': 'T-Shirt',
                             'prefill': {
                               'contact': '${user.phone}',
                               'email': 'aditya7903928568@gmail.com'
                             }
                           };
                           try{
                             _razorpay.open(options);
                           }catch(e){
                             print(e.toString());
                           }
                         },
                         child: Container(
                           padding: EdgeInsets.all(10),
                           decoration: BoxDecoration(
                               color: Colors.grey.withOpacity(0.2),
                               border: Border.all(color: Colors.black.withOpacity(0.1)),
                               borderRadius: const BorderRadius.all(Radius.circular(5),)
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("Debit/Credit Card",style: GoogleFonts.roboto(fontSize: 18,color: Colors.blue),),
                               Icon(Icons.credit_card_outlined,color: Colors.red,),

                             ],
                           )
                         ),
                       ),
                       SizedBox(height: 10,),
                       GestureDetector(
                         onTap: (){
                           var options = {
                             'key': 'rzp_test_lNxhLSjt3K4Aaa',
                             'amount': widget.price *100,
                             'name': 'Test',
                             'description': 'T-Shirt',
                             'prefill': {
                               'contact': '9341246568',
                               'email': 'aditya7903928568@gmail.com'
                             }
                           };
                           try{
                             _razorpay.open(options);
                           }catch(e){
                             print(e.toString());
                           }
                         },
                         child: Container(
                             padding: EdgeInsets.all(10),
                           decoration: BoxDecoration(
                               color: Colors.grey.withOpacity(0.2),
                               border: Border.all(color: Colors.black.withOpacity(0.1)),
                               borderRadius: const BorderRadius.all(Radius.circular(5),)
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("Internet Banking",style: GoogleFonts.roboto(fontSize: 18,color: Colors.blue,),),
                               Icon(Icons.account_balance_outlined,color: Colors.red,),

                             ],
                           )
                         ),
                       ),
                       SizedBox(height: 10,),
                       GestureDetector(
                         onTap: (){
                           var options = {
                             'key': 'rzp_test_lNxhLSjt3K4Aaa',
                             'amount': widget.price *100,
                             'name': 'Test',
                             'description': 'T-Shirt',
                             'prefill': {
                               'contact': '9341246568',
                               'email': 'aditya7903928568@gmail.com'
                             }
                           };
                           try{
                             _razorpay.open(options);
                           }catch(e){
                             print(e.toString());
                           }
                         },
                         child: Container(
                             padding: EdgeInsets.all(10),
                           decoration: BoxDecoration(
                               color: Colors.grey.withOpacity(0.2),
                               border: Border.all(color: Colors.black.withOpacity(0.1)),
                               borderRadius: const BorderRadius.all(Radius.circular(5),)
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("Google-Pay/Paytm/PhonePe",style: GoogleFonts.roboto(fontSize: 18,color: Colors.blue,),),
                               Icon(Icons.qr_code_scanner_rounded,color: Colors.red,)
                             ],
                           )
                         ),
                       ),
                       SizedBox(height: 10,),
                       GestureDetector(
                         onTap: (){

                         },
                         child: Container(
                             padding: EdgeInsets.all(10),
                           decoration: BoxDecoration(
                               color: Colors.grey.withOpacity(0.2),
                               border: Border.all(color: Colors.black.withOpacity(0.1)),
                               borderRadius: const BorderRadius.all(Radius.circular(5),)
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("Cash on Delivery",style: GoogleFonts.roboto(fontSize: 18,color: Colors.blue,),),
                               Icon(Icons.currency_rupee_outlined,color: Colors.red,)
                             ],
                           )
                         ),
                       ),
                     ],
                   ),
                 ),
               )


            ],
          ),
        ),
      ),
    );
  }
  void _handlePaymentSuccess(PaymentSuccessResponse response){
    showSnakbar(context, Colors.green, "Payment Successful Placing your order");
    placeOrder();
  }

  void _handlePaymentError(PaymentFailureResponse response){
    showSnakbar(context, Colors.red, "${response.code} ${response.message}");
  }
  void _handleExternalWallet(ExternalWalletResponse response){
    showSnakbar(context, Colors.blue, "${response.walletName} ");
  }






}
