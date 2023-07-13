
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/ApiService/addedProductApi.dart';
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
  List<DropdownMenuItem> items=[const DropdownMenuItem(child: Text("BestSeller")),const DropdownMenuItem(child: Text("Trending")),const DropdownMenuItem(child: Text("Discounts")),];
  List productList=[];
  List<AddedProduct> list=[];
  List HeadPhone=["hp1.png","hp2.png","hp3.png","hp4.png","hp5.png"];
  IconData like=Icons.favorite_border_outlined;
  Color likedColor=Colors.black12;
  ApiService apiService=ApiService();
  MyProductApi myProductApi=MyProductApi();
  Constants constants=Constants();
  bool isLoading=true;

  @override
  void initState() {
    super.initState();
    getCategoryProducts();
  }
  getData() async {
    await DefaultAssetBundle.of(context).loadString("json/"+widget.name+".json").then((value) {
      setState(() {
        productList = json.decode(value);
      });

    });


  }

  getCategoryProducts(){
    myProductApi.categoryProducts(widget.name).then((value) {
      setState(() {
        list=value;
        isLoading=false;
      });
    });
  }

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
              Text(widget.name,style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
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
      body: isLoading?Center(child: CircularProgressIndicator()):SingleChildScrollView(
        child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 15,),
            CarouselSlider(
              items: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(6),
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
                  margin: const EdgeInsets.all(6),
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
                  margin: const EdgeInsets.all(6),
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
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Container(
                        height: 40,
                        padding: const EdgeInsets.all(8).copyWith(left: 20,right: 20),
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
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Container(
                        height: 40,
                        padding: const EdgeInsets.all(8),
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
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Container(
                        height: 40,
                        padding: const EdgeInsets.all(8).copyWith(left: 20,right: 20),
                        child: Text("Kids",style: GoogleFonts.poppins(fontSize: 17),)),
                  ),
                ),

              ],
            ),
            const SizedBox(height: 15,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GridView.builder(
              itemCount: list.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10),
              itemBuilder: (context,i){
                final product=list[i];
              return Card(
                elevation: 5,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: GestureDetector(
                    onTap: (){
                      nextScreen(context, ProductDescription(product: product, category:widget.name,isMYProduct: false, ));
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Stack(
                            children:[
                              Container(
                                height: 118,
                                decoration: BoxDecoration(
                                    borderRadius:const BorderRadius.only(topLeft:Radius.circular(10),topRight: Radius.circular(8)) ,
                                    color: Colors.grey.withOpacity(0.5),
                                    image: DecorationImage(image: NetworkImage(product.image),fit: BoxFit.fill)
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
                                Text(product.title,style: const TextStyle(fontWeight: FontWeight.w500),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 5),
                            child: Row(
                              children: [
                                Text("Rs."+product.price,style: const TextStyle(color: Colors.blue),),
                                Expanded(child: Container()),
                                const Icon(Icons.star_outline,color: Colors.yellow,),
                                const Text("3.4")
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

    );
  }
}

