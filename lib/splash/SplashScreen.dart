

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibnsina_pharma_supplier/utils/Helpers.dart';

import 'OnBoarding.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      moveToWithReplace(context, OnBoardingScreens());
    });

    return MaterialApp(
      color: Colors.white,
      home: Scaffold(
          body:
            Center(
              child: AnimatedOpacity(
                opacity: .9,
                duration: Duration(seconds: 2),
                child: SvgPicture.asset(
                    "assets/images/ic_ibnsina_logo.svg",
                  width: 150,height: 150,
                ),
              ),
            ),
      ),
    );
  }
}
