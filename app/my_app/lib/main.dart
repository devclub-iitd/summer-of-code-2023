import 'package:flutter/material.dart';
import 'package:my_app/ApiService/api.dart';
import 'package:my_app/homepage.dart';
import 'package:my_app/pages/addProduct.dart';
import 'package:my_app/pages/mycart.dart';
import 'package:my_app/providers/product_provider.dart';
import 'package:my_app/providers/userProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => UserProvider()),
      ChangeNotifierProvider(create: (context) => ProductProvider()),
    ],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  final ApiService apiService=ApiService();

  @override
  void initState() {
    super.initState();
    apiService.getUserData(context);
  }

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insien E-commerce',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }


}

