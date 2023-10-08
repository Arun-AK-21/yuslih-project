import 'package:flutter/material.dart';
import 'package:new_figma_project/bottom_navigation/finder_screen.dart';
import 'package:new_figma_project/bottom_navigation/schedules.dart';
import 'package:new_figma_project/login_paint.dart';
import 'package:new_figma_project/workers/favorites.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'user_details.dart';
import 'package:get/get.dart';

class ProfileOne extends StatefulWidget {
  const ProfileOne({super.key});

  @override
  State<ProfileOne> createState() => _ProfileOneState();
}

class _ProfileOneState extends State<ProfileOne> {
  final dividerColor =  Color(0xffEFEFEF);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [

          SizedBox(
            height: MediaQuery.of(context).size.height/2.5,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top:5.h),
                  child: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back)),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 35.w,top: 10.h),
                  child: Material(
                    elevation: 0.15,
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(70),
                    child: Container(
                      width: 106,
                      height: 106,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 5,
                          color: Colors.white
                        ),
                        borderRadius: BorderRadius.circular(70)
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                        return Stack(
                          children: [
                            Image.asset('assets/images/appbar.png'),
                            Positioned(
                              top:constraints.maxHeight/1.5,
                              left:constraints.maxWidth/1.3,
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
                          ],
                        );
                      },),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 15.h),
                  child: Align(
                    alignment: Alignment.center,
                    child: Consumer<UserDetails>(builder:(context, value, child) {
                      return Text(value.User,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      );
                    }, ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 21.h),
                  child: Align(
                    alignment: Alignment.center,
                    child: Consumer<UserDetails>(builder:(context, value, child) {


                      return Text(value.Email,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.black
                          )
                      );
                    }),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 27.h),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("+91 9645754762",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black
                        )
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(thickness: 2,color: dividerColor),
          ListTile(
            onTap: () => Get.to(NewSchedule()),
            leading: Container(
              height: 44,
              width: 43,
              decoration: BoxDecoration(
                color: Color(0xccFAFAFA),
                borderRadius: BorderRadius.circular(30)

              ),
              child: Image.asset('assets/images/schedule.png',scale:1.7,
                color: Color(0xff4B4B4B),
                width: 18,
                height: 20,
              ),

            ),
            title: Text("My Schedules",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff252528)
            ),
            ),
          ),
          Divider(thickness: 2,color: dividerColor,height: 30),
          ListTile(
            onTap: () => Get.to(FinderOne()),
            leading: Container(
              height: 44,
              width: 43,
              decoration: BoxDecoration(
                  color: Color(0xccFAFAFA),
                  borderRadius: BorderRadius.circular(30)

              ),
              child: Image.asset('assets/images/finder.png',scale:1.7,
                color: Color(0xff4B4B4B),
                width: 18,
                height: 20,
              ),
            ),
            title: Text("Finder",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff252528)
              ),
            ),
          ),
          Divider(thickness: 2,color: dividerColor,height: 30),
          ListTile(
            onTap: () => Get.to(Favorites()),
            leading: Container(
              height: 44,
              width: 43,
              decoration: BoxDecoration(
                  color: Color(0xccFAFAFA),
                  borderRadius: BorderRadius.circular(30)

              ),
              child: Icon(Icons.favorite,
              color: Color(0xff4B4B4B),
              )
            ),
            title: Text("Favorite",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff252528)
              ),
            ),
          ),
          Divider(thickness: 2,color: dividerColor,height: 30),
          ListTile(
            leading: Container(
                height: 44,
                width: 43,
                decoration: BoxDecoration(
                    color: Color(0xccFAFAFA),
                    borderRadius: BorderRadius.circular(30)

                ),
                child: Image.asset('assets/images/whatsapp.png',scale:1.7,
                  color: Color(0xff4B4B4B),
                  width: 18,
                  height: 20,
                ),
            ),
            title: Text("Customer Support",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff252528)
              ),
            ),
          ),
          Divider(thickness: 2,color: dividerColor,height: 30),
          ListTile(onTap: () => Get.to(MyHome()),
            leading: Container(
              height: 44,
              width: 43,
              decoration: BoxDecoration(
                  color: Color(0xccFAFAFA),
                  borderRadius: BorderRadius.circular(30)

              ),
              child: Image.asset('assets/images/logout.png',scale:1.7,
                color: Color(0xff4B4B4B),
                width: 18,
                height: 20,
              ),
            ),
            title: Text("Logout",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff252528)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
