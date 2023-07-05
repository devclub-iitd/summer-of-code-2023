import 'package:flutter/material.dart';
import 'product_tile_collection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MarketplaceApp());
}

class MarketplaceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marketplace App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ProductTileCollection(),
      },
    );
  }
}




