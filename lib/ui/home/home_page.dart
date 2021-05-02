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

import 'home_statistics.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        child: Column(
          children: [drawerHeader(), drawerItems()],
        ),
      ),
      appBar: HomeAppBar(user?.supplierShortName).build(context),
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
                getHomePageMessageAlert(),
                HomeStatistics(data,homeResponse).build(context),
                getHomeActionsCard(),
              ]);
              //  else

            } else return showProgressLoading();
          },
        ),
      ),
    );
  }

  Column getHomeStatistics() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            getPaddingStart(val: 8.0),
            Expanded(
                child: Material(
              elevation: 8,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  getPaddingTop(val: 5.0),
                  SvgPicture.asset(
                    "assets/images/ic_consumed.svg",
                    height: 30,
                    width: 30,
                  ),
                  getPaddingTop(val: 4.0),
                  Text(
                    "${homeResponse.data?.acceptedTotalAmount ?? ''}${data.egp}",
                  ),
                  Text(data.confirmed),
                  getPaddingTop(val: 4.0),
                  getPaddingBottom(val: 5.0),
                ],
              ),
            )),
            getPaddingStart(),
            Expanded(
                //makes the red row full width
                child: Material(
              color: Colors.white,
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  getPaddingTop(val: 5.0),
                  SvgPicture.asset(
                    "assets/images/ic_users.svg",
                    height: 30,
                    width: 30,
                  ),
                  getPaddingTop(val: 4.0),
                  Text("${homeResponse.data?.customerCount ?? 0}"),
                  Text(data.bd_customers_list),
                  getPaddingTop(val: 4.0),
                  getPaddingBottom(val: 5.0),
                ],
              ),
            )),
            getPaddingStart(),
            Expanded(
                //makes the red row full width
                child: Material(
              elevation: 8,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  getPaddingTop(val: 5.0),
                  SvgPicture.asset(
                    "assets/images/ic_credit_limit.svg",
                    height: 30,
                    width: 30,
                  ),
                  getPaddingTop(val: 4.0),
                  Text(
                    "${homeResponse.data?.pendingTotalAmount ?? ''}${data.egp}",
                  ),
                  Text(data.pending),
                  getPaddingTop(val: 4.0),
                  getPaddingBottom(val: 5.0),
                ],
              ),
            )),
            getPaddingStart(),
            Expanded(
                //makes the red row full width
                child: Material(
              elevation: 8,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  getPaddingTop(val: 5.0),
                  SvgPicture.asset(
                    "assets/images/ic_balance.svg",
                    height: 30,
                    width: 30,
                  ),
                  getPaddingTop(val: 4.0),
                  Text(
                    "${homeResponse.data?.confirmedTotalAmount ?? ''}${data.egp}",
                  ),
                  Text(data.accepted_orders),
                  getPaddingTop(val: 4.0),
                  getPaddingBottom(val: 5.0),
                ],
              ),
            )),
            getPaddingStart(val: 8.0)
          ],
        ),
      ],
    );
  }

  Column getHomeActionsCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          color: Colors.transparent,
          height: 200,
          width: double.infinity,
          child: Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: Material(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/ic_online_ordering.svg",
                          width: 50,
                          height: 50,
                        ),
                        Text(data.customer_orders)
                      ],
                    ),
                  ),
                ),
                getPadding(val: 15.0),
                Container(
                  height: 100,
                  width: 100,
                  child: Material(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/ic_shopping.svg",
                          width: 50,
                          height: 50,
                        ),
                        Text(data.list_of_orders)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column getHomePageMessageAlert() {
    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
              child: Material(
                elevation: 5,
                color: pink,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/ic_notification_important.svg",
                        width: 20,
                        height: 20,
                        color: Colors.white,
                      ),
                      getPaddingStart(),
                      Text(
                        data.beta_version,
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Material(
                elevation: 5,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Text(
                        data.beta_welcome_msg,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
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

  Future<User> getData() async {
    String str = await getStringKey(USER_PROFILE_DATA) ?? "";
    user  = User.fromJson(jsonDecode(str));
    return User.fromJson(jsonDecode(str));
  }

  Widget drawerHeader() {
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
          FutureBuilder(
              future: getData(),
              builder: (_, snp) {
                if (snp.hasData) {
                  var u = snp.data as User;
                  return Text(
                    "Welcome ${u?.supplierName ?? ''}",
                    style: TextStyle(color: Colors.white),
                  );
                } else
                  return Text("data");
              }),
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
