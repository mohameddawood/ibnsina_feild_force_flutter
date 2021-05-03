import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibnsina_pharma_supplier/ui/home/home_app_bar.dart';
import 'package:ibnsina_pharma_supplier/utils/app_language.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  AppLanguage appLanguage;
  bool isAppInArabic = false;

  @override
  Widget build(BuildContext context) {
    appLanguage = Provider.of<AppLanguage>(context);
    String arabic = "تغير الي العربية";
    String english = "Change To English";
    String lang = "";
    String code = appLanguage.appLocal.languageCode;
    if (code == "en") {
      isAppInArabic = false;
      lang = arabic;
    } else {
      isAppInArabic = true;
      lang = english;
    }
    return Scaffold(
      appBar: HomeAppBar().build(context),
      bottomNavigationBar: HomeBottomBar().build(context),
      body: Material(
        child: Container(
          child: Row(
            children: [
              Switch(
                  value: isAppInArabic,
                  onChanged: (val) {
                    if (val) {
                      appLanguage.changeLanguage(Locale("ar"));
                    } else {
                      appLanguage.changeLanguage(Locale("en"));
                    }
                  }),
              Text(lang,style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.w400
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
