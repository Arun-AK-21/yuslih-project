import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_figma_project/authentication/auth.dart';
import 'package:new_figma_project/bottom_navigation/bottom_bar1.dart';
import 'package:new_figma_project/new_homepage.dart';
import 'package:new_figma_project/test_1.dart';
import 'package:new_figma_project/validation/form_valid.dart';
import 'package:provider/provider.dart';

import 'sign_up_figma.dart';
import 'user_details.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';


class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  final _formkey = GlobalKey<FormState>();
  var iconColor= Color(0xFFaeb9c4);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: SafeArea(
            child:SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Stack(
                children: [
                  Image.asset('assets/images/login.png',
                   width: MediaQuery.of(context).size.width,
                     height:  MediaQuery.of(context).size.height/2,
                    fit: BoxFit.fitWidth,
                  ),
                  Positioned(
                    top:42.h ,
                    left: 15,
                    child: Text("Broken Something ?",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    ),
                  ),
                  Positioned(
                    top: 45.h,
                    left: 15,
                    child: Text("Login to fix it",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 52.h,left: 6.w,right: 6.w),

                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        fillColor:Color(0xFFf5f5f5),
                        filled: true,
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: iconColor
                        ),
                        prefixIcon: Icon(Icons.email,
                        color: iconColor,
                        ),
                        border: InputBorder.none,
                          focusedBorder: InputBorder.none
                      ),
                      validator: (value) {
                        if(value==null || value.isEmpty){
                          return "Please enter any value";
                        }else if(!value.isValidEmail){
                          return "Invalid email";
                        }return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 62.h,left: 6.w,right: 6.w),
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          fillColor:Color(0xFFf5f5f5),
                          filled: true,

                          prefixIcon: Icon(Icons.lock,
                          color: iconColor,
                          ),
                          border: InputBorder.none

                      ),
                      validator: (value) {
                        if(value==null || value.isEmpty){
                          return "Enter some value";
                        }else if(value.length<8){
                          return "Minimum 8 characters required";
                        }return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 72.h,
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: ElevatedButton(

                        style: ElevatedButton.styleFrom(elevation:3 ,
                          backgroundColor: Color(0xFF4FE0B5),
                          foregroundColor: Colors.white,fixedSize: Size(327, 45)
                        ),
                          onPressed: () {
                          if(_formkey.currentState!.validate()){
                            signIn();
                            Provider.of<UserDetails>(context, listen: false)
                                .loginName(emailController.text);
                           Get.to(BottomNav1());
                           Get.snackbar("Login successful", "Welcome back",
                               snackPosition: SnackPosition.BOTTOM,
                               backgroundColor:  Color(0xff3F54D1).withOpacity(0.2),
                               barBlur: 20,
                               margin: EdgeInsets.all(20),
                               icon: Icon(Icons.thumb_up_alt_sharp,color: Colors.white)
                           );
                          }
                          setState(() {
                            emailController.clear();
                            passwordController.clear();
                          });


                          },

                          child: Text("Login",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 16
                            ),
                          )),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 81.h,),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text("New Member?",
                      style: GoogleFonts.poppins(
                        fontSize:14,
                        fontWeight: FontWeight.w400
                      ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 85.h,left: 6.w,right: 6.w),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: ElevatedButton(

                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                              backgroundColor: Color(0xFFE7FBF5),
                              foregroundColor: Color(0xFF4FE0B5),fixedSize: Size(327, 45)
                          ),
                          onPressed: () {

                            Get.to(MySign1());
                            setState(() {
                              emailController.clear();
                              passwordController.clear();
                            });
                          },
                          child: Text("Sign Up",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                          ),
                          )),
                    ),
                  )

                ],
              ),
            ) ),
      ),
    );
  }
  void signIn()async{
    String email=emailController.text;
    String password = passwordController.text;

    User? user =await _auth.signInWithEmailAndPassword(email: email, password: password);
    if(user!=null){
      print("user logged in successfully");
      Get.to(BottomNav1());
    }else{
      print("error occured");
    }
  }
}
