import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/ApiService/api.dart';
import 'package:my_app/homepage.dart';
import 'package:my_app/pages/authpage.dart';
import 'package:my_app/pages/searchPage.dart';
import 'package:my_app/providers/product_provider.dart';
import 'package:my_app/providers/userProvider.dart';
import 'package:my_app/test.dart';
import 'package:provider/provider.dart';
const firebaseConfig = FirebaseOptions(
  apiKey: "AIzaSyASQowKZs9_psum_VnQyERBEl0FNpML_jA",
  authDomain: "abced-12073.firebaseapp.com",
  databaseURL: "https://abced-12073-default-rtdb.firebaseio.com",
  projectId: "abced-12073",
  storageBucket: "abced-12073.appspot.com",
  messagingSenderId: "403821237732",
  appId: "1:403821237732:web:d00ccce5540c28822263f1",
  measurementId: "G-VT94HE3S7Z"
);
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: firebaseConfig);
  } else {
    await Firebase.initializeApp();
  }
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
  final FirebaseAuth auth = FirebaseAuth.instance;

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
      home: auth.currentUser == null?AuthPage():HomePage(),
    );
  }


}

