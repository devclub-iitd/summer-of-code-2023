
import 'package:flutter/material.dart';
import 'package:myproject/core/store.dart';
import 'package:myproject/pages/cart_page.dart';
import 'package:myproject/pages/home_page.dart';
import 'package:myproject/pages/login_page.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:myproject/utilites/routes.dart';
//import 'package:myproject/widgets/drawer.dart';
import 'package:myproject/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
//import 'package:flutter_stripe_web/flutter_stripe_web.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Stripe.instance.applySettings();
  // await dotenv.load(fileName: ".env");
  // Stripe.publishableKey='pk_test_51NNuSiSCO0sVI4p6V6TSMHBtDWflK1jX31O9bzYsqaCInSQUmQhoWOotnIb2EMWF5AQgb0yM8kUA2n9CYxW8s8oW0043hLHYO2';
  
  runApp(VxState(
    store:MyStore(),
    child: const MyApp()));
   //as myapp not exist so create widget
}

class MyApp extends StatelessWidget {
  // function me hum first letter small likhte h like build yhna h
  // and class me first letter capital like MyApp h and in middle dono me capital
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // context batata h kon sa widget ka location khna par ph
    return MaterialApp(
      title: "my project",
      //home:HomePage(),   // yhna par homepage ko hata diya as humne route use kiya h
      themeMode: ThemeMode.dark,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,// debug remove ho jaayega  
      initialRoute:
          MyRoute.homeRoute, // by default / hota so humne yhna wo change karke /home la diya
      routes: {
        "/": (context) => LoginPage(),
        MyRoute.homeRoute: (context) =>
            const HomePage(), // home:HomePage ko hatana padega nhi to error aa jaayega
        MyRoute.loginRoute: (context) => LoginPage(),
        MyRoute.cartRoute:(context) =>const CartPage(),
      },
    );
  }
}
