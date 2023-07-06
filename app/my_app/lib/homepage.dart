
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:my_app/ApiService/api.dart';
import 'package:my_app/Utils/widgets.dart';
import 'package:my_app/pages/Categorypage.dart';
import 'package:my_app/pages/addProduct.dart';
import 'package:my_app/pages/categories.dart';
import 'package:my_app/pages/myProducts.dart';
import 'package:my_app/pages/mycart.dart';
import 'package:my_app/pages/product_description.dart';
import 'package:my_app/pages/profilepage.dart';

import 'Models/AddedProduct.dart';
import 'Models/Product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List items=["Headphone","Formals","Gadgets","Furnitures","watches","Bagpacks"];
  List img=["hp1.png","Cmen.jpg","Celectr.jpg","Cfurni.jpg","Cwat.jpg","Cbag.jpg"];
  int currentPageIndex=0;
  List<Product> productList=[];
  ApiService apiService=ApiService();
  bool isloading=true;
  bool ismyProductLoading=true;
  List<AddedProduct> myProducts=[];

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
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.black12,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.shopping_cart),
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'My cart',

          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.shopping_bag),
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Add Product',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            label: 'Profile',
          ),

        ],
      ),

      body: <Widget>[
        SingleChildScrollView(
        child: SafeArea(
            child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
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
                         nextScreen(context, MyProducts());
                       },
                         child: Text("See all",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black.withOpacity(0.8),fontSize: 18),)),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              ismyProductLoading?Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircularProgressIndicator(color: Colors.grey,),
              ):Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                  itemCount:myProducts.length>4?4:myProducts.length ,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10),
                    itemBuilder: (context,i){
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
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
                                    borderRadius:BorderRadius.only(topLeft:Radius.circular(10),topRight: Radius.circular(8)) ,
                                    color: Colors.white,
                                    image: DecorationImage(image: NetworkImage(myProducts[i].image),fit: BoxFit.contain)
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  children: [
                                    Text(myProducts[i].title,style: TextStyle(fontWeight: FontWeight.w500),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0,right: 5),
                                child: Row(
                                  children: [
                                    Text("Rs."+myProducts[i].price,style: TextStyle(color: Colors.blue),),
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
                    image: DecorationImage(image: NetworkImage("https://images-eu.ssl-images-amazon.com/images/G/31/NAB/Banner_Cart.jpg"),fit: BoxFit.cover)
                ),
              ),
              SizedBox(height: 15,),
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
              SizedBox(height: 10,),
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
              )
            ],
          ),
        )),
      ),
        const MyCart(),
        const AddProduct(),
        const ProfilePage()
      ][currentPageIndex]
    );
  }
  appbarTitle(){
    return  Padding(
      padding: const EdgeInsets.only(right: 20),
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
    );
  }


}