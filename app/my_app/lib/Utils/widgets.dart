import 'package:flutter/material.dart';

const textInputdec=InputDecoration(
  labelStyle: TextStyle(color: Colors.black),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color:Colors.grey,width: 2)
  ),
    enabledBorder: OutlineInputBorder(
borderSide: BorderSide(color:Color(0xff053637),width: 2)
),
errorBorder: OutlineInputBorder(
borderSide: BorderSide(color:Colors.red,width: 2)
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
    duration: Duration(seconds: 2),
    action: SnackBarAction(label: "OK", onPressed: (){},textColor: Colors.white,),
  ));
}