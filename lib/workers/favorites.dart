import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:new_figma_project/workers/card_controller.dart';
import 'package:new_figma_project/workers/carpenter_controller.dart';
import 'package:new_figma_project/workers/favorite_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  PainterController getxController=Get.put(PainterController());
  CardController getxController1 = Get.put(CardController());
  CarpenterController newController = Get.put(CarpenterController());
  late String user;
  late String category;
  var data=Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: Obx(() =>
         ListView.builder(
          itemCount: getxController1.itemCount.value,

         itemBuilder: (context, index) {
           return Padding(
             padding:  EdgeInsets.only(left: 5.w,right: 5.w),
             child: Card(shape: OutlineInputBorder(
               borderRadius: BorderRadius.circular(15),
               borderSide: BorderSide.none
             ),
               elevation: 0.5,
               child: ListTile(
                 shape: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(15),
                   borderSide: BorderSide.none
                 ),
                 tileColor:  Color(0xFF3F54D1).withOpacity(0.1),

                 title: Text(getxController1.cardFav.value[index].name,
                 style: GoogleFonts.poppins(
                   fontSize: 16,
                   fontWeight: FontWeight.w600,
                   color: Color(0xFF3F54D1),
                 ),
                 ),
                 subtitle: Text(getxController1.cardFav.value[index].Category,
                 style: GoogleFonts.poppins(
                   fontWeight: FontWeight.w400,
                   fontSize: 12,
                   color: Color(0xff5d8aa8),
                 ),
                 ),
                 trailing: IconButton(
                   icon: Icon(Icons.delete_forever,
                   color: Color(0xffFE2B2B).withOpacity(1),
                   ),
                   onPressed: () {
                     getxController1.removeCard(index);
                   getxController.removeFromFavorite(getxController.name[index].toString());
                     newController.removeFromFavorites(newController.num[index].toString());
                   },
                 ),
               ),
             ),
           );
         },

        ),
      ),
    );
  }
}
