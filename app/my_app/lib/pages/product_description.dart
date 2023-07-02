
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/Models/Product.dart';
import 'package:my_app/Utils/widgets.dart';
import 'package:my_app/pages/mycart.dart';
import 'package:my_app/product_provider.dart';
import 'package:provider/provider.dart';

class ProductDescription extends StatefulWidget {
  Product product;
  String category;
   ProductDescription({Key? key,required this.product,required this.category}) : super(key: key);

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  ProductProvider productProvider=ProductProvider();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
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
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                        child: Container(
                          height: 50,
                          width: 50,
                          child: const Icon(Icons.arrow_back_ios),
                        ),
                      ),
                    ),
                    Text(widget.category,style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
                    const Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Icon(Icons.favorite_border_outlined),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15,),
              Card(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                          borderRadius: const BorderRadius.all(Radius.circular(15),
                          ),
                          image: DecorationImage(image: NetworkImage(widget.product.image),fit: BoxFit.fill)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,top: 10),
                        child: Row(
                          children: [
                            Container(
                              width:250,
                                child: Text(widget.product.name,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 20),)),
                            Expanded(child: Container()),
                            Text("Rs. ${widget.product.price}",style: const TextStyle(color: Colors.blue,fontSize: 18),),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Padding(padding: const EdgeInsets.only(left: 8),
                        child: Text(widget.product.desc,style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: 17),)
                        ,),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                        RatingBar.builder(
                        initialRating: double.parse(widget.product.ratings),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),


                        ],
                      ),
                      const SizedBox(height: 10,),
                      Consumer<ProductProvider>(
                          builder: (context,data,child){

                        return GestureDetector(
                          onTap: (){
                            data.addProduct(widget.product);
                            nextScreen(context, const MyCart());
                            showSnakbar(context, Colors.green, "Added to your cart");
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
                            child: const Center(
                              child: Text("Add to Cart",style: TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        );
                          }
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
