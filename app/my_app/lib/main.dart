import 'package:flutter/material.dart';
import 'package:my_app/homepage.dart';
import 'package:my_app/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>ProductProvider() ,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

