import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:new_figma_project/login_paint.dart';
import 'package:flutter_svg/svg.dart';
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
                  nextScreen:MyHome(),
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
