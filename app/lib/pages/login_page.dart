// TextFormField(
//                         decoration: const InputDecoration(
//                             hintText: "Enter username", labelText: "Username"),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "Username can not be empty";
//                           }
//                           return null;
//                         },
//                         onChanged: ((value) {
//                           name = value;
//                           setState(() {
//                             // only works in stateful widget
//                           }); //setstate widget ko call karta h so that change aa sake
//                         }),
//                       ),
//                       TextFormField(
//                         obscureText: true,
//                         decoration: const InputDecoration(
//                             hintText: "Enter Password", labelText: "Password"),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "Password can not be empty";
//                           } else if (value.length < 6) {
//                             return "Password length should be atleast 6";
//                           }
//                           return null;
//                         },
//                       ),
import 'package:flutter/material.dart';
import 'package:myproject/pages/loginhelper/my_button.dart';
import 'package:myproject/pages/loginhelper/my_textfield.dart';
import 'package:myproject/pages/loginhelper/square_tile.dart';
import 'package:myproject/utilites/routes.dart';
// ignore: unused_import
import 'package:myproject/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:context.cardColor,
      body: SafeArea(
      top: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),

              // logo
              const Icon(
                Icons.lock,
                size: 70,
              ),

              const SizedBox(height: 20),

              // welcome back, you've been missed!
              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
              MyTextField(
                controller: usernameController,
                hintText: 'Enter Username',
                obscureText: false, labelText: 'Username',
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Enter Password',
                labelText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 2),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "This is not supported yet.".text.make(),
              ));
            },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 0),
               
              // sign in button
              MyButton(
               onTap: (() {
                Navigator.pushNamed(context, MyRoute.homeRoute);
              }),
              ),

              const SizedBox(height: 5),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // google + apple sign in buttons
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google button
                  SquareTile(imagePath: 'assets/images/google.png'),
                  SizedBox(width: 80),

                  // apple button
                  SquareTile(imagePath: 'assets/images/apple.png')
                ],
              ),

              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 40),
                  Builder(
                    builder: (context) {
                      return const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}