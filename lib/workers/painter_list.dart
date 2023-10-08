import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_figma_project/body/body.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:new_figma_project/test_page.dart';
import 'package:new_figma_project/workers/card_controller.dart';
import 'package:new_figma_project/workers/favorites.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;


import 'package:get/get.dart';


import 'favorite_controller.dart';
import 'painterApi.dart';

class Painterlist extends StatefulWidget {
  const Painterlist({super.key});

  @override
  State<Painterlist> createState() => _PainterlistState();
}

class _PainterlistState extends State<Painterlist> {
  List pics = ['assets/images/albert.png','assets/images/arshid.png','assets/images/ananthu.png','assets/images/sumith.png','assets/images/jenin.png','assets/images/albert.png','assets/images/ananthu.png'];
  // List name = ['Albert Alex','Arshid','Ananthu','Sumith','Jenin K Joy','Alex','Ananthu'];
  List title = ['Expert Painter','Expert Painter','Expert Painter','Pro Painter','Expert Painter','Expert Painter','Expert Painter'];
  List price = ['55.00/','53.00/','53.00/','180.00/','53.00/','53.00/','53.00/'];
  List star = ['assets/images/star.png','assets/images/4star.png','assets/images/star.png','assets/images/4star.png','assets/images/4star.png','assets/images/4star.png','assets/images/star.png'];
  TextStyle nameStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 14
  );
  // List<String>tempName=[];
  PainterController getController = Get.put(PainterController());
  CardController getController1 = Get.put(CardController());

  @override
  Widget build(BuildContext context) {
    final leftviewpadding =MediaQuery.of(context).viewPadding.left;
    final rightviewpadding =MediaQuery.of(context).viewPadding.right;
    final topviewpadding =MediaQuery.of(context).viewPadding.top;
    final bottomviewpadding =MediaQuery.of(context).viewPadding.bottom;
    // Future<PainterApi>getRecords() async {
    //   var response=await http.get(Uri.parse("https://api.jsonbin.io/v3/b/650c49cf0574da7622ae3901"));
    //   if(response.statusCode==200){
    //     var jsondata=jsonDecode(response.body.toString());
    //     var data=PainterApi.fromJson(jsondata);
    //
    //     return data;
    //   }else{
    //     throw Exception("failed to load list");
    //   }
    // }
    Future<List<Record1>?>getRecords() async {
      var response = await http.get(Uri.parse("https://api.jsonbin.io/v3/b/651e72b40574da7622b4a16b"));
      if (response.statusCode == 200) {
        var jsondata = jsonDecode(response.body.toString());
        var data = PainterApi.fromJson(jsondata);
        var list = data.record;
        return list;
      } else {
        throw Exception("failed to load list");
      }
    }

    double value = 3.5;
    return SafeArea(
      top: false,
      child: LayoutBuilder(
        builder: (context, constraints) =>
         Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () => Get.back(canPop:true ), icon: Icon(Icons.arrow_back)),leadingWidth: 2.w,
            actions: [
              Padding(
                padding:  EdgeInsets.only(right: 5.w),
                child: InkWell(
                  onTap: () =>Get.to(ProfileOne()),
                  child: Image.asset('assets/images/appbar.png'

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
                  child: Text("Painter",
            style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600
            ),
          ),
                ),
              )) ,
          ),
          body: ListView(


            // scrollDirection: Axis.vertical,
            children: [
              FutureBuilder(
              future:getRecords(),
              builder: (context,snapshot) {
                if (snapshot.hasData) {

                  final data = snapshot.data as List<Record1>;
                    print(data);
                  return SizedBox(
                    height: constraints.maxHeight/1.2,
                    child: ListView.separated(
                      primary: false,
                      separatorBuilder: (context, index) => Divider(height: 15),
                      itemBuilder: (BuildContext context,int index) {
                        var s = data[index];
                         return InkWell(
                           // onTap: () {
                           //   Get.to(Favorites(),
                           //   transition: Transition.fadeIn,
                           //     // arguments: ["${s.name}","${title[index]}"],
                           //   );
                           // },
                           child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Container(
                                    margin: EdgeInsets.only(
                                        left: leftviewpadding + 12, top: 10),
                                    width: 96,
                                    height: 103,
                                    decoration: ShapeDecoration(
                                        image: DecorationImage(image: AssetImage(
                                            pics[index])),
                                        shape: RoundedRectangleBorder()
                                    ),
                                    child: Text('')
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: leftviewpadding + 10),
                                  child: SizedBox(
                                    height: 80,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Align(alignment: Alignment.centerLeft,
                                          child: Text('${s.name}',
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
                                        // width: 97,
                                        //   height: 16,
                                        // ),
                                        RatingStars(
                                          value: value,
                                          starColor: Colors.yellow,
                                          valueLabelVisibility: false,

                                        ),
                                        Text.rich(
                                            TextSpan(
                                                text: '\u{20B9}${s.price}',
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
                                Expanded(flex: 2,
                                  child: Column(
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,

                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: constraints.maxWidth*0.19),
                                          child: Obx(() => IconButton(
                                            onPressed: () {
                                              if(getController.tempName.contains(getController.name[index].toString())){
                                                getController.removeFromFavorite(getController.name[index].toString());
                                                // getController.tempName.remove(getController.name[index].toString());
                                              }else {
                                                getController.addToFavorite(getController.name[index].toString());
                                              }
                                              getController1.addCard1("${s.name}", "${s.category}", "${s.price}");
                                            },
                                            icon: Icon(Icons.favorite,
                                             color: getController.tempName.contains(getController.name[index].toString())?Color(0xffFE2B2B) : Color(0xffEFEFEF),
                                            ),

                                          )),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                               top: 5.h),
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 25.w,
                                            height: 5.h,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(35),

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
                                        ),
                                      ]
                                  ),
                                )
                              ],
                            ),
                         );
    },
                      itemCount: data.length,
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
              },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
