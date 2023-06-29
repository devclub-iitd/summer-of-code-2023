import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Utils/widgets.dart';
import 'package:my_app/pages/Categorypage.dart';
import 'package:my_app/pages/profilepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List items=["Headphone","Formals","Gadgets","Furnitures","watches","Bagpacks"];
  List img=["hp1.png","Cmen.jpg","Celectr.jpg","Cfurni.jpg","Cwat.jpg","Cbag.jpg"];
  int currentPageIndex=0;
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
            selectedIcon: Icon(Icons.wallet),
            icon: Icon(Icons.wallet_outlined),
            label: 'Wallet',

          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.data_thresholding),
            icon: Icon(Icons.data_thresholding_outlined),
            label: 'Statistics',
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
                    Container(
                      height: 50,
                      width: 50,
                      child: const Icon(Icons.shopping_cart_outlined,color: Colors.black,size: 30,),
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
                       return i==6?const Icon(Icons.add,size: 30,):
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
              Row(
                children: [
                  const Text("Hot Sales",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),),
                  Expanded(child: Container()),
                  const Text("See all",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey),),
                ],
              ),
              const SizedBox(height: 20,),
            ],
          ),
        )),
      ),
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
  PageChanger(int page,CarouselPageChangedReason){

  }

}
