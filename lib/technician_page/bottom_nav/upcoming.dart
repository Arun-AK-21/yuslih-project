import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
class UpComing extends StatelessWidget {
  const UpComing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: 40.h,left: 35.w),
        child: Container(
          height:MediaQuery.of(context).size.height ,
          width: MediaQuery.of(context).size.width,
          child: Text("No data to show",

          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400
          ),
          ),
        ),
      ),
    );
  }
}
