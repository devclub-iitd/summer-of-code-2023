import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/ApiService/api.dart';
import 'package:my_app/homepage.dart';
import 'package:my_app/pages/authpage.dart';
import 'package:my_app/pages/searchPage.dart';
import 'package:my_app/providers/product_provider.dart';
import 'package:my_app/providers/userProvider.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
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

  }

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insien E-commerce',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser==null?const AuthPage():const HomePage(),
    );
  }


}

