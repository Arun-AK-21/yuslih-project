import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_figma_project/workers/carpenter.dart';
import 'package:new_figma_project/workers/painter_list.dart';
import 'package:sizer/sizer.dart';


class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
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
  List pages= [Painterlist(),NewCarp(),Painterlist(),NewCarp(),Painterlist(),NewCarp()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 1.5.h,horizontal: 5.w),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder:(context, index) => buildImage(index, context),
            separatorBuilder: (context, index) => SizedBox(width: 20,),
          ),
        ),
      ),
    );
  }
  Widget buildImage(index, ctx)=>InkWell(
    onTap: () {
      // Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => pages[index]));

    },
    child: SizedBox(
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
    ),
  );
}
