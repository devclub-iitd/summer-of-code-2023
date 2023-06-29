
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/Models/Product.dart';

class ProductDescription extends StatefulWidget {
  Product product;
  String category;
   ProductDescription({Key? key,required this.product,required this.category}) : super(key: key);

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
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
                    Text(widget.category,style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Icon(Icons.sort_outlined),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(15),
                          ),
                          image: DecorationImage(image: NetworkImage(widget.product.image),fit: BoxFit.fill)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,top: 10),
                        child: Row(
                          children: [
                            Text(widget.product.name,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                            Expanded(child: Container()),
                            Text("Rs."+widget.product.price.toString(),style: TextStyle(color: Colors.blue,fontSize: 18),),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(padding: EdgeInsets.only(left: 8),
                        child: Row(
                          children: [
                            Text(widget.product.desc,style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: 17),),
                          ],
                        )
                        ,)
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
