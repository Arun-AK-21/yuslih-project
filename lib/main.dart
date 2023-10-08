import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_figma_project/bottom_navigation/finder_screen.dart';
import 'package:new_figma_project/technician_page/bottom_nav/navigation.dart';
import 'package:new_figma_project/workers/painter_list.dart';
import 'package:new_figma_project/sign_up_figma.dart';
import 'package:new_figma_project/splash_screen1.dart';
import 'package:sizer/sizer.dart';

import 'bottom_navigation/bottom_bar1.dart';
import 'bottom_navigation/schedules.dart';
import 'grids/gridview_pics.dart';
import 'login_paint.dart';
import 'new_homepage.dart';
import 'profile.dart';
import 'technician_page/expert.dart';
import 'technician_page/personal_info.dart';
import 'technician_page/tech_home.dart';
import 'technician_page/verification.dart';
import 'test_1.dart';
import 'test_page.dart';
import 'user_details.dart';
import 'workers/carpenter.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'widget_tree.dart';


void main() {

  runApp(
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType)
    {
      return ChangeNotifierProvider(
        create: (context) => UserDetails(),
        child: GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a blue toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: MySplash(),
        ),
      );
    },



    );

  }
}


