import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:new_figma_project/bottom_navigation/bottom_bar1.dart';
import 'package:new_figma_project/login_paint.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_figma_project/sign_up_figma.dart';
class MySplash extends StatefulWidget {
  const MySplash({super.key});

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:Stack(
            children: [
              AnimatedSplashScreen(
                  splash: SvgPicture.asset('assets/images/yuslih.svg'),
                  nextScreen:StreamBuilder(
                    stream: FirebaseAuth.instance.authStateChanges(), 
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        return BottomNav1();
                      }else {
                        return MyHome();
                      }
                    },),
              animationDuration: Duration(seconds: 1),
              splashTransition:SplashTransition.scaleTransition,

              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 200),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CircularProgressIndicator(
                    color: Color(0xFF123329),
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
