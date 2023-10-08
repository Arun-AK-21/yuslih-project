import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_figma_project/technician_page/bottom_nav/navigation.dart';
import 'package:sizer/sizer.dart';
class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xf5FCFCFC),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: 7.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: 2.w),
                        child: IconButton(
                            onPressed: () => Get.back(),
                        icon: Icon(Icons.arrow_back),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(right:3.w),
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
                  padding:  EdgeInsets.only(left: constraints.maxWidth*0.3,top: 2.h),
                  child: SvgPicture.asset('assets/images/body.svg',width: 272,height: 242,),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: constraints.maxHeight*0.2,left: constraints.maxWidth*0.1),
                  child: Text("Almost there",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14
                    ),
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.only(top: constraints.maxHeight*0.23,left: constraints.maxWidth*0.1 ),
                  child: Text("Let's finish registration",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: constraints.maxHeight*0.3,left: constraints.maxWidth*0.35),
                  child: Container(
                    // alignment: Alignment.center,
                    height: 96,
                    width: 96,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Color(0xffD9D9D9)
                    ),
                    child: LayoutBuilder(
                      builder:(context, constraints) {
                        return Stack(
                          children: [
                            Positioned(
                                top:constraints.maxHeight/2.5,
                                left: constraints.maxWidth/2.7,
                                child: Icon(Icons.camera_alt,
                                color: Color(0x1a000000),
                                )),
                            Positioned(
                              top:constraints.maxHeight/1.3,
                              left:constraints.maxWidth/1.3,
                              child: Container(
                                height: 16,
                                width: 16,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color(0xff3F54D1)
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: constraints.maxHeight*0.5,
                  left: constraints.maxWidth*0.1,
                  child: Text("Aadhar Verification",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  ),
                ),
                Positioned(
                   top: constraints.maxHeight*0.55,
                  left: 5.w,

                  child: Form(
                    key: _formkey,
                    child: Row(


                      children: [
                        SizedBox(
                          height: 7.h,
                          width: constraints.maxWidth/4,

                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            maxLength: 3,
                            autofocus: true,
                            onSaved: (pin1) {},


                            onChanged: (value) {
                              if(value.length==3){
                                FocusScope.of(context).nextFocus();
                              }
                            },

                            decoration: InputDecoration(

                              fillColor: Color(0x053F54D1),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color(0x08000000))
                              ),
                                border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Color(0x08000000))
                              ),
                              counterText: ""
                            ),
                            validator: (value) {
                              if(value==null || value.isEmpty){
                                return "Please enter otp";
                              }return null;
                            },
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                         SizedBox(width: 7.w),
                        SizedBox(
                          height: 7.h,
                          width: constraints.maxWidth/4,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            maxLength: 3,
                            autofocus: true,
                            onSaved: (pin2) {},
                            onChanged: (value) {
                              if(value.length==3){
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration: InputDecoration(
                                fillColor: Color(0x053F54D1),
                                filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color(0x08000000)),
                              ),

                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: Color(0x08000000))
                                ),


                                counterText: ""
                            ),
                            validator: (value) {
                              if(value==null || value.isEmpty){
                                return "Please enter otp";
                              }return null;
                            },
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        SizedBox(
                          height:7.h,
                          width: constraints.maxWidth/4,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            maxLength: 3,
                            autofocus: true,
                            onSaved: (pin3) {},
                            onChanged: (value) {
                              if(value.length==3){
                                // FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration:  InputDecoration(
                                fillColor: Color(0x053F54D1),
                                filled: true,
                                enabledBorder: OutlineInputBorder(

                                    borderSide: BorderSide(
                                        width: 1,
                                        color: Color(0x08000000)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: Color(0x08000000))
                                ),
                                counterText: ""
                            ),
                            validator: (value) {
                              if(value==null || value.isEmpty){
                                return "Please enter otp";
                              }return null;
                            },
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: constraints.maxHeight*0.7,
                  left: 5.w,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(90.w, 2.h),
                          backgroundColor: Color(0xff3F54D1),
                          foregroundColor: Colors.white
                      ),
                      onPressed: () {
                        if(_formkey.currentState!.validate()){
                          Get.to(TechNav());

                        };
                      }, child: Text("Next",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                  )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
