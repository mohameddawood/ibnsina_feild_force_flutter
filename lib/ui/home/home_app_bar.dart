

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibnsina_pharma_supplier/network/models/profile/sales_rep_login_response.dart';
import 'package:ibnsina_pharma_supplier/utils/colors.dart';
import 'package:ibnsina_pharma_supplier/utils/constants_values.dart';
import 'package:ibnsina_pharma_supplier/utils/padding_helper.dart';
import 'package:ibnsina_pharma_supplier/utils/shared_pref_helper.dart';

class HomeAppBar extends StatelessWidget {

  User user;
  HomeAppBar();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: colorPrimaryDark),
      backgroundColor: Colors.white,
      actions: [
        SvgPicture.asset("assets/images/ic_profile.svg"),
        getPaddingStart(),
      ],
      title: Row(
        children: [
          SvgPicture.asset(
            "assets/images/ic_doctor.svg",
            width: 30,
            height: 20,
          ),
          Padding(padding: EdgeInsets.all(4)),
          FutureBuilder(
              future: getData(),
              builder: (_,snp){
            return Text(
                "${user?.supplierShortName ?? "-"}",
                style: TextStyle(color: colorPrimaryDark));
          }
          )
        ],
      ),
    );
  }

  Future<User> getData() async {
    String str = await getStringKey(USER_PROFILE_DATA) ?? "";
    user  = User.fromJson(jsonDecode(str));
    return User.fromJson(jsonDecode(str));
  }
}

class HomeBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
                child: SvgPicture.asset(
                  "assets/images/ic_nav_home.svg",
                  width: 20,
                  height: 20,
                )),
            Expanded(
                child: SvgPicture.asset(
                  "assets/images/ic_nav_home.svg",
                  width: 20,
                  height: 20,
                )),
          ],
        ),
      ),
    );
  }
}

