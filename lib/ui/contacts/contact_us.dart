import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibnsina_pharma_supplier/ui/home/home_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ibnsina_pharma_supplier/utils/colors.dart';
import 'package:ibnsina_pharma_supplier/utils/padding_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'info@ibnsina-pharma.com',
      queryParameters: {'subject': 'Example Subject & Symbols are allowed!'});

  @override
  Widget build(BuildContext context) {
    var data = AppLocalizations.of(context);
    return Scaffold(
      appBar: HomeAppBar().build(context),
      bottomNavigationBar: HomeBottomBar().build(context),
      body: Material(
        child: ListView(
          children:[
            Column(
              children: [
                getPaddingTop(val: 15.0),
                Center(
                  child: Text(
                    data.contact_us,
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: darkGray, fontSize: 15),
                  ),
                ),
                getPaddingTop(val: 10.0),
                getHotLineCard(data),
                getWebsiteCard(data),
                getEmailCard(data),
                getHeadQuarterAddressCard(data),
                getIbnsinaMap(),
                getSocialMediaCard(data),
              ],
            ),
          ]

        ),
      ),
    );
  }

  Widget getHotLineCard(AppLocalizations data) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
      child: Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 5,
          color: Colors.white,
          child: InkWell(
            onTap: () {
              launch("tel://${data.hotline}");
            },
            child: ListTile(
              leading: SvgPicture.asset("assets/images/ic_nav_contact_us.svg"),
              title: Text(
                data.hotline_lbl,
                style: TextStyle(
                  color: colorPrimaryDark,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: Text(
                data.hotline,
                style: TextStyle(
                    color: colorPumpkin,
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )),
    );
  }

  Widget getWebsiteCard(AppLocalizations data) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
      child: Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 5,
          color: Colors.white,
          child: InkWell(
            onTap: () {
              launch("http://www.ibnsina-pharma.com");
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: Row(children: [
                    SvgPicture.asset(
                      "assets/images/ic_language.svg",
                      color: darkGray,
                    ),
                    getPaddingStart(val: 8.0),
                    Text(
                      data.website,
                      style: TextStyle(
                        color: darkGray,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ]),
                ),
                Divider(
                  color: medGrey,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "http://www.ibnsina-pharma.com",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: darkGray,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget getEmailCard(AppLocalizations data) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
      child: Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 5,
          color: Colors.white,
          child: InkWell(
            onTap: () {
              launch(_emailLaunchUri.toString());
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: Row(children: [
                    SvgPicture.asset(
                      "assets/images/ic_email.svg",
                      color: darkGray,
                    ),
                    getPaddingStart(val: 8.0),
                    Text(
                      data.e_mail,
                      style: TextStyle(
                        color: darkGray,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ]),
                ),
                Divider(
                  color: medGrey,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "info@ibnsina-pharma.com",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: darkGray,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget getHeadQuarterAddressCard(AppLocalizations data) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
      child: Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 5,
          color: Colors.white,
          child: InkWell(
            onTap: () {},
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: Row(children: [
                    SvgPicture.asset(
                      "assets/images/ic_address.svg",
                      color: darkGray,
                    ),
                    getPaddingStart(val: 8.0),
                    Text(
                      data.address,
                      style: TextStyle(
                        color: darkGray,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ]),
                ),
                Divider(
                  color: medGrey,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Building no.234,2nd District,5th Settlement\nNew Cairo",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: darkGray,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget getIbnsinaMap(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: InkWell(
          onTap: (){
            launch("https://goo.gl/maps/ih37VergQyryAKBW9");
          },
          child: Image.asset("assets/images/ibnsina_address.png",
            width: double.infinity,
            height: 200,
          ),
        ),
      ),
    );
  }

  Widget getSocialMediaCard(AppLocalizations data) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
      child: Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 5,
          color: Colors.white,
          child: InkWell(
              onTap: () {},
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          launch("https://youtube.com/channel/UCzy68UsvwL2Zyz_41N5e80Q");
                        },
                        child:
                            SvgPicture.asset("assets/images/ic_youtube.svg",width: 40,height: 40,)),
                    getPaddingStart(),
                    InkWell(
                        onTap: () {launch("https://www.instagram.com/ibnsina_pharma/");},
                        child:
                            SvgPicture.asset("assets/images/ic_instagram.svg",width: 40,height: 40,)),
                    getPaddingStart(),
                    InkWell(
                        onTap: () {launch("https://www.linkedin.com/mwlite/company/ibnsinapharmaofficial");},
                        child:
                            SvgPicture.asset("assets/images/ic_linked_in.svg",width: 40,height: 40,)),
                    getPaddingStart(),
                    InkWell(
                        onTap: () {launch("https://m.facebook.com/Ibnsinapharmaofficial");},
                        child:
                            SvgPicture.asset("assets/images/ic_facebook.svg",width: 40,height: 40,)),
                    getPaddingStart(),
                  ],
                ),
              )))),
    );
  }
}
