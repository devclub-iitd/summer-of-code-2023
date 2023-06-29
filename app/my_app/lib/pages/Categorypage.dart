
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryPage extends StatefulWidget {
  String name;

  CategoryPage({Key? key,required this.name}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int i=1;
  List productList=[];
  List HeadPhone=["hp1.png","hp2.png","hp3.png","hp4.png","hp5.png"];
  IconData like=Icons.favorite_border_outlined;
  Color likedColor=Colors.black12;

  @override
  void initState() {
    super.initState();
    getData();
  }
  getData() async {
    await DefaultAssetBundle.of(context).loadString("json/"+widget.name+".json").then((value) {
      setState(() {
        productList = json.decode(value);
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
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
                  Text(widget.name,style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      i=0;
                    });
                  },
                  child: Card(
                    elevation: i==0?5:0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Container(
                        height: 40,
                        padding: EdgeInsets.all(8).copyWith(left: 20,right: 20),
                        child: Text("Men",style: GoogleFonts.poppins(fontSize: 17),)),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      i=1;
                    });
                  },
                  child: Card(
                    elevation: i==1?5:0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Container(
                        height: 40,
                        padding: EdgeInsets.all(8),
                        child: Text("Women",style: GoogleFonts.poppins(fontSize: 17),)),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      i=2;
                    });
                  },
                  child: Card(
                    elevation: i==2?5:0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Container(
                        height: 40,
                        padding: EdgeInsets.all(8).copyWith(left: 20,right: 20),
                        child: Text("Kids",style: GoogleFonts.poppins(fontSize: 17),)),
                  ),
                ),

              ],
            ),
            SizedBox(height: 15,),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Card(
                   elevation:0.5,
                   child: Container(
                     height: 50,
                     width: 100,
                     
                     child: Center(
                       child: Text(
                         "BestSeller",
                         style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),
                       ),
                     ),
                   ),
                 ),
                  Card(
                    elevation:0.5,
                    child: Container(height: 50,
                    width: 60,
                    child: Icon(Icons.stacked_bar_chart,size: 25,),),
                  ),
                  Card(
                    elevation:0.5,
                    child: Container(height: 50,
                      width: 60,
                      child: Icon(Icons.money,size: 25,),),
                  ),
                  Card(
                    elevation:0.5,
                    child: Container(height: 50,
                      width: 60,
                      child: Icon(Icons.change_circle_outlined,size: 25,),),
                  ),


                ],
              ),
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GridView.builder(
              itemCount: productList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10),
                  itemBuilder: (context,i){
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Container(
                    child: Column(
                      children: [
                        Stack(
                          children:[
                            Container(
                              height: 118,
                              decoration: BoxDecoration(
                                  borderRadius:BorderRadius.only(topLeft:Radius.circular(10),topRight: Radius.circular(8)) ,
                                  color: Colors.grey.withOpacity(0.5),
                                  image: DecorationImage(image: NetworkImage(productList[i]["image"]),fit: BoxFit.fill)
                              ),
                            ),
                            Positioned(
                              right: 10,
                                top: 5,
                                child: GestureDetector(
                                    onTap: (){

                                    },
                                    child: Icon(like,color: likedColor,)))
                          ]
                    
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              Text(productList[i]["name"],style: TextStyle(fontWeight: FontWeight.w500),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0,right: 5),
                          child: Row(
                            children: [
                              Text("Rs."+productList[i]["price"].toString(),style: TextStyle(color: Colors.blue),),
                              Expanded(child: Container()),
                              Icon(Icons.star_outline,color: Colors.yellow,),
                              Text(productList[i]["rating"])
                            ],
                          ),
                        )

                      ],
                    ),

                  ),
              );
                  }),
                ))

          ],
        ),
      )),
    );
  }
}

