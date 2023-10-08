import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_figma_project/authentication/auth.dart';
import 'package:new_figma_project/bottom_navigation/bottom_bar1.dart';
import 'package:new_figma_project/test_1.dart';
import 'package:new_figma_project/user_details.dart';
import 'package:new_figma_project/validation/form_valid.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'technician_page/personal_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class MySign1 extends StatefulWidget {
  const MySign1({super.key});

  @override
  State<MySign1> createState() => _MySign1State();
}

class _MySign1State extends State<MySign1> {
  String? errorMessage='';
  bool isLogin= true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cPassController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  var iconColor= Color(0xFFaeb9c4);
  Future<void>signInWithEmailAndPassword()async{
    try{
      await Auth().signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text);
    }on FirebaseAuthException catch(e){
      setState(() {
        errorMessage=e.message;
      });
    }
  }
  Future<void>createUserWithEmailAndPassword()async{
    try{
      Auth().createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text);
    }on FirebaseAuthException catch(e){
      setState(() {
        errorMessage=e.message;
      });
    }
  }


  @override


  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key:_formkey ,
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding:  EdgeInsets.only(top: 7.h),
                        child: SvgPicture.asset('assets/images/yuslih.svg')
                      )),
                  Padding(
                    padding:  EdgeInsets.only(top: 22.h,left: 5.w),
                    child: Text("No account yet ?",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF252528)
                    ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 25.h,left: 5.w),
                    child: Text("Let's fix that now",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color:  Color(0xFF252528),
                    ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 30.h,left: 5.w,right: 5.w),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _nameController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 5.w),
                        //prefixIcon: Icon(Icons.person),
                       // labelText: "Your name",
                          label: Padding(
                            padding: const EdgeInsets.only(left:10),
                            child: Row(
                              children: [
                                Icon(Icons.person,
                                color: iconColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text("Your name"),
                                )
                              ],
                            ),
                          ),
                        labelStyle: TextStyle(

                          color: iconColor
                        ),
                        border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.grey.shade400
                            )
                          ),
                          fillColor: Color(0xFFf5f5f5),filled: false
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top:40.h,left: 5.w,right: 5.w),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _emailController,
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
                          return "Please enter some value";
                        }else if(!value.isValidEmail){
                          return "Invalid Email";
                        }return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 50.h,left: 5.w,right: 5.w),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor:Color(0xFFf5f5f5),
                          filled: true,
                          hintText: "Password",
                          hintStyle: TextStyle(
                              color: iconColor
                          ),
                          prefixIcon: Icon(Icons.lock,
                            color: iconColor,
                          ),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none
                      ),
                      validator:(value) {
                        if(value==null||value.isEmpty){
                          return "Please enter some value";
                        }else if(value.length<8){
                          return "Minimum 8 characters required";
                        }return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 60.h,left: 5.w,right: 5.w),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _cPassController,
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor:Color(0xFFf5f5f5),
                          filled: true,
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(
                              color: iconColor
                          ),
                          prefixIcon: Icon(Icons.lock,
                            color: iconColor,
                          ),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none
                      ),
                      validator: (value) {
                        if(value==null||value.isEmpty){
                          return "Please enter some value";
                        }else if(value.length<8){
                          return "Minimum 8 characters required";
                        }else if(value!=_passwordController.text){
                          return "Password doesn't match";
                        }return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 70.h),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(327, 45),
                          backgroundColor:Color(0xFF4FE0B5),
                          foregroundColor: Colors.white,

                        ),
                          onPressed: () {
                          if(_formkey.currentState!.validate()) {
                            Provider.of<UserDetails>(context, listen: false)
                                .user(_nameController.text);
                            Provider.of<UserDetails>(context, listen: false)
                                .loginName(_emailController.text);


                            Get.to(BottomNav1());
                            // Get.showSnackbar(
                            //   GetSnackBar(
                            //     message: "Account created successfully",
                            //     backgroundColor: Color(0xffBFBFBF),
                            //     snackPosition: SnackPosition.BOTTOM,
                            //     animationDuration: Duration(
                            //       milliseconds: 800,
                            //     ),
                            //     duration: Duration(milliseconds: 800),
                            //   )
                            // );
                            // Get.closeCurrentSnackbar();
                            Get.snackbar("Welcome ${_nameController.text}", "Account created successfully",
                            snackPosition: SnackPosition.BOTTOM,
                              backgroundColor:  Color(0xff3F54D1).withOpacity(0.2),
                              barBlur: 20,
                              margin: EdgeInsets.all(20),
                              icon: Icon(Icons.thumb_up_alt_sharp,color: Colors.white)
                            );
                          }

                          setState(() {
                            _nameController.clear();
                            _emailController.clear();
                            _passwordController.clear();
                            _cPassController.clear();
                          });
                          }, child: Text("Create Account",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16
                      ),
                      )),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 80.h),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(327, 45),
                            backgroundColor:Color(0xFF3F54D1),
                            foregroundColor: Colors.white,

                          ),
                          onPressed: () {

                          Get.to(PersonalInfo());
                          }, child: Text("Iam a technician",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                        ),
                      )),
                    ),
                  ),

                ],
              ),
            ),
          ) ),
    );
  }

}

