import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ibnsina_pharma_supplier/splash/OnBoarding.dart';
import 'package:ibnsina_pharma_supplier/splash/SplashScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ibnsina_pharma_supplier/ui/home/home_page.dart';
import 'package:ibnsina_pharma_supplier/ui/login/LoginPage.dart';
import 'package:ibnsina_pharma_supplier/ui/settings/settings.dart';
import 'package:ibnsina_pharma_supplier/utils/app_language.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(MyApp(
    appLanguage: appLanguage,
  ));
}

class MyApp extends StatelessWidget {
  final AppLanguage appLanguage;
  MyApp({this.appLanguage});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLanguage>(
      create:(_)=>appLanguage ,
      child: Consumer<AppLanguage>(builder: (context, model, child) {
        return MaterialApp(
          locale: model.appLocal,
          supportedLocales: [
            Locale('en', 'US'),
            Locale('ar', ''),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],

          home: SplashScreen(),
          routes: {
            "splash":(_)=>SplashScreen(),
            "onBoarding":(_)=>OnBoardingScreens(),
            "login":(_)=>LoginPage(),
            "home":(_)=>HomePage(),
            "settings":(_)=>SettingsPage(),
          },
        );
      }),

    );
  }
}
