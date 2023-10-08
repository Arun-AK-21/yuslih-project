import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_figma_project/test_page.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:get/get.dart';

class NewSchedule extends StatefulWidget {
  const NewSchedule({super.key});

  @override
  State<NewSchedule> createState() => _NewScheduleState();
}

class _NewScheduleState extends State<NewSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xffFFFFFF),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 3.w),
            child: InkWell(
              onTap: () => Get.to(ProfileOne()),
              child: Image.asset(
                'assets/images/appbar.png',
                height: 52,
                width: 52,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 10.w,right: 10.w,top: 6.h),
            child: SfDateRangePicker(
              allowViewNavigation: true,
              selectionMode: DateRangePickerSelectionMode.single,
              initialDisplayDate:DateTime(2000),
              initialSelectedDate: DateTime(2023),
              backgroundColor: Colors.white,
              headerHeight: 50,
             selectionRadius:20,
             minDate: DateTime(2000),navigationDirection:DateRangePickerNavigationDirection.horizontal,
             todayHighlightColor:Color(0xff7282E2),
             toggleDaySelection: true,

             maxDate: DateTime(2100),
              selectionColor: Colors.blue,
              selectionShape:DateRangePickerSelectionShape.rectangle,
              enablePastDates: true,


            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/albert.png',
                height: 103,
                  width: 96,
                ),
                Padding(
                  padding:  EdgeInsets.only(bottom: 10.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(right: 8.w),
                        child: Text("Albert Alex",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                        ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(right: 5.w),
                        child: Text("Expert Painter",
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            color: Color(0xcc252528)
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 5.h),
                  child: Container(
                    width: 30.w,
                    height: 5.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                        border: Border.all(
                          color: Color(0xff4FE0B5),
                          width: 1,
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
              ],
            ),
          )
        ],
      ),
    );
  }
}


