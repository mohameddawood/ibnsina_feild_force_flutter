import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:ibnsina_pharma_supplier/network/models/profile/sales_rep_login_request.dart';
import 'package:ibnsina_pharma_supplier/network/models/profile/sales_rep_login_response.dart';
import 'package:ibnsina_pharma_supplier/network/services/LoginService.dart';
import 'package:ibnsina_pharma_supplier/utils/constants_values.dart';
import 'package:ibnsina_pharma_supplier/utils/shared_pref_helper.dart';

class LoginViewModel with ChangeNotifier {
  User _user = User();

  // ignore: close_sinks
  StreamController<Object> allLoginEvents = StreamController<Object>();

  String _errors = "";

  loginUser(SalesRepLoginRequest loginRequest) async {
    var service = LoginService(loginRequest);
    await service.login();
    var response = service.loginResponse;

    if (response != null && response.user.userID != null) {
      _user = response.user;
      _user.setToken(response.tokenString);
      allLoginEvents.add(_user);
      await saveUserPref(response);
    } else {
      _errors = service.errorMessage;
      allLoginEvents.add(_errors);
    }
    notifyListeners();
  }

  Future saveUserPref(SalesRepLoginResponse response) async {
    await saveStringKey(USER_PROFILE_DATA, jsonEncode(_user));
    await saveStringKey(USER_TOKEN, response.tokenString);
    await saveStringKey(USER_REFRESH_TOKEN, response.refreshToken);
  }

  User get user => _user;

  String get errors => _errors;

  @override
  void dispose() {
    allLoginEvents.close();
    super.dispose();
  }
}
