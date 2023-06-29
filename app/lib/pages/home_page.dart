import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: unused_import
import 'package:myproject/models/cart.dart';
import 'dart:convert';
import 'package:myproject/models/catalog.dart';
import 'package:myproject/pages/addtocart.dart';
import 'package:myproject/pages/homedetail_page.dart';
import 'package:myproject/utilites/routes.dart';
import 'package:myproject/widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: unused_import
import '../widgets/item_widget.dart';
import '../widgets/themes.dart';

//stateless se stateful me convert kiya kyunki change hoga page as loading hoga
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final int days = 30;
  final String name = "hello";

//initstate function widge banne se pehle hota h to build function call hone se pehle ka batata h
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    // ignore: prefer_const_constructors
    await Future.delayed(Duration(seconds: 1));
    //await kara diya kyunki time bhi lag sakta ha aane me
    //for jason file to import
    final catlogjson = await rootBundle.loadString("assets/file/catalog.json");
    final decodedData =
        jsonDecode(catlogjson); //decode string ko output me convert kar deta h
    // ye wala data map me aa raha h
    var productData =
        decodedData("products"); //data list me aa raha h so list use kiya h
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    //data change ho raha h so setstate wala function
    setState(() {
    });
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor:Colors.transparent,
         //Text("Catalog App",style: TextStyle(fontWeight:FontWeight.bold,fontSize: double.tryParse('36'),),),),
        //backgroundColor: MyTheme.creamColor,
        title:Text("Catalog App",style: TextStyle(fontWeight:FontWeight.bold,fontSize: double.tryParse('36'),),),),
         floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoute.cartRoute),
          backgroundColor: Colors.deepPurple,
          child: const Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ),
        body: Container(
            //padding: Vx.m8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ColoredBox(color: Vx.white) ,           
                CatalogHeader(),
                // ignore: unnecessary_null_comparison
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        
       drawer: MyDrawer(),);
  }
}

// ignore: use_key_in_widget_constructors
class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //color(Vx.white),
        //Padding(padding: Vx.m2),
        //"Catalog App".text.xl5.bold.color(Vx.black).make(),
        //  Align(
        //   alignment: Alignment.center,
        //   child: "Catalog App".text.xl5.bold.color(Vx.black).make(),
        // ),
        "             Trending products".text.xl2.make(),
      ],
    );
  }
}

// ignore: use_key_in_widget_constructors
class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return !context.isMobile
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20.0),
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog),
                  ),
                ),
                child: CatalogItem(catalog: catalog),
              );
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog),
                  ),
                ),
                child: CatalogItem(catalog: catalog),
              );
            },
          );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({ Key? key, required this.catalog})
      // ignore: unnecessary_null_comparison
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
              
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,//for space btw 999 and buy
                buttonPadding: EdgeInsets.zero,
                
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  AddToCart(catalog:catalog)
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).color(context.cardColor).rounded.square(100).make().py8();
  }
}


//different widget for image handeelling
class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p8.color(context.canvasColor).make().p8().w32(context);
  }
}
  


// appBar: AppBar(
//         title: Text("Catalog App"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
//             ? ListView.builder(
//                 itemCount: CatalogModel.items.length,
//                 itemBuilder: (context, index) => ItemWidget(
//                   item: CatalogModel.items[index],
//                 ),
//               )
//             : Center(
//                 child: CircularProgressIndicator(),
//               ),
//       ),