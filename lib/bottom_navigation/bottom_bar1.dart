import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_figma_project/bottom_navigation/schedules.dart';
import 'package:new_figma_project/new_homepage.dart';
import 'package:new_figma_project/sign_up_figma.dart';
import 'package:new_figma_project/test_1.dart';
import 'package:new_figma_project/workers/favorites.dart';

import '../login_paint.dart';
import 'finder_screen.dart';


class BottomNav1 extends StatefulWidget {
  const BottomNav1({super.key});

  @override
  State<BottomNav1> createState() => _BottomNav1State();
}

class _BottomNav1State extends State<BottomNav1> {
  int currentIndex = 0;
  final selectedColor = Color(0xff4FE0B5);
  @override
  Widget build(BuildContext context) {
    final leftviewpadding =MediaQuery.of(context).viewPadding.left;
    final rightviewpadding =MediaQuery.of(context).viewPadding.right;
    final topviewpadding =MediaQuery.of(context).viewPadding.top;
    final bottomviewpadding =MediaQuery.of(context).viewPadding.bottom;

    GlobalKey bottomnavigationbar = GlobalKey();
    return Scaffold(
      extendBody: false,
      bottomNavigationBar: CurvedNavigationBar(

          buttonBackgroundColor: Colors.transparent,

        animationDuration: Duration(milliseconds: 1000),
        animationCurve: Curves.easeOut,
          index: currentIndex,
        iconPadding:0 ,
          key: bottomnavigationbar,
          height: 70,

          color:  Color(0xFF3F54D1),
          backgroundColor: Colors.white,



          items:[
            CurvedNavigationBarItem(
                child:Icon(Icons.home_filled,
                color:currentIndex==0? selectedColor : Color(0xff7282E2),
                ),
            label: 'Home',
              labelStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: currentIndex==0? selectedColor : Color(0xff7282E2)
              )
            ),
            CurvedNavigationBarItem(
              child:Image.asset('assets/images/finder.png',
              height: 24,
                width: 24,
                color: currentIndex==1? selectedColor : Color(0xff7282E2),
              ),
            label: 'Finder',
              labelStyle:  GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color: currentIndex==1? selectedColor : Color(0xff7282E2)
              )
            ),
            CurvedNavigationBarItem(
                child:Image.asset('assets/images/schedule.png',
                height: 24,
                  width: 24,
                  color: currentIndex==2? selectedColor : Color(0xff7282E2),
                ),
            label: 'Schedules',
              labelStyle:  GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color: currentIndex==2? selectedColor : Color(0xff7282E2)
              )
            ),
            CurvedNavigationBarItem(
                child: Icon(Icons.favorite,
                color:currentIndex==3? selectedColor : Color(0xff7282E2),
                ),
            label: 'Favorite',
              labelStyle:  GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color:currentIndex==3? selectedColor : Color(0xff7282E2)
              )
            )
          ],
          onTap: (index) =>setState(() {
            this.currentIndex = index;
          }),
        letIndexChange: (value) => true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: getSelectedWidget(index: currentIndex),
      ),

    );
  }
   getSelectedWidget({required int index}){
    Widget widget;
    switch(index){
      case 0 :
        widget = TestHome();
        break;
      case 1 :
        widget = FinderOne();
        break;
      case 2:
        widget = NewSchedule();
      default: widget = Favorites();
    }return widget;
   }
}
