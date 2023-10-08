// import 'package:flutter/material.dart';
// import 'package:new_figma_project/authentication/auth.dart';
// import 'sign_up_figma.dart';
// import 'test_1.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class WidgetTree extends StatefulWidget {
//   const WidgetTree({super.key});
//
//   @override
//   State<WidgetTree> createState() => _WidgetTreeState();
// }
//
// class _WidgetTreeState extends State<WidgetTree> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//         stream: Auth().authStateChanges,
//         builder:  (context, snapshot) {
//           if(snapshot.hasData){
//             return TestHome();
//           }else{
//             return MySign1();
//           }
//         },);
//   }
// }
