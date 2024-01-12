import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_figma_project/authentication/firebase_functions.dart';
class FirebaseAuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  Future<User?>signInWithEmailAndPassword({
    required String email,
    required String password,
}) async {
    try{

      UserCredential credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password
    );
    return credential.user;
    }on FirebaseAuthException catch(e){
     if(e.code=='user-not-found'){
      Get.showSnackbar(GetSnackBar(message: "No user found with this email ",));
     }else if(e.code=='wrong-password'){
      Get.showSnackbar(GetSnackBar(message: 'Password did not match',));
     }
    }
    return null;
  }
  Future <User?>createUserWithEmailAndPassword({
    required String email,
    required String password,
})async {
    try{
      UserCredential credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
         password: password
    );
    await FirebaseAuth.instance.currentUser!.updateEmail(email);
    await FireStoreServices.saveUser(email, credential.user!.uid);
    return credential.user;
    // ignore: empty_catches
    }on FirebaseAuthException catch(e){
     if(e.code=='email-already-in-use'){
      Get.showSnackbar(GetSnackBar(message: "Email provided already exists",));
     } 
    };
    return null;
  }
  Future<void>signOut()async{
    await _firebaseAuth.signOut();
  }
  }