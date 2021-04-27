import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class HandleErrors {
  int _statusCode;
  List<String> _errorList;
  bool _isSuccess;

  int get statusCode => _statusCode;
  List<String> get errorList => _errorList;
  bool get isSuccess => _isSuccess;

  HandleErrors({
      int statusCode, 
      List<String> errorList, 
      bool isSuccess}){
    _statusCode = statusCode;
    _errorList = errorList;
    _isSuccess = isSuccess;
}

  HandleErrors.fromJson(dynamic json) {
    _statusCode = json["statusCode"];
    _errorList = json["errorList"] != null ? json["errorList"].cast<String>() : [];
    _isSuccess = json["isSuccess"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["statusCode"] = _statusCode;
    map["errorList"] = _errorList;
    map["isSuccess"] = _isSuccess;
    return map;
  }

}