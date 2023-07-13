
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

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
          : StepState.indexed,),
  ];
  int currentStep=2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              Text("Payment ",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
              GestureDetector(
                child: Card(
                  elevation: 10,
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
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(

            children: [
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: Stepper(
                  type: StepperType.horizontal,
                  currentStep: currentStep,
                  physics: const ScrollPhysics(),
                  steps: stepList(),
                ),
              ),


               Expanded(
                child: Card(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),)),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            border: Border.all(color: Colors.black.withOpacity(0.3)),
                            borderRadius: const BorderRadius.all(Radius.circular(5),)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Debit/Credit Card",style: GoogleFonts.roboto(fontSize: 18),),
                            Icon(Icons.credit_card_outlined,color: Colors.blue,),

                          ],
                        )
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            border: Border.all(color: Colors.black.withOpacity(0.3)),
                            borderRadius: const BorderRadius.all(Radius.circular(5),)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Internet Banking",style: GoogleFonts.roboto(fontSize: 18),),
                            Icon(Icons.account_balance_outlined,color: Colors.blue,),

                          ],
                        )
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            border: Border.all(color: Colors.black.withOpacity(0.3)),
                            borderRadius: const BorderRadius.all(Radius.circular(5),)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Google-Pay/Paytm/PhonePe",style: GoogleFonts.roboto(fontSize: 18),),
                            
                          ],
                        )
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            border: Border.all(color: Colors.black.withOpacity(0.3)),
                            borderRadius: const BorderRadius.all(Radius.circular(5),)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Cash on Delivery",style: GoogleFonts.roboto(fontSize: 18),),
                            Icon(Icons.currency_rupee_outlined,color: Colors.blue,)
                          ],
                        )
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
}
