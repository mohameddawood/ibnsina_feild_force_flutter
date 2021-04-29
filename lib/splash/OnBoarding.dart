import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibnsina_pharma_supplier/ui/login/LoginPage.dart';
import 'package:ibnsina_pharma_supplier/ui/login/LoginViewModel.dart';
import 'package:ibnsina_pharma_supplier/utils/Helpers.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class OnBoardingScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = AppLocalizations.of(context);
    var pageOne = PageViewModel(
      title: data.onBoardingMessageOne ?? "Welcome",
      body: "_",
      image: SvgPicture.asset(
        "assets/images/ic_boarding_one.svg",
        height: double.infinity,
        fit: BoxFit.contain,
      ),
    );

    var pageTwo = PageViewModel(
      title: data.onBoardingMessageTwo ?? "Welcome",
      body: "_",
      image: Center(
        child: SvgPicture.asset(
          "assets/images/ic_boarding_two.svg",
          height: 400,
        ),
      ),
    );
    var pageThree = PageViewModel(
      title: data.onBoardingMessageThree ?? "Welcome",
      body: "_",
      image: Center(
        child: SvgPicture.asset(
          "assets/images/ic_boarding_three.svg",
          height: 400,
        ),
      ),
    );
    var listPagesViewModel = [
      pageOne,
      pageTwo,
      pageThree,
    ];
    return MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
          home: Scaffold(
              body: Padding(
            padding: EdgeInsets.only(top: 100, bottom: 50),
            child: IntroductionScreen(
              pages: listPagesViewModel,
              onDone: () {
                // When done button is press
                moveTo(
                    context,
                    ChangeNotifierProvider<LoginViewModel>(
                        create: (_) => LoginViewModel(), child: LoginPage()));
              },
              onSkip: () {
                // You can also override onSkip callback
              },
              showSkipButton: true,
              skip: const Icon(Icons.skip_next),
              next: const Icon(Icons.next_plan),
              done: Text(data.get_started,
                  style: TextStyle(fontWeight: FontWeight.w600)),
              dotsDecorator: DotsDecorator(
                  size: const Size.square(10.0),
                  activeSize: const Size(20.0, 10.0),
                  activeColor: Colors.green,
                  color: Colors.black26,
                  spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0))),
            ),
          )),
        ));
  }
}
