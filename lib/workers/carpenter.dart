import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:new_figma_project/test_page.dart';
import 'package:new_figma_project/workers/card_controller.dart';
import 'package:new_figma_project/workers/carpenter_controller.dart';
// import 'package:new_figma_project/workers/favorite_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;


import 'package:get/get.dart';

import 'CarpenterApi.dart';




class NewCarp extends StatefulWidget {
  const NewCarp({super.key});

  @override
  State<NewCarp> createState() => _NewCarpState();
}

class _NewCarpState extends State<NewCarp> {
  List pics = ['assets/images/albert.png','assets/images/arshid.png','assets/images/ananthu.png','assets/images/sumith.png','assets/images/jenin.png','assets/images/albert.png','assets/images/ananthu.png'];
  // List name = ['Albert Alex','Arshid','Ananthu','Sumith','Jenin K Joy','Alex','Ananthu'];
  List title = ['Expert Carpenter','Expert Carpenter','Expert Carpenter','Pro Carpenter','Expert Carpenter','Expert Carpenter','Expert Carpenter'];
  List price = ['55.00/','53.00/','53.00/','180.00/','53.00/','53.00/','53.00/'];
  List star = ['assets/images/star.png','assets/images/4star.png','assets/images/star.png','assets/images/4star.png','assets/images/4star.png','assets/images/4star.png','assets/images/star.png'];


  // PainterController controllerGet = Get.put(PainterController());
   CardController controllerGet1 = Get.put(CardController());
  CarpenterController controllerGet =Get.put(CarpenterController());
  @override
  Widget build(BuildContext context) {
    final leftviewpadding =MediaQuery.of(context).viewPadding.left;
    final rightviewpadding =MediaQuery.of(context).viewPadding.right;
    // final topviewpadding =MediaQuery.of(context).viewPadding.top;
    // final bottomviewpadding =MediaQuery.of(context).viewPadding.bottom;
    double value = 3.5;

    Future<List<Record>?>getRecords() async {
      var response = await http.get(
          Uri.parse("https://api.jsonbin.io/v3/b/651e63dc12a5d376598775ab"));
      if (response.statusCode == 200) {
        var jsondata = jsonDecode(response.body.toString());
        var data = CarpenterApi.fromJson(jsondata);
        var list = data.record;
        return list;
      } else {
        throw Exception("failed to load list");
      }
    }


    //   Future<List<FigmaApi>> getRecords()async{
    //     final response = await http.get(Uri.parse("https://api.jsonbin.io/v3/b/651e63dc12a5d376598775ab"));
    //         final body = jsonDecode(response.body);
    //         return body.map<FigmaApi>(FigmaApi.fromJson(json)).toList();
    //   }



    return LayoutBuilder(
      builder: (context, constraints) =>
       Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.back(), icon: Icon(Icons.arrow_back)),
          actions: [
            Padding(
              padding:  EdgeInsets.only(right: rightviewpadding + 10,top: 10),
              child: InkWell(
                onTap: () => Get.to(ProfileOne()),
                child: Image.asset('assets/images/appbar.png',
                  height: 52,
                  width: 52,
                ),
              ),
            )
          ],
          bottom:PreferredSize(

              preferredSize: Size.fromHeight(30),

              child: Padding(
                padding:  EdgeInsets.only(left: 10,bottom: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Carpenter",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              )) ,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            FutureBuilder(
              future:getRecords(),
              builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data as List<Record>;

                    return SizedBox(
                      height: constraints.maxHeight/1.2,
                      child: ListView.separated(
                        primary: true,
                        separatorBuilder: (context, index) =>
                            Divider(height: 15),
                        itemBuilder: ( context,int index) {
                          var s = data[index];
                         return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only
                                    (left: leftviewpadding + 12, top: 10),
                                  width: 96,
                                  height: 103,
                                  decoration: ShapeDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(pics[index])),
                                      shape: RoundedRectangleBorder()
                                  ),
                                  child: Text('')
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: leftviewpadding + 10),
                                child: SizedBox(
                                  height: 80,
                                  // width: MediaQuery
                                  //     .sizeOf(context)
                                  //     .width / 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Align(alignment: Alignment.centerLeft,
                                        child: Text("${s.name}",
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            // height: 20

                                          ),
                                        ),

                                      ),
                                      Text("${s.category}",
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff252528)
                                        ),
                                      ),
                                      // Image.asset(star[index],
                                      //   width: 97,
                                      //   height: 16,
                                      // ),
                                      RatingStars(
                                        value: value,
                                        valueLabelVisibility: false,
                                        starColor: Colors.yellow,
                                        starSize: 16,
                                      ),
                                      Text.rich(
                                          TextSpan(
                                              text: "\u{20B9}${s.price}/",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500
                                              ),
                                              children: [
                                                TextSpan(
                                                    text: 'Hrs',
                                                    style: GoogleFonts.poppins(
                                                        fontWeight: FontWeight
                                                            .w500,
                                                        fontSize: 10
                                                    )
                                                )
                                              ]
                                          )
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,

                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: constraints.maxWidth*0.08),
                                        child: Obx(()=>
                                           IconButton(


                                            color: controllerGet.tempCarp.contains(controllerGet.num[index].toString())?Color(0xffFE2B2B) : Color(0xffEFEFEF),
                                            onPressed: () {
                                              if(controllerGet.tempCarp.contains(controllerGet.num[index].toString())){
                                                controllerGet.removeFromFavorites(controllerGet.num[index].toString());
                                              }else{
                                                controllerGet.addToFavorites(controllerGet.num[index].toString());
                                              }controllerGet1.addCard1("${s.name}", "${s.category}", "${s.price}");
                                            },
                                             icon: Icon(Icons.favorite,
                                               color: controllerGet.tempCarp.contains(controllerGet.num[index].toString())?Color(0xffFE2B2B) : Color(0xffEFEFEF),
                                             ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: constraints.maxWidth*0.06, top: constraints.maxHeight*0.070),
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 25.w,
                                          height: 31,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .circular(35),
                                              border: Border.all(
                                                  width: 1,
                                                  color: Color(0xff4FE0B5)
                                              )
                                          ),
                                          child: Text("Hire",
                                            style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff4FE0B5)
                                            ),
                                          ),
                                        ),
                                      )
                                    ]
                                ),
                              )

                            ],
                          );

                        },
                        itemCount:data.length,
                        scrollDirection: Axis.vertical,

                      ),
                    );
                  }
                  return Padding(
                    padding:  EdgeInsets.symmetric(vertical: 30.h),
                    child: Center(child: CircularProgressIndicator(
                      backgroundColor:Color(0xffE2E6FF),
                      color: Color(0xff3F54D1),
                    )),
                  );
            }
            )
          ],
        ),
      ),
    );
  }
}
