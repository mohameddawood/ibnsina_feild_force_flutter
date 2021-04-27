import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:ibnsina_pharma_supplier/network/models/profile/sales_rep_login_request.dart';
import 'package:ibnsina_pharma_supplier/network/models/profile/sales_rep_login_response.dart';
import 'package:ibnsina_pharma_supplier/network/services/LoginService.dart';

class LoginViewModel with ChangeNotifier {
  User _user = User();
  // ignore: close_sinks
  StreamController<User> streamUser  = StreamController<User>();
  // ignore: close_sinks
  StreamController<Object> allLoginEvents  = StreamController<Object>();

  String _errors = "";

  loginUser(SalesRepLoginRequest loginRequest) async {
    var service = LoginService(loginRequest);
    await service.login();
    var response = service.loginResponse;

    if (response != null && response.user.userID != null) {
      _user = response.user;
      _user.token = response.tokenString;
      streamUser.add(_user);
      allLoginEvents.add(_user);
    } else {
      _errors = service.errorMessage;
      allLoginEvents.add(_errors);
    }
    notifyListeners();
  }

  User get user => _user;

  String get errors => _errors;
}
