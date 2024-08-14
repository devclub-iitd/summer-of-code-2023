import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Test Page"),
          flexibleSpace: Row(
            children: [
              Icon(Icons.arrow_back_ios),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("DSOC"),
                  GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Menu"),
                          backgroundColor: Colors.red,
                        ));
                      },
                      child: Icon(Icons.menu))
                ],
              ),
              Image(
                image: AssetImage("assets/banners/test.png"),
              ),
              GestureDetector(
                onTap: (() {
                  setState(() {
                    loading = true;
                  });
                }),
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("Login"),
                ),
              ),
              loading?CircularProgressIndicator():Container()
            ],
          ),
        ));
  }
}
