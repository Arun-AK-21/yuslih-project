import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';

import '../../bottom_navigation/schedules.dart';
import 'my_works.dart';
import 'tech_home.dart';
import 'upcoming.dart';


class TechNav extends StatefulWidget {
  const TechNav({super.key});

  @override
  State<TechNav> createState() => _TechNavState();
}

class _TechNavState extends State<TechNav> {
  int currentIndex = 0;
  final selectedColor = Color(0xff4FE0B5);

  @override
  Widget build(BuildContext context) {
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
              child:Image.asset('assets/images/schedule.png',
                height: 24,
                width: 24,
                color: currentIndex==1? selectedColor : Color(0xff7282E2),
              ),
              label: 'My Works',
              labelStyle:  GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color: currentIndex==1? selectedColor : Color(0xff7282E2)
              )
          ),
          CurvedNavigationBarItem(
              child:Image.asset('assets/images/calender.png',
                height: 24,
                width: 24,
                color: currentIndex==2? selectedColor : Color(0xff7282E2),
              ),
              label: 'Upcoming',
              labelStyle:  GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color: currentIndex==2? selectedColor : Color(0xff7282E2)
              )
          ),

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
        widget = TechHome();
        break;
      case 1 :
        widget = MyWorks();
        break;
      default: widget = UpComing();
    }return widget;
  }
  }

