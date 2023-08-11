import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'product_tile_collection.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _register(BuildContext context) async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // Registration success, navigate to profile screen or perform other actions.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ProductTileCollection(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Registration Error'),
            content: Text('The password provided is too weak.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Registration Error'),
            content: Text('The account already exists for that email.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
      // Handle other registration errors here.
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _login(BuildContext context) async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // Login success, navigate to profile screen or perform other actions.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ProductTileCollection(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Login Error'),
            content: Text('No user found for that email.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else if (e.code == 'wrong-password') {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Login Error'),
            content: Text('Wrong password provided for that user.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
      // Handle other login errors here.
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _register(context),
              child: Text('Register'),
            ),
            ElevatedButton(
              onPressed: () => _login(context),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
