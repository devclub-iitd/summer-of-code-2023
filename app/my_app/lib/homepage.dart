
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:my_app/ApiService/CartApi.dart';
import 'package:my_app/ApiService/api.dart';
import 'package:my_app/Utils/widgets.dart';
import 'package:my_app/pages/Categorypage.dart';
import 'package:my_app/pages/addProduct.dart';
import 'package:my_app/pages/categories.dart';
import 'package:my_app/pages/mainPage.dart';
import 'package:my_app/pages/myProducts.dart';
import 'package:my_app/pages/mycart.dart';
import 'package:my_app/pages/product_description.dart';
import 'package:my_app/pages/profilepage.dart';
import 'package:my_app/pages/searchPage.dart';
import 'package:my_app/providers/product_provider.dart';
import 'package:provider/provider.dart';

import 'Models/AddedProduct.dart';
import 'Models/Product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CartApiService cartApiService=CartApiService();
  int currentPageIndex=0;
  ApiService apiService=ApiService();

  @override
  void initState() {
    super.initState();

    cartApiService.getMyCart(FirebaseAuth.instance.currentUser!.email!, context).then((value) {
      Provider.of<ProductProvider>(context, listen: false).setCartLength(value[2]);
    });


    apiService.authorizedUser(email: FirebaseAuth.instance.currentUser!.email!, context: context);
  }
  @override
  Widget build(BuildContext context) {
    final cl=context.watch<ProductProvider>().cartLength;
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.black12,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations:
        <Widget>[
          const NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: badges.Badge(
                position: badges.BadgePosition.topEnd(top: -13, end: -16),
                badgeContent:  Text(cl.toString()),
                badgeStyle: const badges.BadgeStyle(
                  badgeColor: Colors.blue
                ),
                child: const Icon(Icons.shopping_cart)),
            icon:  badges.Badge(
              badgeContent:  Text(cl.toString()),
                position: badges.BadgePosition.topEnd(top: -13, end: -16),
                child: const Icon(Icons.shopping_cart_outlined)),
            label: 'My cart',

          ),
          const NavigationDestination(
            selectedIcon: Icon(Icons.shopping_bag),
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Add Product',
          ),
          const NavigationDestination(
            selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            label: 'Profile',
          ),
          const NavigationDestination(
            selectedIcon: Icon(Icons.category),
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
          ),

        ],
      ),


      body: <Widget>[
        const FirstPage(),
        const MyCart(),
        const AddProduct(),
        const ProfilePage(),
        const Categories()
      ][currentPageIndex]
    );
  }
  appbarTitle(){
    return  Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: (){
          nextScreen(context, const SearchPage());
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
