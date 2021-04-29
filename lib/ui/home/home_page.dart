import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibnsina_pharma_supplier/network/api/user/HttpUrls.dart';
import 'package:ibnsina_pharma_supplier/network/models/profile/sales_rep_login_response.dart';
import 'package:ibnsina_pharma_supplier/ui/home/home_view_model.dart';
import 'package:ibnsina_pharma_supplier/utils/colors.dart';
import 'package:ibnsina_pharma_supplier/utils/constants_values.dart';
import 'package:ibnsina_pharma_supplier/utils/padding_helper.dart';
import 'package:ibnsina_pharma_supplier/utils/shared_pref_helper.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [drawerHeader(), drawerItems()],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: colorPrimaryDark),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SvgPicture.asset(
              "assets/images/ic_doctor.svg",
              width: 30,
              height: 20,
            ),
            Padding(padding: EdgeInsets.all(4)),
            Text(
              "${user?.supplierShortName ?? "-"}",
              style: TextStyle(color: colorPrimaryDark),
            )
          ],
        ),
      ),
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Column(
          children: [],
        ),
      ),
    );
  }

  getData() async {
    await Provider.of<HomeViewModel>(context, listen: false).getUserData();
    context.read<HomeViewModel>().userStream.stream.listen((i) {
      user = i;
    });
  }

  Widget drawerHeader() {
    getData();
    return Container(
      width: double.infinity,
      color: colorPrimaryDark,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 50)),
          SvgPicture.asset(
            "assets/images/ic_doctor.svg",
            width: 70,
            height: 70,
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text(
            "Welcome ${user?.supplierName ?? ''}",
            style: TextStyle(color: Colors.white),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
        ],
      ),
    );
  }

  Widget drawerItems() {
    return ListBody(
      children: [
        getPaddingTop(),
        getOnlineOrderItem(),
        getPaddingTop(),
        getPublicationItem(),
        getPaddingTop(),
        getContactUsItem(),
        getPaddingTop(),
        getSettingsItem(),
        getPaddingTop(),
        getLogoutItem()
      ],
    );
  }

  Widget getOnlineOrderItem() => GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/images/ic_online_ordering.svg",
                width: 20,
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              Text(
                "Online order",
                style: TextStyle(color: Colors.black87),
              ),
            ],
          ),
        ),
      );

  Widget getPublicationItem() => GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/images/ic_moh_publications.svg",
                width: 20,
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              Text(
                "Publications",
                style: TextStyle(color: Colors.black87),
              ),
            ],
          ),
        ),
      );

  Widget getContactUsItem() => GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/images/ic_nav_contact_us.svg",
                width: 20,
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              Text(
                "Contact Us",
                style: TextStyle(color: Colors.black87),
              ),
            ],
          ),
        ),
      );

  Widget getSettingsItem() => GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/images/ic_nav_settings.svg",
                width: 20,
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              Text(
                "Settings",
                style: TextStyle(color: Colors.black87),
              ),
            ],
          ),
        ),
      );

  Widget getLogoutItem() => GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/images/ic_nav_logout.svg",
                width: 20,
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              Text(
                "Logout",
                style: TextStyle(color: Colors.black87),
              ),
            ],
          ),
        ),
      );
}
