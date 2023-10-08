import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/svg.dart';

import 'user_details.dart';
class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          Container(
            height: 28.h,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children:[

                Padding(
                  padding:  EdgeInsets.only(top: 10.h,left: 32.w),
                  child: Material(
                    elevation: 0.15,
                    borderRadius: BorderRadius.circular(70),shadowColor: Colors.grey,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 10,
                          color: Colors.white
                        ),
                        borderRadius: BorderRadius.circular(70)

                      ),
                      child: Image.asset('assets/images/appbar.png'),
                    ),
                  ),
                ),


                Positioned(
                  top: 21.h,
                  left: 58.w,
                  child: Container(
                    height: 22,
                    width: 22,
                    decoration: BoxDecoration(
                        color: Color(0xff4FE0B5),
                        borderRadius: BorderRadius.circular(60)
                    ),
                    child: Icon(Icons.brush,
                      color: Colors.white,
                      size: 10,
                    ),
                  ),
                ),


              ]
            ),
          ),
          Consumer<UserDetails>(builder:(context, value, child) {
            return Text(value.User,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
            );
          }, ),

          Consumer<UserDetails>(builder:(context, value, child) {


            return Text(value.Email,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.black
            )
            );
          }),
          Divider(),

        ],
      ),
    );
  }
}
