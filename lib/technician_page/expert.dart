import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:dropdown_search/dropdown_search.dart';
// import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'verification.dart';
class ExpertTech extends StatefulWidget {
  const ExpertTech({super.key});

  @override
  State<ExpertTech> createState() => _ExpertTechState();
}

class _ExpertTechState extends State<ExpertTech> {
   // bool? ischecked = false;

   // List name= ["Expert painter","Carpenter","Plumber","Cleaner","Gardner","House keeping","Helper","Welder","Bike Mechanic","Ac Mechanic"];

    List<Map>Categories =[
      {"name":"Expert painter","isChecked":false},
      {"name":"Carpenter","isChecked":false},
      {"name":"Plumber","isChecked":false},
      {"name":"Cleaner","isChecked":false},
      {"name":"Gardner","isChecked":false},
      {"name":"House keeping","isChecked":false},
      {"name":"Helper","isChecked":false},
      {"name":"Welder","isChecked":false},
      {"name":"Bike Mechanic","isChecked":false},
      {"name":"Ac Mechanic","isChecked":false}
    ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: LayoutBuilder(

        builder: (context, constraints) {
        return SingleChildScrollView(
          child: Stack(

            children: [
              Padding(
                padding:  EdgeInsets.only(top: 7.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 2.w),
                      child: IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(Icons.arrow_back),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(right:3.w),
                      child: Text('2/3',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14
                        ),
                      ),
                    )
                  ],
                ),
              ),

              Padding(
                padding:  EdgeInsets.only(left: constraints.maxWidth*0.3),
                child: SvgPicture.asset('assets/images/body.svg'),
              ),
              Padding(
                padding:  EdgeInsets.only(left:5.w,top: constraints.maxHeight/3.7),
                child: Text("Choose your field(s)",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400
                ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 5.w,top: constraints.maxHeight/3.3),
                child: Text("Help us to fix",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18
                ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 5.w,top: constraints.maxHeight/2.7),
                child: Text("You are qualified for",
                style:GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                ) ,
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: constraints.maxHeight/2.45,left: 5.w,right: 5.w),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      check(BuildContext,context);

                    });
                  },
                  child: Container(alignment: Alignment.center,
                    width: constraints.maxWidth/1.1,
                    height:45,
                    decoration: BoxDecoration(
                      color: Color(0x0D3F54D1),
                      borderRadius: BorderRadius.circular(5),

                    ),
                    child: Text("Choose Categories",
                      style:GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        color: Color(0xff3F54D1)
                      ) ,
                    ),

                  ),
                ),
              ),



              Padding(
                padding:  EdgeInsets.only(right: 5.w,top:constraints.maxHeight/2,left: 5.w),
                child: Text("How many years of experience you got?",
                  style:GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  ) ,
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left:5.w,right: 5.w,top:constraints.maxHeight/1.85),
                child: DropdownSearch(

                  dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    hintText: "Select",
                    hintStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffBFBFBF)
                          ) ,

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0x08000000)
                      )
                    )
                  )
                ),

                  items: [
                    "1 Year",
                    "2 Year",
                    "3 Year",
                    "More than 4 year",

                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 5.w,top: constraints.maxHeight/1.55),
                child: Text("What's your pricing in an hourly basis ?",
                style:GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left:5.w,right: 5.w,top: constraints.maxHeight/1.45 ),
                child: SizedBox(
                  height: 45,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter amount in INR",
                      hintStyle:GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffBFBFBF)
                        ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0x08000000)
                        )
                      )
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: constraints.maxHeight/1.2,left: 5.w),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(90.w, 2.h),
                        backgroundColor: Color(0xff3F54D1),
                        foregroundColor: Colors.white
                    ),
                    onPressed: () {
                      Get.to(Verify());
                    }, child: Text("Next",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  ),
                )),
              )

            ],),
        );
      },)
    );
  }
   void check(BuildContext,context){
     showDialog(context: context, builder: (context) => SizedBox(
         height: MediaQuery.of(context).size.height,
         width:MediaQuery.of(context).size.width,
       child: StatefulBuilder(

         builder: (context, setState) =>  AlertDialog(
            insetPadding: EdgeInsets.zero,

           actions: [
             TextButton(
                 style: TextButton.styleFrom(
                  backgroundColor: Color(0xff3F54D1),
                  foregroundColor: Colors.white
                ),
               onPressed: () {
                  Get.back();
               }, child: Text("Done"))],
           surfaceTintColor:Colors.white ,
            scrollable: true,
            shape: ContinuousRectangleBorder(
             borderRadius: BorderRadius.all(Radius.zero)
         ),

          content:  SizedBox(
                  height:MediaQuery.of(context).size.height/1.3 ,
            width: MediaQuery.of(context).size.width/1.25,
             child:SingleChildScrollView(
               child: Column(
                   children:Categories.map((names){
                     return CheckboxListTile(
                       visualDensity: VisualDensity.standard,
                        activeColor: Color(0xff3F54D1),
                       checkColor:Color(0xffffffff),
                         // fillColor: MaterialStatePropertyAll(Color(0xff3F54D1)),
                       side: BorderSide(color: Color(0xff3F54D1),
                       width: 2
                       ),
                       checkboxShape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(2)
                       ),

                       controlAffinity: ListTileControlAffinity.leading,
                       contentPadding: EdgeInsets.only(
                       right: 100,
                     ),
                     title: Text(names['name']),
                       value: names['isChecked'],
                       onChanged: (value) {
                         setState(() {
                           names['isChecked']=value;
                         });
                       },);
                   }

                   ).toList()
               ),
             )
            // ListView.separated(
            //   primary: false,
            //   scrollDirection: Axis.vertical,
            //   itemCount:Categories.length,
            //   itemBuilder: (context, index) {
            //     return Row(
            //       children: Categories.map((names) => CheckboxListTile(
            //         value: names['isChecked'],
            //         onChanged: (value) {
            //           names['isChecked']=value;
            //         },
            //
            //       )).toList(),
            //     );
            //   },
            //   separatorBuilder: (context, index) => Divider(),
            // ),
          ),
         ),
       ),
     ),);
   }

}
