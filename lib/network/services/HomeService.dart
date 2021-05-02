import 'dart:async';

import 'package:ibnsina_pharma_supplier/network/api/HttpUrls.dart';
import 'package:ibnsina_pharma_supplier/network/api/base_response.dart';
import 'package:ibnsina_pharma_supplier/network/api/home/HomeApis.dart';
import 'package:ibnsina_pharma_supplier/network/api/user/RestClient.dart';
import 'package:ibnsina_pharma_supplier/network/models/handle_errors.dart';
import 'package:ibnsina_pharma_supplier/network/models/home/home_statistics_model.dart';
import 'package:ibnsina_pharma_supplier/network/models/profile/sales_rep_login_request.dart';
import 'package:dio/dio.dart';
import 'package:ibnsina_pharma_supplier/network/models/profile/sales_rep_login_response.dart';
import 'package:ibnsina_pharma_supplier/network/models/home/home.dart';
import 'package:ibnsina_pharma_supplier/utils/Helpers.dart';
import 'package:ibnsina_pharma_supplier/utils/constants_values.dart';
import 'package:ibnsina_pharma_supplier/utils/shared_pref_helper.dart';

class HomeService {
  HomeStatisticsModel homeResponse;
  HomeStatisticsModel statistics;
  HandleErrors errors;
  String errorMessage = "";
  StreamController _homeController;

  StreamSink<ApiResponse<Home>> get homeSink => _homeController.sink;

  Stream<ApiResponse<Home>> get homeStream => _homeController.stream;

  HomeService() {
    _homeController = StreamController<ApiResponse<Home>>();
  }

  Future getHomeStatistics() async {
    homeSink.add(ApiResponse.loading('Fetching Popular Movies'));
    var h = headers;
    var token = await getUserToken();
    h.addAll({"Authorization": "Bearer $token"});
    final dio = Dio(BaseOptions(headers: h)); // Provide a dio instance
    final client = HomeApis(dio);
    await client.getRepStatistics().then((it) {
      if (it != null) {
        if (it != null) {
          var response = it;
          logger.i(response.toString());
          homeSink.add(ApiResponse.completed(it));
          return (it);
        }
      }
    }).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          logger.e("Got error : ${res.data} -> ${res.statusMessage}");
          errors = HandleErrors.fromJson(res.data);
          errorMessage = errors.errorList
              .toString()
              .replaceAll('[', '')
              .replaceAll(']', '');

          showMessage(errorMessage);
          homeSink.add(ApiResponse.error("e.toString()", 0,
              errorList: errors.errorList));
          print(errors);
          break;
        default:
      }
    });
    return null;
  }

  Future<String> getUserToken() async {
    var token = await getStringKey(USER_TOKEN) ?? "-";
    return token.toString();
  }

  dispose() {
    _homeController?.close();
  }
}
