
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/Models/cartItem.dart';
import 'package:my_app/Utils/widgets.dart';
import 'package:my_app/homepage.dart';
import 'package:my_app/pages/AddressDetails.dart';
import 'package:my_app/pages/CheckOutPage.dart';
import 'package:my_app/pages/product_description.dart';
import 'package:my_app/pages/searchPage.dart';
import 'package:provider/provider.dart';
import '../ApiService/CartApi.dart';
import '../providers/product_provider.dart';
import '../providers/userProvider.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  List<CartItem>list=[];
  bool isLoading=true;
  int priceSum=0;
  CartApiService cartApiService=CartApiService();

  @override
  void initState() {
    super.initState();
   getCart();
  }
  getCart(){
    cartApiService.getMyCart("adi@gmail.com",context).then((value){
      Provider.of<ProductProvider>(context, listen: false).setCartLength(value[2]);
      setState(() {
        list=value[0];
        priceSum=value[1];
        isLoading=false;
      });

    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar:CheckOut() ,
      appBar: AppBar(
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
              Text("My Cart",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
              GestureDetector(
                onTap: (){
                  nextScreen(context, const SearchPage());
                },
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
      body: isLoading?Center(child: CircularProgressIndicator(),): SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  const SizedBox(height: 15,),
                  CartProducts()
                ],
              ),
            ),
          ),

    );
  }


  Widget CartProducts(){
    final cl=context.watch<ProductProvider>().cartLength;
    return isLoading?const Center(child: CircularProgressIndicator(color: Colors.grey,)):list.isEmpty?
    Container(
      child: Column(
        children: [
          Text("Cart is empty",style: GoogleFonts.roboto(fontWeight: FontWeight.w500,fontSize: 23),),
          const SizedBox(height: 20,),
          const Text("Let's find something special for you",style:TextStyle(fontSize: 20,color: Colors.grey),),
          const SizedBox(height: 25,),
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                  builder: (context) =>  const HomePage()), (Route route) => false);
            },
            child: Container(
              width: 250,
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
                child: Text("start Shopping",style: TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    )
        :SizedBox(
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
                  itemCount: list.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context,i){
                  final product=list[i].product;
                  return GestureDetector(
                    onTap: (){
                      nextScreen(context, ProductDescription(product: product, category: product.category,isMYProduct: false,));
                    },
                    child: Slidable(
                      startActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children:  [
                          SlidableAction(
                            onPressed: (context){

                            },
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.red,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                          SlidableAction(
                            onPressed: (context){
                            },
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF21B7CA),
                            icon: Icons.share,
                            label: 'Share',
                          ),
                        ],
                      ),

                      child: ListTile(
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
                            Text(" X ${list[i].count}",style: const TextStyle(color: Colors.black,fontSize: 15),),
                          ],
                        ),
                        trailing: GestureDetector(
                          onTap: (){
                            cartApiService.removeFromCart(context: context, userId: "adi@gmail.com", id: product.id).then((value) {
                              if(value){
                                getCart();
                              }
                            });



                          },
                          child: Container(
                            height: 40,
                              width: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                            ),
                            child: const Icon(Icons.remove,color: Colors.red,),
                          ),
                        ),
                      ),
                    ),
                  );

      }),

                ],
              ),
            ),
          );

  }

  Widget CheckOut(){
    final user=context.watch<UserProvider>().user;
    return isLoading?Container(height: 1,):list.isEmpty? Container(height: 1,):
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: GestureDetector(
            onTap: (){
              if(user.address.isEmpty){
                nextScreen(context, AddressDetails(onCheckOut: true));
              }else{
                nextScreen(context,  CheckOutPage(orders: list,));
              }
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
              child:  Center(
                child: Text("Go to checkout -  Rs.$priceSum",style: const TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        );

  }

}
