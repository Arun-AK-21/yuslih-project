import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices{
  static saveUser(String email,uid)async{
    await FirebaseFirestore.instance
    .collection('users')
    .doc(uid)
    .set({'emal':email,});
  }
}