import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SalesRepLoginResponse {
  String _tokenString;
  User _user;
  String _refreshToken;

  String get tokenString => _tokenString;

  User get user => _user;

  String get refreshToken => _refreshToken;

  SalesRepLoginResponse({String tokenString, User user, String refreshToken}) {
    _tokenString = tokenString;
    _user = user;
    _refreshToken = refreshToken;
  }

  SalesRepLoginResponse.fromJson(dynamic json) {
    _tokenString = json["tokenString"];
    _user = json["user"] != null ? User.fromJson(json["user"]) : null;
    _refreshToken = json["refreshToken"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["tokenString"] = _tokenString;
    if (_user != null) {
      map["user"] = _user.toJson();
    }
    map["refreshToken"] = _refreshToken;
    return map;
  }
}

@JsonSerializable()
class User {
  num _userID;
  String _userName;
  String _supplierName="_";
  String _supplierShortName;
  bool _superUserFlag;
  String _email;
  String _mobileNumber;
  String _fullName;
  String _token;
  List<dynamic> _functions;
  List<dynamic> _userMainBranches;
  bool _changePasswordFlag;
  int _supplierCode;

  num get userID => _userID;

  String get userName => _userName;

  String get supplierName => _supplierName;

  String get supplierShortName => _supplierShortName;

  bool get superUserFlag => _superUserFlag;

  String get email => _email;

  String get mobileNumber => _mobileNumber;

  String get fullName => _fullName;
  String get token => _token;

  List<dynamic> get functions => _functions;

  List<dynamic> get userMainBranches => _userMainBranches;

  bool get changePasswordFlag => _changePasswordFlag;

  int get supplierCode => _supplierCode;

  User(
      {num userID,
      String userName,
      String supplierName,
      String supplierShortName,
      bool superUserFlag,
      String email,
      String mobileNumber,
      String fullName,
      String token,
      List<dynamic> functions,
      List<dynamic> userMainBranches,
      bool changePasswordFlag,
      int supplierCode}) {
    _userID = userID;
    _userName = userName;
    _supplierName = supplierName;
    _supplierShortName = supplierShortName;
    _superUserFlag = superUserFlag;
    _email = email;
    _mobileNumber = mobileNumber;
    _fullName = fullName;
    _functions = functions;
    _userMainBranches = userMainBranches;
    _changePasswordFlag = changePasswordFlag;
    _supplierCode = supplierCode;
  }

  User.fromJson(dynamic json) {
    _userID = json["userID"] as num;
    _userName = json["userName"];
    _supplierName = json["supplierName"];
    _supplierShortName = json["supplierShortName"];
    _superUserFlag = json["superUserFlag"];
    _email = json["email"];
    _mobileNumber = json["mobileNumber"];
    _fullName = json["fullName"];
    _changePasswordFlag = json["changePasswordFlag"];
    _supplierCode = json["supplierCode"];
    _token = '';
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["userID"] = _userID;
    map["userName"] = _userName;
    map["supplierName"] = _supplierName;
    map["supplierShortName"] = _supplierShortName;
    map["superUserFlag"] = _superUserFlag;
    map["email"] = _email;
    map["mobileNumber"] = _mobileNumber;
    map["fullName"] = _fullName;
    map["token"] = _token;
    if (_functions != null) {
      map["functions"] = _functions.map((v) => v.toJson()).toList();
    }
    if (_userMainBranches != null) {
      map["userMainBranches"] =
          _userMainBranches.map((v) => v.toJson()).toList();
    }
    map["changePasswordFlag"] = _changePasswordFlag;
    map["supplierCode"] = _supplierCode;
    return map;
  }

  setToken(String token){
    _token = token;
  }
}
