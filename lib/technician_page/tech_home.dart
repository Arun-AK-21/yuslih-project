import 'package:flutter/material.dart';

import 'expert.dart';
import 'personal_info.dart';
import 'verification.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
class TechLogin extends StatefulWidget {
  const TechLogin({super.key});

  @override
  State<TechLogin> createState() => _TechLoginState();
}

class _TechLoginState extends State<TechLogin> {
  final PageController _pageController =PageController(initialPage: 0);
  int _activePage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.7,
            child: PageView(

              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: [
                PersonalInfo(),
                ExpertTech(),
                Verify()
              ],

            ),

          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(90.w, 2.h),
                  backgroundColor: Color(0xff3F54D1),
                  foregroundColor: Colors.white
              ),
              onPressed: () => _pageController.nextPage( duration: Duration(seconds: 1), curve: Curves.easeInOut),

               child: Text("Next",
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600
            ),
          )),
        ],
      ),
    );
  }
}
