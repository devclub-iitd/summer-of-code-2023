import 'package:flutter/material.dart';
import 'package:my_app/homepage.dart';
import 'package:my_app/pages/addProduct.dart';
import 'package:my_app/pages/mycart.dart';
import 'package:my_app/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>ProductProvider() ,
      child: MaterialApp(
        title: 'Insien E-commerce',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}

