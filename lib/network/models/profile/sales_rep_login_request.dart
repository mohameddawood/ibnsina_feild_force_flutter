
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SalesRepLoginRequest {
  String _username;
  String _password;

  String get username => _username;
  String get password => _password;

  SalesRepLoginRequest({
      String username, 
      String password}){
    _username = username;
    _password = password;
}

  SalesRepLoginRequest.fromJson(dynamic json) {
    _username = json["username"];
    _password = json["password"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["username"] = _username;
    map["password"] = _password;
    return map;
  }

}