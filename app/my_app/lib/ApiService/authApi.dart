
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:my_app/ApiService/api.dart';
import 'package:my_app/Utils/widgets.dart';


class AuthApi{
  ApiService apiService=ApiService();

  Future<bool> registerUser(String name,String email,String password ,BuildContext context) async{

    try{
      User user=(await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)).user!;
      if(user!=null){
         apiService.signUP(context: context, name: name, email: email, password: password);
        return true;
      }else{
        return false;
      }

    }on FirebaseAuthException catch(e){
      showSnakbar(context, Colors.red, e.message.toString());
      return false;
    }
  }
  Future<bool> login(String email,String password,BuildContext context) async{
    try{
      User user=(await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)).user!;
      if(user!=null){
        apiService.authorizedUser(email: email, context: context);
        return true;
      }
      return false;

    }on FirebaseAuthException catch(e){
      showSnakbar(context, Colors.red, e.message.toString());
      return false;
    }
  }
  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  uploadImage(File? file) async {
    FirebaseStorage _storage = FirebaseStorage.instance;
    final storgeRef=FirebaseStorage.instance.ref().child("profile_pics").child(FirebaseAuth.instance.currentUser!.uid);
    UploadTask uploadTask = storgeRef.putFile(file!);
    final snapshot=await uploadTask.whenComplete((){});
    final urlDownload=await snapshot.ref.getDownloadURL();
    return urlDownload;
  }
  
  productImage(File? file) async {
    FirebaseStorage _storage = FirebaseStorage.instance;
    final storgeRef=FirebaseStorage.instance.ref().child("product_pics").child(FirebaseAuth.instance.currentUser!.uid).child(DateTime.now().microsecondsSinceEpoch.toString());
    UploadTask uploadTask = storgeRef.putFile(file!);
    final snapshot=await uploadTask.whenComplete((){});
    final urlDownload=await snapshot.ref.getDownloadURL();
    return urlDownload;
  }
}