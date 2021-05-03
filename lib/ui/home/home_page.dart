import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibnsina_pharma_supplier/network/api/HttpUrls.dart';
import 'package:ibnsina_pharma_supplier/network/api/base_response.dart';
import 'package:ibnsina_pharma_supplier/network/models/home/home.dart';
import 'package:ibnsina_pharma_supplier/network/models/profile/sales_rep_login_response.dart';
import 'package:ibnsina_pharma_supplier/network/services/HomeService.dart';
import 'package:ibnsina_pharma_supplier/ui/home/home_app_bar.dart';
import 'package:ibnsina_pharma_supplier/utils/Helpers.dart';
import 'package:ibnsina_pharma_supplier/utils/colors.dart';
import 'package:ibnsina_pharma_supplier/utils/constants_values.dart';
import 'package:ibnsina_pharma_supplier/utils/padding_helper.dart';
import 'package:ibnsina_pharma_supplier/utils/shared_pref_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'home_bottom_actions.dart';
import 'home_drawer.dart';
import 'home_message_card.dart';
import 'home_statistics.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
  static _HomePageState of(BuildContext context) => context.findAncestorStateOfType<_HomePageState>();

}

class _HomePageState extends State<HomePage> {
  Locale _locale;

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }
  User user;
  AppLocalizations data;
  Home homeResponse;
  HomeService service;

  @override
  void initState() {
    service = HomeService();
    user = User();
    homeResponse = Home();
    getServerStatistics();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: colorPrimaryDark,
      drawer: Drawer(
        child: HomeDrawer(data).build(context),
      ),
      appBar: HomeAppBar().build(context),
      bottomNavigationBar: HomeBottomBar().build(context),
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: service.getHomeStatistics(),
          builder: (c, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var h = snapshot.data as Home;
              //  if (snapshot.hasData)
              return Stack(children: [
                getOvalShapeBackground(),
                HomeMessagesCard(data).build(context),
                HomeStatistics(data,homeResponse).build(context),
                HomeActionsCards(data).build(context),
              ]);
              //  else

            } else return showProgressLoading();
          },
        ),
      ),
    );
  }

  FractionallySizedBox getOvalShapeBackground() {
    return FractionallySizedBox(
      alignment: Alignment.center,
      heightFactor: .4,
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(120.0),
                bottomRight: Radius.circular(120.0))),
        child: Container(
          height: 50,
          width: double.infinity,
        ),
      ),
    );
  }

  Future<Home> getServerStatistics() async {
    service.homeStream.listen((event) {
      switch (event.status) {
        case Status.LOADING:
          {
            return Future.value(Home());
          }
        case Status.COMPLETED:
          {
            logger.i(event.data.toJson().toString());
            homeResponse = event.data;
            return Future.value(event.data);
          }

        case Status.ERROR:
          return Future.value(Home());
      }
    });
  }
}
