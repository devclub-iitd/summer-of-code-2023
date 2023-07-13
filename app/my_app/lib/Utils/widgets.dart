import 'package:flutter/material.dart';

var textInputdec=InputDecoration(
  labelStyle: TextStyle(color: Colors.black),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide.none,

  ),
    enabledBorder: OutlineInputBorder(
borderSide: BorderSide.none
),
errorBorder: OutlineInputBorder(
borderSide: BorderSide.none
)
);
void nextScreen(context,page){
  Navigator.push(context,MaterialPageRoute(builder: (context)=>page),);
}

void nextScreenReplace(context,page){
  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>page));
}

void showSnakbar(context,color,message){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message,style: TextStyle(
    fontSize: 14
  ),),
  backgroundColor: color,
    duration: Duration(seconds: 15),
    action: SnackBarAction(label: "OK", onPressed: (){},textColor: Colors.white,),
  ));
}