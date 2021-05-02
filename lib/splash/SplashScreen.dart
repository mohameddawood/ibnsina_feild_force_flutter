import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibnsina_pharma_supplier/network/api/HttpUrls.dart';
import 'package:ibnsina_pharma_supplier/network/models/profile/sales_rep_login_response.dart';
import 'package:ibnsina_pharma_supplier/ui/home/home_page.dart';
import 'package:ibnsina_pharma_supplier/ui/home/home_view_model.dart';
import 'package:ibnsina_pharma_supplier/ui/login/LoginPage.dart';
import 'package:ibnsina_pharma_supplier/ui/login/LoginViewModel.dart';
import 'package:ibnsina_pharma_supplier/utils/Helpers.dart';
import 'package:ibnsina_pharma_supplier/utils/constants_values.dart';
import 'package:ibnsina_pharma_supplier/utils/shared_pref_helper.dart';
import 'package:provider/provider.dart';

import 'OnBoarding.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () async {
      bool isFirstTimeToInstallTheApp =
          await getBoolKey(IS_FIRST_INSTALL) ?? false;
      String token = await getStringKey(USER_TOKEN) ?? null;
      if (!isFirstTimeToInstallTheApp) {
        saveBoolKey(IS_FIRST_INSTALL, true);
        moveToWithReplace(context, OnBoardingScreens());
      } else {
        if (token != null && token.isNotEmpty) {
          moveToWithReplace(
              context,
              ChangeNotifierProvider<HomeViewModel>(
                  create: (_) => HomeViewModel(), child: HomePage()));
        } else {
          moveToWithReplace(
              context,
              ChangeNotifierProvider<LoginViewModel>(
                  create: (_) => LoginViewModel(), child: LoginPage()));
        }
      }
    });

    return MaterialApp(
      color: Colors.white,
      home: Scaffold(
        body: Center(
          child: AnimatedOpacity(
            opacity: .9,
            duration: Duration(seconds: 2),
            child: SvgPicture.asset(
              "assets/images/ic_ibnsina_logo.svg",
              width: 150,
              height: 150,
            ),
          ),
        ),
      ),
    );
  }
}
