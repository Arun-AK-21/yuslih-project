
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:fl_chart/fl_chart.dart';


import 'barData/bar_data.dart';
import 'barData/charts.dart';
import 'pie_chart/pie_chart.dart';

class TechHome extends StatefulWidget {

   TechHome({super.key});

  @override
  State<TechHome> createState() => _TechHomeState();
}


class _TechHomeState extends State<TechHome> {
  List <double>week = [
    30.00,
    50.00,
    90.24,
    50.31,
    00.00,
    40.34,
    31.44
  ];
  List names=[
    "MO",
    "TU",
    "WE",
    "TH",
    "FR",
    "SA",
    "SU"
  ];
  Widget bottomTitles (double value, TitleMeta meta){
    final titles= names;
    final Widget text=Text(titles[value.toInt()]);
    return SideTitleWidget(
      child: text,
      axisSide:meta.axisSide ,
    );

  }
  @override
  Widget build(BuildContext context) {


    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          //
          body: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 2,

                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              // radius: 10,
                                colors:
                                [

                                  // Color(0xa96175ed),
                                  Color(0xff3F54D1).withOpacity(0.4),
                                  Colors.white.withOpacity(0.2),


                                ],
                                stops: [
                                  0.2, 0.7
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft

                            )
                        ),
                      ),
                      ListTile(
                        leading: SvgPicture.asset('assets/images/yuslih.svg',
                          width: 68,
                          height: 27,
                        ),

                        trailing: Image.asset('assets/images/appbar.png'),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: constraints.maxHeight/7,left: 5.w),
                        child: Text("Dashboard",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: constraints.maxHeight/5.4,left: 5.w,right: 5.w),
                        child: Container(
                          height: 170,
                          width: MediaQuery.of(context).size.width,

                          decoration: BoxDecoration(
                              color: Color(0xff6175ED).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(9),

                          ),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                             return Stack(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(top: 4.h,left: 4.w),
                                    child: SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: PieChartSample2(),
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(top: constraints.maxHeight/1.2,left: 2.w),
                                    child: Row(
                                      children: [
                                       Container(alignment: Alignment.center,
                                         height: 2.h,
                                         width: 7.w,
                                         decoration: BoxDecoration(
                                           color: Color(0xffFF715B),
                                           borderRadius: BorderRadius.circular(5)
                                         ),
                                         child: Text("SKIP",
                                         style: GoogleFonts.roboto(
                                           fontWeight: FontWeight.w700,
                                           fontSize: 10,
                                           color: Colors.white
                                         ),
                                         ),
                                       ),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        Container(alignment: Alignment.center,
                                          height: 2.h,
                                          width: 12.w,
                                          decoration: BoxDecoration(
                                              color: Color(0xff6665DD),
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: Text("COMMIT",
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 10,
                                                color: Colors.white
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        Container(alignment: Alignment.center,
                                          height: 2.h,
                                          width:constraints.maxWidth/5,
                                          decoration: BoxDecoration(
                                              color: Color(0xff34D1BF),
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: Text("COMPLETED",
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 10,
                                                color: Colors.white
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(left: 3.w,top: 1.h),
                                    child: Text("Statistics",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black
                                    ),
                                    ),
                                  ),
                                 Padding(
                                   padding:  EdgeInsets.only(top: constraints.maxHeight/2.5,left: constraints.maxWidth/7),
                                   child: Column(
                                     children: [
                                       Text("95",
                                       style: GoogleFonts.poppins(
                                         fontWeight: FontWeight.w700,
                                         fontSize: 13,
                                         color: Color(0xff414D55),
                                       ),
                                       ),
                                       Text("ORDERS",
                                       style: GoogleFonts.roboto(
                                         fontSize: 4.68,
                                         fontWeight: FontWeight.w500,
                                         color: Color(0xff696D6E)
                                       ),
                                       )
                                     ],
                                   ),
                                 ),

                                 Padding(
                                    padding:  EdgeInsets.only(top: constraints.maxHeight/3,left: 40.w),
                                    child: SizedBox(
                                      width: 176,
                                      height: 71,
                                      child: BarChart1(),
                                    ),
                                  )

                                ],
                              );

                            }
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: constraints.maxHeight/2.2,left: 5.w),
                        child: Text("Latest Jobs",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 18
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: constraints.maxHeight/2,left: 5.w,right: 5.w),
                        child: Card(
                          elevation: 0.5,
                          shape:OutlineInputBorder(
                          borderSide: BorderSide.none
                        ) ,
                          child: Container(
                            color: Color(0x8cFCFCFD),
                            height:MediaQuery.of(context).size.height/4,
                            width: MediaQuery.of(context).size.width,

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ListTile(
                                  leading: Text("Gate Painting",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Color(0xff252528)
                                  ),
                                  ),
                                  trailing: Text("14/06/23",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                      color: Color(0xff252528)
                                  ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:  EdgeInsets.only(left: 3.w),
                                    child: AutoSizeText("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut "
                                        " massa id lectus blandit, \nsed accumsan urna condimentum. Mauris eget sem ut tortor "
                                        "laoreet tincidunt sed et diam.",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12
                                    ),
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: Text("3 Minutes ago",
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                      color: Color(0xff888888)
                                  ),
                                  ),
                                  title: Padding(
                                    padding:  EdgeInsets.only(left: 15.w),
                                    child: Text("Skip",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        color: Color(0xff888888)
                                      ),
                                    ),
                                  ),
                                  trailing: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Color(0x384FE0B5)
                                    ),
                                    onPressed: () {},
                                    child:Text("Commit",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        color: Color(0xff696969)
                                      ),
                                    ) ,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: constraints.maxHeight*0.79,left: 5.w,right: 5.w),
                        child: Card(
                          elevation: 0.5,
                          shape:OutlineInputBorder(
                              borderSide: BorderSide.none
                          ) ,
                          child: Container(
                            color: Color(0x8cFCFCFD),
                            height:MediaQuery.of(context).size.height/4,
                            width: MediaQuery.of(context).size.width,

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ListTile(
                                  leading: Text("House Painting",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Color(0xff252528)
                                    ),
                                  ),
                                  trailing: Text("14/06/23",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff252528)
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:  EdgeInsets.only(left: 3.w),
                                    child: AutoSizeText("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut "
                                        " massa id lectus blandit, \nsed accumsan urna condimentum. Mauris eget sem ut tortor "
                                        "laoreet tincidunt sed et diam.",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12
                                      ),
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: Text("3 Minutes ago",
                                    style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff888888)
                                    ),
                                  ),
                                  title: Padding(
                                    padding:  EdgeInsets.only(left: 15.w),
                                    child: Text("Skip",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff888888)
                                      ),
                                    ),
                                  ),
                                  trailing: TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Color(0x384FE0B5)
                                    ),
                                    onPressed: () {},
                                    child:Text("Commit",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff696969)
                                      ),
                                    ) ,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );

      }
    );
  }
}
