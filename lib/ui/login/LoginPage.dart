import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ibnsina_pharma_supplier/ui/home/home_page.dart';
import 'package:ibnsina_pharma_supplier/ui/login/LoginViewModel.dart';
import 'package:ibnsina_pharma_supplier/network/api/HttpUrls.dart';
import 'package:ibnsina_pharma_supplier/network/models/profile/sales_rep_login_request.dart';
import 'package:ibnsina_pharma_supplier/network/models/profile/sales_rep_login_response.dart';
import 'package:ibnsina_pharma_supplier/utils/Helpers.dart';
import 'package:ibnsina_pharma_supplier/utils/colors.dart';
import 'package:provider/provider.dart';

import 'forget/forget_password.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data = AppLocalizations.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ibnsinaPharmaLogo(),
          loginWelcomeText(data.welcome_to_ibnsina_pharma),
          loginForm(data.username, data.hint_password, data.username_error,
              data.password_error),
          loginButton(
              data.btn_login,
              SalesRepLoginRequest(
                  username: userNameController.text,
                  password: passwordController.text)),
          forgetPasswordText(data.forgot_password)
        ],
      ),
    );
  }

  Widget ibnsinaPharmaLogo() => Center(
      child: SvgPicture.asset("assets/images/ic_ibnsina_title_logo.svg"));

  Widget loginWelcomeText(String message) => Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: Text(
            message,
            style: TextStyle(fontSize: 25, color: pink),
          ),
        ),
      );

  Widget loginForm(String userNameHint, String passwordHint,
      String usernameError, String passwordError) {
    var col = Form(
        key: _formKey,
        child: Column(
          children: [
            userNameInput(userNameHint, usernameError),
            passwordInput(passwordHint, passwordError),
          ],
        ));
    return col;
  }

  Widget userNameInput(String hint, String error) => Padding(
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15.0),
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          child: TextFormField(
            validator: (value) {
              userNameController.text = value;
              return isInputTextNotValid(value, error);
            },
            controller: userNameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              fillColor: Colors.white,
              hintText: hint,
              prefixIcon: SvgPicture.asset(
                "assets/images/ic_profile.svg",
                fit: BoxFit.none,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      );

  Widget passwordInput(String hint, String error) => Padding(
        padding: EdgeInsets.fromLTRB(20.0, 4.0, 20.0, 15.0),
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          child: TextFormField(
            validator: (value) {
              passwordController.text = value;
              return isInputTextNotValid(value, error);
            },
            controller: passwordController,
            obscureText: !_passwordVisible,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              fillColor: Colors.white,
              hintText: hint,
              prefixIcon: SvgPicture.asset(
                "assets/images/ic_lock.svg",
                fit: BoxFit.none,
              ),
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  !_passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
            ),
          ),
        ),
      );

  loginButton(String btnText, SalesRepLoginRequest loginRequest) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xff01A0C7),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () async {
            if (_formKey.currentState.validate()) {
              showProgressDialog(context);
              await Provider.of<LoginViewModel>(context, listen: false)
                  .loginUser(SalesRepLoginRequest(
                  username: userNameController.text,
                  password: passwordController.text,
              ));
              loginEvents();
           }
          },
          child: Text(btnText,
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  void loginEvents()async {
   context.read<LoginViewModel>().allLoginEvents.stream.listen((events) {
      switch (events.runtimeType) {
        case User:
          {
            var usr = events as User;
            if (usr != null && usr.token.isNotEmpty) {
              logger.i(usr.toJson().toString());
              Navigator.pop(context);
             moveTo(context, HomePage());
            }
            break;
          }
        case String:
          {
            var error = events as String;
            if (error.isNotEmpty) {
              Navigator.pop(context);
              showMyDialog(context, "Error", error);
            }
            break;
          }
      }
    });
  }

  Widget forgetPasswordText(String forgetPassText) => Container(
        width: double.infinity,
        child: GestureDetector(
          onTap: (){
            moveTo(context, ForgetPassword());
          },
          child: Padding(
            child: Text(
              forgetPassText + "?",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                  letterSpacing: 2,
                  color: colorPrimaryDark,
                  decorationColor: colorPrimaryDark),
            ),
            padding: EdgeInsets.only(left: 20, right: 30),
          ),
        ),
      );
}
