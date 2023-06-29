import "package:flutter/material.dart";
import 'package:myproject/pages/addtocart.dart';
import 'package:velocity_x/velocity_x.dart';
// ignore: unused_import
import 'package:myproject/widgets/themes.dart';
import 'package:myproject/models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
   final Item catalog;

  const HomeDetailPage({key, required this.catalog}):
  // ignore: unnecessary_null_comparison
  assert(catalog!=null),
  super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color:context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
           AddToCart(catalog: catalog)
          .wh(150, 50),],
        ).p32(),
    ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.convey,
              edge: VxEdge.top,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl3.color(context.accentColor)
                        .bold
                        .make(),
                    catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                    10.heightBox,
                    "Dolor sea  Eos ipsum voluptua eirmod elitr, no dolor dolor amet eirmod dolor labore dolores magna. Amet vero vero vero kasd, dolore sea sed sit invidunt nonumy est sit clita. Diam aliquyam amet tempor diam no aliquyam invidunt. Elitr lorem eirmod dolore clita. Rebum."
                        .text
                        .textStyle(context.captionStyle)
                        .make()
                        .p8()
                  ],
                ).py32(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}