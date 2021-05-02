import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ibnsina_pharma_supplier/network/models/profile/sales_rep_login_response.dart';
import 'package:ibnsina_pharma_supplier/utils/constants_values.dart';
import 'package:ibnsina_pharma_supplier/utils/shared_pref_helper.dart';

class HomeViewModel with ChangeNotifier {
  // ignore: close_sinks
  StreamController<User> userStream = StreamController<User>();

  Future getUserData() async {
    String str = await getStringKey(USER_PROFILE_DATA) ?? "";
    // userStream.add(User.fromJson(jsonDecode(str)));
    return User.fromJson(jsonDecode(str));
  }

  @override
  void dispose() {
    userStream.close();
    super.dispose();
  }
}
