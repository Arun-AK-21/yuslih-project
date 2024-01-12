import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_figma_project/splash_screen1.dart';
import 'package:sizer/sizer.dart';

import 'user_details.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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


