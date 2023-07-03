
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/Models/Product.dart';
import 'package:my_app/Utils/widgets.dart';
import 'package:my_app/homepage.dart';
import 'package:my_app/pages/product_description.dart';
import 'package:my_app/product_provider.dart';
import 'package:provider/provider.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:CheckOut() ,
      body: SafeArea(child: Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  Text("Shopping Cart",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Icon(Icons.more_horiz),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            CartProducts()
          ],
        ),
      )),
    );
  }


  Widget CartProducts(){
    return Consumer<ProductProvider>(
        builder: (context,data,child){
      return data.list.length==0?
          Container(
            child: Column(
              children: [
                Text("Cart is empty",style: GoogleFonts.roboto(fontWeight: FontWeight.w500,fontSize: 23),),
                SizedBox(height: 20,),
                Text("Let's find something special for you",style:TextStyle(fontSize: 20,color: Colors.grey),),
                SizedBox(height: 25,),
                GestureDetector(
                  onTap: (){
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                        builder: (context) =>  HomePage()), (Route route) => false);
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
          :Container(
        height: 500,
            child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
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
                            borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                          child: Icon(Icons.shopping_cart_outlined),
                        ),
                        Text("Items in your cart",style: GoogleFonts.roboto(fontWeight: FontWeight.w500,fontSize: 20),),
                        Text(data.list.length.toString(),style: TextStyle(color: Colors.blue,fontSize: 22,fontWeight: FontWeight.w400),)
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  ListView.builder(
        itemCount: data.size,
                  shrinkWrap: true,
                  itemBuilder: (context,i){
                  final product=data.products[i];
                  return GestureDetector(
                    onTap: (){
                      nextScreen(context, ProductDescription(product: product, category: product.Category));
                    },
                    child: ListTile(
                      leading: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          image: DecorationImage(image: NetworkImage(product.image),fit: BoxFit.fill)
                        ),
                      ),
                      title: Text(product.name,),
                      subtitle: Text("Rs. "+product.price,style: TextStyle(color: Colors.blue),),
                      trailing: GestureDetector(
                        onTap: (){
                          data.removeProduct(product);
                        },
                        child: Container(
                          height: 40,
                            width: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Icon(Icons.remove,color: Colors.red,),
                        ),
                      ),
                    ),
                  );

      }),

                ],
              ),
            ),
          );
    });
  }

  Widget CheckOut(){
    return Consumer<ProductProvider>(
      builder: (context,data,child){
        int priceSum=0;
        for(var i=0; i<data.size; i++){
          priceSum=priceSum+int.parse(data.products[i].price.split(".")[0]).toInt();
        }

        return data.size==0? Container(height: 1,):
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
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
              child: Text("Go to checkout -  Rs."+priceSum.toString(),style: TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.w600),
              ),
            ),
          ),
        );
      }

    );
  }

}
