import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'expert.dart';
class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  final formkey = GlobalKey<FormState>();
    return Scaffold(

      body: SafeArea(top: false,
        child: Form(
          key: formkey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children:[
              Padding(
                padding:  EdgeInsets.only(top: 7.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(Icons.arrow_back),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(right:2.w),
                      child: Text('1/3',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14
                      ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 25.w,bottom: 2.h),
                child: SvgPicture.asset('assets/images/body.svg'),
              )
              ]
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(right: 45.w),
                    child: Text("Personal Information",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right:18.w),
                    child: Text("Let's Know each other better",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding:  EdgeInsets.only(top: 3.h,left: 5.w,right: 5.w),
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _nameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person,
                      color:  Color(0xffBFBFBF),
                      ),
                      hintText: "Your name",
                        hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xffBFBFBF)
                        ),
                      // border: OutlineInputBorder(
                      //   borderSide: BorderSide(
                      //     width: .5,
                      //     color: Color(0xffBFBFBF)
                      //   ),
                      //   borderRadius: BorderRadius.circular(5)
                      // ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1,
                        color: Color(0xffBFBFBF),

                        ),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      focusedBorder:InputBorder.none
                    ),
                    validator: (value) {
                      if(value==null|| value.isEmpty){
                        return "please enter any value";
                      }return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 5.h,left: 5.w,right: 5.w ),
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _phoneController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.call,
                            color: Color(0xffBFBFBF)
                        ),
                        hintText: "Phone number",
                        hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xffBFBFBF)
                        ),
                        // border: OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //     width: .5,
                        //     color: Color(0xffBFBFBF)
                        //   ),
                        //   borderRadius: BorderRadius.circular(5)
                        // ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1,
                              color: Color(0xffBFBFBF),

                            ),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        focusedBorder:InputBorder.none
                    ),
                    validator: (value) {
                      if(value==null|| value.isEmpty){
                        return "please enter any value";
                      }return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 5.h),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(90.w, 2.h),
                      backgroundColor: Color(0xff3F54D1),
                      foregroundColor: Colors.white
                    ),
                    onPressed: () {
                  if(formkey.currentState!.validate()){
                     Get.to(ExpertTech());
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExpertTech(),));
                      setState(() {
                        _nameController.clear();
                        _phoneController.clear();
                      });
                  }
                }, child: Text("Next",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
                )),
              )

            ],
          ),
        ),
      ),
    );
  }
}
