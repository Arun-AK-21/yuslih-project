import 'package:flutter/material.dart';
import 'package:new_figma_project/test_page.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';


class FinderOne extends StatefulWidget {
  const FinderOne({super.key});

  @override
  State<FinderOne> createState() => _FinderOneState();
}

class _FinderOneState extends State<FinderOne> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      top: false,
      child: Scaffold(
            appBar: AppBar(
              actions: [
              Padding(
                padding:  EdgeInsets.only(right:3.w),
                child: InkWell(
                  onTap: () =>Get.to(ProfileOne()),
                  child: Image.asset('assets/images/appbar.png',
                  height: 52,
                    width: 52,
                  ),
                ),
              )
              ],
            ),
        body: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 5.w,right: 5.w,top: 5.h),
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0x1FE4F8F8),
                  hintText: "Search Technician Name, Category",
                  hintStyle:GoogleFonts.poppins(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                    color: Color(0xffBFBFBF)
                  ),
                  prefixIcon: Icon(Icons.search,
                  color: Color(0xffE9ECEF),
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 3.w,top: 6.h),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Recent Searches",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffBFBFBF)
                ),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 5.h),
              child: Row(
                children: [

                  Padding(
                    padding:  EdgeInsets.only(left: 5.w),
                    child: Container(
                      height: 37,
                      width: 100,
                      decoration: BoxDecoration(
                          color:Color(0x1FE4F8F8) ,
                        borderRadius: BorderRadius.circular(50)

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.access_time,
                            size: 15,
                            color:Color(0xffBFBFBF) ,
                          ),
                          AutoSizeText("Electrician",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xffBFBFBF)
                          ),
                          )
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(left: 5.w),
                    child: Container(
                      height: 37,
                      width: 96,
                      decoration: BoxDecoration(
                          color:Color(0x1FE4F8F8) ,
                          borderRadius: BorderRadius.circular(50)

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.access_time,
                            size: 15,
                            color:Color(0xffBFBFBF) ,
                          ),
                          AutoSizeText("Plumber",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(0xffBFBFBF)
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(left: 5.w),
                    child: Container(
                      height: 37,
                      width: 72,
                      decoration: BoxDecoration(
                          color:Color(0x1FE4F8F8) ,
                          borderRadius: BorderRadius.circular(50)

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.access_time,
                            size: 15,
                            color:Color(0xffBFBFBF) ,
                          ),
                          AutoSizeText("Cook",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(0xffBFBFBF)
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
