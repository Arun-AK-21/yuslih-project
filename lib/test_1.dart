import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_figma_project/grids/gridview_pics.dart';
import 'package:new_figma_project/profile.dart';
import 'package:new_figma_project/test_page.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class TestHome extends StatefulWidget {

  const TestHome({super.key});

  @override
  State<TestHome> createState() => _TestHomeState();
}

class _TestHomeState extends State<TestHome> {
  var texstyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 12
  );
  List name=['Painter','Carpenter','Electrician','Driver','Painter','Electrician'];
  List items = ["assets/images/painter.png",
    "assets/images/carpenter.png",
    "assets/images/electrician.png",
    "assets/images/driver.png",
    "assets/images/painter.png",
    "assets/images/electrician.png"

  ];
  @override
  Widget build(BuildContext context) {
    final leftviewpadding =MediaQuery.of(context).viewPadding.left;
    final rightviewpadding =MediaQuery.of(context).viewPadding.right;
    final topviewpadding =MediaQuery.of(context).viewPadding.top;
    final bottomviewpadding =MediaQuery.of(context).viewPadding.bottom;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height/1,
          child: ListView(
            scrollDirection: Axis.vertical,
            primary: false,
            physics: AlwaysScrollableScrollPhysics(),
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height:MediaQuery.of(context).size.height/4,

                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors:
                            [

                              // Color(0xa96175ed),
                              Color(0xff3F54D1).withOpacity(0.2),
                              Colors.white.withOpacity(0.4),

                            ],
                            stops: [
                              0.2,0.9
                            ],
                            begin:Alignment.topRight,
                            end: Alignment.bottomLeft

                        )
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(top: 5),
                    child: ListTile(
                      leading:Image.asset('assets/images/yuslih1.png',
                            scale: 3,
                           ),
                      trailing:InkWell(
                        child: Image.asset('assets/images/appbar.png',
                                  width: 52,
                                  height: 52,
                                  scale: 2,
                           ),
                        onTap: () =>Get.to(ProfileOne()),
                      ),
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(top: topviewpadding * 3.2,left: leftviewpadding + 10, right: rightviewpadding + 10),
                    child: AspectRatio(
                      aspectRatio: 5.4/2,
                      child: Card(
                        child:Container(
                          width: 350,
                          height: 120,
                          decoration: BoxDecoration(borderRadius:BorderRadius.circular(9),
                              gradient: RadialGradient(colors: [Color(0xFF6175ED),Color(0xFFE2E6FF)],
                                stops: [1,0.5],
                                center: Alignment.centerRight,
                                radius:1.1,


                              )
                          ),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:10,left: 10),
                                    child: Text("Easy to \nfind & fix",

                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Color(0xFF252528)
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: SizedBox(
                                      width: 110,

                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              fixedSize: Size(88, 32),
                                              backgroundColor: Color(0xFF3F54D1),
                                              foregroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))

                                          ),
                                          onPressed: () {

                                          }, child: Text("Find now",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                    ),
                                  )
                                ],
                              ),

                            ],
                          ),
                        ) ,
                      ),
                    ),
                  ),
                  Positioned(
                    top: topviewpadding * 1.9,right: rightviewpadding * 0.3,
                    child: Image.asset('assets/images/profile.png',
                      scale: 2,
                    ),
                  ),
                ],
              ),
              Padding(
                padding:  EdgeInsets.only(top: topviewpadding * 1,left: leftviewpadding + 15),
                child: Text("Choose category",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                    width: 100.w,
                    height: 20.h,
                    child: Category()),
              ),

              Padding(
                padding:  EdgeInsets.only(left:7.w),
                child: Text("Our Top Techies",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                  ),
                ),
              ),SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height/2,

                child: GridView.count(

                    crossAxisCount: 2,
                  childAspectRatio: 2/2.5,
                   crossAxisSpacing:20 ,
                   padding:EdgeInsets.only(left:20,right: 20.112) ,
                   physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  // scrollDirection: Axis.vertical,

                  children: [
                    Container(color: Colors.white,

                      child: Column(
                        children: [
                          Image.asset('assets/images/Cjohn.png'),
                          Text("John Doe",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          Text("Construction Expert",
                            style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Image.asset('assets/images/Ejohn.png'),
                          Text("John Doe",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          Text("Expert Electrician",
                            style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(color: Colors.white,
                      child: Column(
                        children: [
                          Image.asset('assets/images/Cjohn.png'),
                          Text("John Doe",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          Text("Construction Expert",
                            style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Image.asset('assets/images/Ejohn.png'),
                          Text("John Doe",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          Text("Expert Electrician",
                            style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      ),
                    ),
                  ],

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  // Widget buildImage(index, ctx)=>Container(
  //   width: 78,
  //   height: 92,
  //   child: Column(
  //     children: [
  //       Image.asset(items[index]),
  //       Text(name[index],
  //         style: texstyle,
  //       )
  //     ],
  //   ),
  // );
}
