
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/Models/cartItem.dart';
import 'package:my_app/Utils/widgets.dart';
import 'package:my_app/pages/AddressDetails.dart';
import 'package:my_app/providers/userProvider.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class CheckOutPage extends StatefulWidget {
  List<CartItem> orders;
   CheckOutPage({Key? key,required this.orders}) : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
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
  int currentStep=1;
  @override
  Widget build(BuildContext context) {
    final user=context.watch<UserProvider>().user;
    return  Scaffold(
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
              Text("Order Summary",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
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
      body: SingleChildScrollView(
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
            Card(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0).copyWith(top: 15,right: 5,left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Saved Address",style: GoogleFonts.roboto(fontSize: 20,color: Colors.blue),),
                        InkWell(
                            onTap: (){
                              nextScreenReplace(context, AddressDetails(onCheckOut: true,orders: widget.orders,));
                            },
                            child: const Icon(Icons.edit)),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                        width: MediaQuery.of(context).size.width,
                        child: Text(user.address.isEmpty?"No saved address":user.address,style: const TextStyle(fontSize: 18),)),
                  ),
                ],
              ),
            ),
            cartProducts(),
            const SizedBox(height: 10,),
            Text("Have a coupon Code?enter here",style: GoogleFonts.poppins(fontSize: 18),),
            const SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  border: Border.all(color: Colors.black.withOpacity(0.3)),
                  borderRadius: const BorderRadius.all(Radius.circular(5),)
              ),
              child: TextFormField(
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                  border: InputBorder.none, ),

              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Subtotal:",style: TextStyle(fontSize: 18),),
                const Text("Price",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),

              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const[
                 Text("Delivery Fee:",style: TextStyle(fontSize: 18),),
                 Text("Price",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),

              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const[
                 Text("Discount:",style: TextStyle(fontSize: 18),),
                 Text("Price",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),

              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                for(int i=0;i<90;i++)
                  i.isEven?Container(
                    width: 3,
                    height: 1,
                    decoration: BoxDecoration(
                        color: Color(0xFF839fed),
                        borderRadius: BorderRadius.circular(2)
                    ),
                  ):Container( width: 3,
                    height: 1,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2)
                    ),)
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const[
                Text("Total:",style: TextStyle(fontSize: 18),),
                Text("Price",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.blue),),

              ],
            ),

          ],
        ),
      ),
    );
  }
  cartProducts(){
    final cl=context.watch<ProductProvider>().cartLength;
    return SizedBox(
      child: Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,

                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: const BorderRadius.all(Radius.circular(15))
                    ),
                    child: const Icon(Icons.shopping_cart_outlined),
                  ),
                  Text("Items in your cart",style: GoogleFonts.roboto(fontWeight: FontWeight.w500,fontSize: 20),),
                  Text(cl.toString(),style: const TextStyle(color: Colors.blue,fontSize: 22,fontWeight: FontWeight.w400),)
                ],
              ),
            ),
            const SizedBox(height: 10,),
            ListView.builder(
                itemCount: widget.orders.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context,i){
                  final product=widget.orders[i].product;
                  return ListTile(
                    leading: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          image: DecorationImage(image: NetworkImage(product.image),fit: BoxFit.contain)
                      ),
                    ),
                    title: Text(product.title,),
                    subtitle: Row(
                      children: [
                        Text("Rs. ${product.price}",style: const TextStyle(color: Colors.blue),),
                        const SizedBox(width: 5,),
                        Text(" X ${widget.orders[i].count}",style: const TextStyle(color: Colors.black,fontSize: 15),),
                      ],
                    ),
                  );

                }),

          ],
        ),
      ),
    );
  }
}
