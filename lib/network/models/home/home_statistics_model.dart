import 'package:ibnsina_pharma_supplier/network/api/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class HomeStatisticsModel {
  String _confirmedTotalAmount;
  int _customerCount;
  String _pendingTotalAmount;
  String _acceptedTotalAmount;

  String get confirmedTotalAmount => _confirmedTotalAmount;
  int get customerCount => _customerCount;
  String get pendingTotalAmount => _pendingTotalAmount;
  String get acceptedTotalAmount => _acceptedTotalAmount;

  HomeStatisticsModel({
      String confirmedTotalAmount, 
      int customerCount, 
      String pendingTotalAmount, 
      String acceptedTotalAmount}){
    _confirmedTotalAmount = confirmedTotalAmount;
    _customerCount = customerCount;
    _pendingTotalAmount = pendingTotalAmount;
    _acceptedTotalAmount = acceptedTotalAmount;
}

  HomeStatisticsModel.fromJson(dynamic json) {
    _confirmedTotalAmount = json["confirmedTotalAmount"];
    _customerCount = json["customerCount"];
    _pendingTotalAmount = json["pendingTotalAmount"];
    _acceptedTotalAmount = json["acceptedTotalAmount"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["confirmedTotalAmount"] = _confirmedTotalAmount;
    map["customerCount"] = _customerCount;
    map["pendingTotalAmount"] = _pendingTotalAmount;
    map["acceptedTotalAmount"] = _acceptedTotalAmount;
    return map;
  }

}