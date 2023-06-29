
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back_ios,size: 25,),
                Text("My Cart",style: GoogleFonts.roboto(fontWeight: FontWeight.w600),),
                Icon(Icons.more_horiz_outlined,size: 25,)
              ],
            ),

          ],
        ),
      )),
    );
  }
}
