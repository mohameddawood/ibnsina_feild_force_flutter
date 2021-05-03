import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibnsina_pharma_supplier/network/models/profile/sales_rep_login_response.dart';
import 'package:ibnsina_pharma_supplier/ui/contacts/contact_us.dart';
import 'package:ibnsina_pharma_supplier/ui/home/home_page.dart';
import 'package:ibnsina_pharma_supplier/ui/login/LoginPage.dart';
import 'package:ibnsina_pharma_supplier/ui/settings/settings.dart';
import 'package:ibnsina_pharma_supplier/utils/Helpers.dart';
import 'package:ibnsina_pharma_supplier/utils/app_language.dart';
import 'package:ibnsina_pharma_supplier/utils/colors.dart';
import 'package:ibnsina_pharma_supplier/utils/constants_values.dart';
import 'package:ibnsina_pharma_supplier/utils/padding_helper.dart';
import 'package:ibnsina_pharma_supplier/utils/shared_pref_helper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeDrawer extends StatelessWidget {
  AppLocalizations data;

  HomeDrawer(this.data);

  AppLanguage appLanguage;

  @override
  Widget build(BuildContext context) {
    appLanguage = Provider.of<AppLanguage>(context);
    return Column(
      children: [drawerHeader(), drawerItems(context)],
    );
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

  Widget drawerItems(BuildContext context) {
    return ListBody(
      children: [
        getPaddingTop(),
        getOnlineOrderItem(),
        getPaddingTop(),
        getPublicationItem(),
        getPaddingTop(),
        getContactUsItem(context),
        getPaddingTop(),
        getSettingsItem(context),
        getPaddingTop(),
        getLogoutItem(context)
      ],
    );
  }

  Widget getOnlineOrderItem() => InkWell(
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
                data.online_ordering,
                style: TextStyle(color: Colors.black87),
              ),
            ],
          ),
        ),
      );

  Widget getPublicationItem() => InkWell(
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
                data.menu_moh_publications,
                style: TextStyle(color: Colors.black87),
              ),
            ],
          ),
        ),
      );

  Widget getContactUsItem(BuildContext context) => InkWell(
        onTap: () {
          moveToWithStack(context,ContactUs());
        },
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
                data.contact_us,
                style: TextStyle(color: Colors.black87),
              ),
            ],
          ),
        ),
      );

  Widget getSettingsItem(BuildContext context) => InkWell(
        onTap: () {
          moveToWithStack(context,SettingsPage());
        },
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
                data.menu_settings,
                style: TextStyle(color: Colors.black87),
              ),
            ],
          ),
        ),
      );

  Widget getLogoutItem(BuildContext context) => InkWell(
        onTap: () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          await preferences.clear();
          moveToWithReplace(context, LoginPage());
        },
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
                data.menu_logout,
                style: TextStyle(color: Colors.black87),
              ),
            ],
          ),
        ),
      );

  Future<User> getData() async {
    String str = await getStringKey(USER_PROFILE_DATA) ?? "";
    return User.fromJson(jsonDecode(str));
  }
}
