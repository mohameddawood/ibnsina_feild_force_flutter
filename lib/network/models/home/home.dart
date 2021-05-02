import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Home {
  Data _data;
  String _successMessage;
  int _statusCode;
  List<String> _errorList;
  bool _isSuccess;
  int _totalRecords;

  Data get data => _data;
  String get successMessage => _successMessage;
  int get statusCode => _statusCode;
  List<String> get errorList => _errorList;
  bool get isSuccess => _isSuccess;
  int get totalRecords => _totalRecords;

  Home({
      Data data, 
      String successMessage, 
      int statusCode, 
      List<String> errorList, 
      bool isSuccess, 
      int totalRecords}){
    _data = data;
    _successMessage = successMessage;
    _statusCode = statusCode;
    _errorList = errorList;
    _isSuccess = isSuccess;
    _totalRecords = totalRecords;
}

  Home.fromJson(dynamic json) {
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
    _successMessage = json["successMessage"];
    _statusCode = json["statusCode"];
    _errorList = json["errorList"] != null ? json["errorList"].cast<String>() : [];
    _isSuccess = json["isSuccess"];
    _totalRecords = json["totalRecords"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    map["successMessage"] = _successMessage;
    map["statusCode"] = _statusCode;
    map["errorList"] = _errorList;
    map["isSuccess"] = _isSuccess;
    map["totalRecords"] = _totalRecords;
    return map;
  }

}

class Data {
  int _customerCount;
  String _confirmedTotalAmount;
  String _pendingTotalAmount;
  String _acceptedTotalAmount;

  int get customerCount => _customerCount;
  String get confirmedTotalAmount => _confirmedTotalAmount;
  String get pendingTotalAmount => _pendingTotalAmount;
  String get acceptedTotalAmount => _acceptedTotalAmount;

  Data({
      int customerCount, 
      String confirmedTotalAmount, 
      String pendingTotalAmount, 
      String acceptedTotalAmount}){
    _customerCount = customerCount;
    _confirmedTotalAmount = confirmedTotalAmount;
    _pendingTotalAmount = pendingTotalAmount;
    _acceptedTotalAmount = acceptedTotalAmount;
}

  Data.fromJson(dynamic json) {
    _customerCount = json["customerCount"];
    _confirmedTotalAmount = json["confirmedTotalAmount"];
    _pendingTotalAmount = json["pendingTotalAmount"];
    _acceptedTotalAmount = json["acceptedTotalAmount"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["customerCount"] = _customerCount;
    map["confirmedTotalAmount"] = _confirmedTotalAmount;
    map["pendingTotalAmount"] = _pendingTotalAmount;
    map["acceptedTotalAmount"] = _acceptedTotalAmount;
    return map;
  }

}