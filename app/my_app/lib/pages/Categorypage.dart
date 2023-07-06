
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/ApiService/api.dart';
import 'package:my_app/Models/Product.dart';
import 'package:my_app/Utils/constants.dart';
import 'package:my_app/Utils/widgets.dart';
import 'package:my_app/pages/product_description.dart';

import '../Models/AddedProduct.dart';

class CategoryPage extends StatefulWidget {
  String name;

  CategoryPage({Key? key,required this.name}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int i=1;
  List<DropdownMenuItem> items=[DropdownMenuItem(child: Text("BestSeller")),DropdownMenuItem(child: Text("Trending")),DropdownMenuItem(child: Text("Discounts")),];
  List productList=[];
  List HeadPhone=["hp1.png","hp2.png","hp3.png","hp4.png","hp5.png"];
  IconData like=Icons.favorite_border_outlined;
  Color likedColor=Colors.black12;
  ApiService apiService=ApiService();
  Constants constants=Constants();

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
      body: SafeArea(
        child: SingleChildScrollView(
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
              CarouselSlider(
                items: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.red,
                      image:  DecorationImage(
                        image: NetworkImage(constants.bannerList_categoryPage[0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image:  DecorationImage(
                        image: NetworkImage(constants.bannerList_categoryPage[1]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  //3rd Image of Slider
                  Container(
                    margin: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image:  DecorationImage(
                        image: NetworkImage(constants.bannerList_categoryPage[2]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                ],

                //Slider Container properties
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayCurve: Curves.decelerate,
                  enlargeFactor: 1,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                ),
              ),
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GridView.builder(
                itemCount: productList.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10),
                itemBuilder: (context,i){
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: GestureDetector(
                      onTap: (){
                        nextScreen(context, ProductDescription(product: AddedProduct('', '', productList[i]['name'], widget.name, productList[i]['desc'], productList[i]['price'].toString(), '', true, productList[i]['image']), category:widget.name,isMYProduct: false, ));
                      },
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
                    ),
                );
                }),
              ),
              Visibility(
                visible: widget.name=="Gadgets"?true:false,
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(constants.imagesUri[0]),fit: BoxFit.cover)
                  ),
                ),
              ),


            ],
          ),
          ),
        ),
      ),

    );
  }
}
