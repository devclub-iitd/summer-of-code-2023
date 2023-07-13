
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_app/ApiService/addedProductApi.dart';
import 'package:my_app/Utils/constants.dart';
import 'package:my_app/pages/product_description.dart';
import 'package:my_app/pages/searchPage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../ApiService/CartApi.dart';
import '../ApiService/api.dart';
import '../Models/AddedProduct.dart';
import '../Models/Product.dart';
import '../Utils/widgets.dart';
import 'Categorypage.dart';
import 'categories.dart';
import 'myProducts.dart';
import 'mycart.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List items=["Headphone","jewelery","Gadgets","Daily use","watches","Bagpacks"];
  List img=["hp1.png","Cmen.jpg","Celectr.jpg","Cfurni.jpg","Cwat.jpg","Cbag.jpg"];
  int currentPageIndex=0;
  List<Product> productList=[];
  ApiService apiService=ApiService();
  MyProductApi myProductApi=MyProductApi();
  bool isloading=true;
  bool ismyProductLoading=true;
  bool isRecLoading=true;
  List<AddedProduct> myProducts=[];
  List<AddedProduct> rec=[];
  CartApiService cartApiService=CartApiService();
  Constants constants=Constants();

  final PageController controller=PageController(
  );

  List<Product> list=[const Product("Casual shirts", "", "min 50% off", "https://m.media-amazon.com/images/I/51v8UlSQfBL._AC_UL600_FMwebp_QL65_.jpg", "",''),
    const Product("Men's Trousers", "", "Min 70% off", "https://m.media-amazon.com/images/I/71wL-coI9aL._AC_UL600_FMwebp_QL65_.jpg", "",''),
    const Product("Deals on Red Tape", "", "Upto 80% off", "https://m.media-amazon.com/images/I/31nQtukA3bL._AC_SY200_.jpg", "",'')];

  @override
  void initState() {
    super.initState();
    apiService.fetchProduct().then((value){
      setState(() {
        productList=value;
        isloading=false;
      });
    });
    apiService.getMyProducts("adi@gmail.com").then((value) {
      setState(() {
        myProducts=value;
        ismyProductLoading=false;
      });
    });
    myProductApi.getRecommended("its8@gmail.com").then((value) {
      setState(() {
        rec=value;
        isRecLoading=false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: (){
                  nextScreen(context, const MyCart());
                },
                child: Container(
                  height: 50,
                  width: 50,
                  child: const Icon(Icons.shopping_cart_outlined,color: Colors.black,size: 30,),
                ),
              ),
              Expanded(child: appbarTitle())
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context,constraints)=>RefreshIndicator(
          onRefresh: (){
            return myProductApi.getRecommended("its8@gmail.com").then((value) {
              setState(() {
                rec=value;
                isRecLoading=false;
              });
            });
          },
          child: SingleChildScrollView(
            child: SafeArea(
                child: Container(
                  child: Column(
                    children: [

                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 60,
                              child: ListView.builder(
                                  itemCount: 7,
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context,i){
                                    return i==6?InkWell(
                                        onTap: (){
                                          nextScreen(context, const Categories());
                                        },
                                        child: const Icon(Icons.add,size: 30,)):
                                    GestureDetector(
                                      onTap: (){
                                        nextScreen(context, CategoryPage(name: items[i]));
                                      },
                                      child: Card(
                                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                        child: Container(
                                            height: 50,
                                            child: Row(
                                              children: [
                                                Card(
                                                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                                  child: Container(
                                                    height: 45,
                                                    width: 45,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(image: AssetImage("assets/categories/"+img[i]),
                                                            fit: BoxFit.cover),
                                                        borderRadius: const BorderRadius.all(Radius.circular(10))
                                                    ),
                                                  ),
                                                ),
                                                Text(items[i],style:const TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                                                const SizedBox(width: 5,)
                                              ],
                                            )
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),

                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CarouselSlider(
                          items: [
                            Container(
                              margin: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.red,
                                image: const DecorationImage(
                                  image: AssetImage("assets/banners/b5.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: const DecorationImage(
                                  image: AssetImage("assets/banners/b3.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            //3rd Image of Slider
                            Container(
                              margin: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: const DecorationImage(
                                  image: AssetImage("assets/banners/b2.jpg"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: const DecorationImage(
                                  image: AssetImage("assets/banners/b1.jpg"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: const DecorationImage(
                                  image: AssetImage("assets/banners/b4.jpg"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),

                          ],

                          //Slider Container properties
                          options: CarouselOptions(
                            autoPlay: true,
                            autoPlayCurve: Curves.decelerate,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                            autoPlayAnimationDuration: const Duration(milliseconds: 800),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text("Hot Sales",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 20),),
                            Expanded(child: Container()),
                            const Text("See all",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey,fontSize: 18),),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:10),
                        child: GridView.builder(
                            itemCount: list.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10),
                            itemBuilder: (context,i){
                              return GestureDetector(
                                child: Container(
                                  decoration: const BoxDecoration(border:Border.fromBorderSide(BorderSide(width: 1,color: Colors.grey)),
                                      borderRadius: BorderRadius.all(Radius.circular(10))),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 140,
                                        decoration: BoxDecoration(
                                            borderRadius:const BorderRadius.only(topLeft:Radius.circular(10),topRight: Radius.circular(8)) ,
                                            color: Colors.white,
                                            image: DecorationImage(image: NetworkImage(list[i].image),fit: BoxFit.contain)
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          children: [
                                            Text(list[i].name,style: const TextStyle(fontWeight: FontWeight.w500),),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0,right: 5),
                                        child: Row(
                                          children: [
                                            Text(list[i].desc.toString(),style: const TextStyle(color: Colors.blue),),
                                            Expanded(child: Container()),
                                          ],
                                        ),
                                      )

                                    ],
                                  ),

                                ),
                              );
                            }),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        height: 150,
                        decoration: const BoxDecoration(
                            image: DecorationImage(image: NetworkImage("https://images-eu.ssl-images-amazon.com/images/G/31/NAB/Banner_Corporate-bulk.jpg"),fit: BoxFit.cover)
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            const Text("Added by you",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 20),),
                            Expanded(child: Container()),
                            InkWell(
                                onTap: (){
                                  nextScreen(context, const MyProducts());
                                },
                                child: Text("See all",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black.withOpacity(0.8),fontSize: 18),)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),

                      ismyProductLoading?const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: CircularProgressIndicator(color: Colors.grey,),
                      ):Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GridView.builder(
                            itemCount:myProducts.length>4?4:myProducts.length ,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10),
                            itemBuilder: (context,index){
                              int i=myProducts.length-index-1;
                              return Card(
                                elevation: 5,
                                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                child: GestureDetector(
                                  onTap: (){
                                    nextScreen(context, ProductDescription(product: myProducts[i], category: myProducts[i].category,isMYProduct: true,));
                                  },
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 141,
                                          decoration: BoxDecoration(
                                              borderRadius:const BorderRadius.only(topLeft:Radius.circular(10),topRight: Radius.circular(8)) ,
                                              color: Colors.white,
                                              image: DecorationImage(image: NetworkImage(myProducts[i].image),fit: BoxFit.contain)
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Row(
                                            children: [
                                              Text(myProducts[i].title.length>20?myProducts[i].title.substring(0,20):myProducts[i].title,style: const TextStyle(fontWeight: FontWeight.w500),),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0,right: 5),
                                          child: Row(
                                            children: [
                                              Text("Rs."+myProducts[i].price,style: const TextStyle(color: Colors.blue),),
                                              Expanded(child: Container()),

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

                      const SizedBox(height: 10,),
                      Container(
                        height: 150,
                        decoration: const BoxDecoration(
                            image: DecorationImage(image: NetworkImage("https://m.media-amazon.com/images/I/710ePgqVqnL._SX3000_.jpg"),fit: BoxFit.contain)
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            const Text("Deals of the Day",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 20),),
                            Expanded(child: Container()),
                            const Text("See all",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey,fontSize: 18),),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      isloading?const CircularProgressIndicator(
                        color: Colors.grey,
                      ):Padding(
                        padding: const EdgeInsets.symmetric(horizontal:10),
                        child: GridView.builder(
                            itemCount:productList.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10),
                            itemBuilder: (context,i){
                              return GestureDetector(
                                onTap: (){
                                  nextScreen(context, ProductDescription(product: AddedProduct('', '', productList[i].name, productList[i].Category, productList[i].desc, productList[i].price, 'Delhi,India', true, productList[i].image), category:productList[i].Category,isMYProduct: false, ));
                                },
                                child: Container(
                                  decoration: const BoxDecoration(border:Border.fromBorderSide(BorderSide(width: 1,color: Colors.grey)),
                                      borderRadius: BorderRadius.all(Radius.circular(10))),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 131,
                                        decoration: BoxDecoration(
                                            borderRadius:const BorderRadius.only(topLeft:Radius.circular(10),topRight: Radius.circular(8)) ,
                                            color: Colors.grey.withOpacity(0.5),
                                            image: DecorationImage(image: NetworkImage(productList[i].image),fit: BoxFit.fill)
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          children: [
                                            Text(productList[i].name.substring(0,10),style: const TextStyle(fontWeight: FontWeight.w500),),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0,right: 5),
                                        child: Row(
                                          children: [
                                            Text(productList[i].desc.toString().substring(0,15),style: const TextStyle(color: Colors.blue),),
                                            Expanded(child: Container()),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0,right: 5),
                                        child: Row(
                                          children: [
                                            Text("Rs."+productList[i].price.toString(),style: const TextStyle(color: Colors.blue),),
                                            Expanded(child: Container()),
                                          ],
                                        ),
                                      ),


                                    ],
                                  ),

                                ),
                              );
                            }),
                      ),
                      const SizedBox(height: 15,),
                      Visibility(
                        visible: !(rec==[]),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              const Text("Suggestions for you",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 20),),
                              Expanded(child: Container()),
                              const Text("See all",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey,fontSize: 18),),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      isRecLoading?const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: CircularProgressIndicator(color: Colors.grey,),
                      ):Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          height: rec==[]?1:170,
                          child: ListView.builder(
                            itemCount: rec.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context,i){
                              var product=rec[i];
                             return Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 8.0),
                               child: Stack(
                                 children: [
                                   Container(
                                     height: 150,
                                     width: 130,

                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.all(Radius.circular(15)),
                                         color: Colors.white,
                                         image: DecorationImage(image: NetworkImage(product.image),fit: BoxFit.contain)
                                     ),

                                   ),
                                   Positioned(
                                     top:150,
                                       left: 10,
                                       child:Center(child: Text(product.title,style: TextStyle(color: Colors.black),)))
                                 ],
                               ),
                             );
                          }),
                        ),
                      ),
                      Container(
                        height: 150,
                        child:Stack(
                          children: [
                            PageView.builder(
                                controller: controller,
                                itemCount: constants.laptop.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context,i){
                                  return Container(
                                    height: 150,
                                    width: MediaQuery.of(context).size.width,
                                    decoration:  BoxDecoration(
                                        image: DecorationImage(image: NetworkImage(constants.laptop[i]),fit: BoxFit.fill)
                                    ),
                                  );
                                }),
                        Positioned(
                          top: 100,
                            left: (MediaQuery.of(context).size.width-100)/2,
                            child: SmoothPageIndicator(
                              onDotClicked: (page){
                                controller.jumpToPage(page);
                              },

                          controller:controller,
                          count:constants.laptop.length,
                          effect:JumpingDotEffect(),
                        ))
                          ],
                        ),
                      )


                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
  appbarTitle(){
    return  Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: (){
          nextScreen(context, SearchPage());
        },
        child: Container(
          height: 50,
          padding: const EdgeInsets.only(left: 5,right: 20),
          decoration: const BoxDecoration(
            color: Color(0xffeeefef),
            borderRadius: BorderRadius.all(Radius.circular(15)),

          ),
          child: Row(
            children:  [
              GestureDetector(

                  child:  const Icon(Icons.search,color:Colors.black,)),
              const SizedBox(width: 5,),
              GestureDetector(
                  child: const Text("Search for a product,cloth...",style: TextStyle(color: Colors.black54,fontSize:18),)),
              Expanded(child: Container()),
              const Icon(Icons.mic,color: Colors.black,),
            ],
          ),
        ),
      ),
    );
  }


}
