import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHome1 extends StatefulWidget {
  const MyHome1({super.key});

  @override
  State<MyHome1> createState() => _MyHome1State();
}

class _MyHome1State extends State<MyHome1> {

  var texstyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 12
  );
  List name=['Painter','Carpenter','Electrician','Driver'];
  List items = ["assets/images/painter.png",
    "assets/images/carpenter.png",
    "assets/images/electrician.png",
    "assets/images/driver.png"

  ];
  @override
  Widget build(BuildContext context) {
    final leftviewpadding =MediaQuery.of(context).viewPadding.left;
    final rightviewpadding =MediaQuery.of(context).viewPadding.right;
    final topviewpadding =MediaQuery.of(context).viewPadding.top;
    final bottomviewpadding =MediaQuery.of(context).viewPadding.bottom;
    return Scaffold(
      
      body: Column(
            // scrollDirection: Axis.vertical,
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
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

              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 32,left: 16),
                    child: Image.asset('assets/images/albert.png',
                      scale: 3,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 20,left:leftviewpadding + 170),
                    child: Image.asset('assets/images/appbar.png',
                      width: 52,
                      height: 52,
                      scale: 2,
                    ),
                  )
                ],
              ),

              Padding(
                padding:  EdgeInsets.only(top: topviewpadding * 3.2,left: leftviewpadding + 10, right: rightviewpadding + 10),
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

              Positioned(
                top: topviewpadding * 1.9,right: rightviewpadding * 0.3,
                child: Image.asset('assets/images/profile.png',
                  scale: 2,
                ),
              ),
            ],
          ),
          Padding(
            padding:  EdgeInsets.only(top: topviewpadding * 7,left: leftviewpadding + 15),
            child: Text("Choose category",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: leftviewpadding + 10,top: topviewpadding * 8),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder:(context, index) => buildImage(index, context),
                separatorBuilder: (context, index) => SizedBox(width: 20,),
              )
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: topviewpadding * 11.5,left: leftviewpadding + 10),
            child: Text("Our Top Techies",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 18
            ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: topviewpadding * 12.5,left: leftviewpadding + 10),
            child: Row(
              children: [
                SizedBox(
                  width: 160,
                  height: 200,
                  child: Container(color: Colors.white,
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
                ),
                SizedBox(width: 12),
                SizedBox(
                  width: 160,
                  height: 200,
                  child: Container(
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget buildImage(index, ctx)=>Container(
    width: 78,
    height: 92,
      child: Column(
        children: [
          Image.asset(items[index]),
          Text(name[index],
          style: texstyle,
          )
        ],
      ),
  );

}
