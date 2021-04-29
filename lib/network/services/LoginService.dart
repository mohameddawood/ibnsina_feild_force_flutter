import 'package:ibnsina_pharma_supplier/network/api/user/HttpUrls.dart';
import 'package:ibnsina_pharma_supplier/network/api/user/RestClient.dart';
import 'package:ibnsina_pharma_supplier/network/models/handle_errors.dart';
import 'package:ibnsina_pharma_supplier/network/models/profile/sales_rep_login_request.dart';
import 'package:dio/dio.dart';
import 'package:ibnsina_pharma_supplier/network/models/profile/sales_rep_login_response.dart';
import 'package:ibnsina_pharma_supplier/utils/Helpers.dart';

class LoginService {
  SalesRepLoginRequest loginRequest;
  SalesRepLoginResponse loginResponse;
  HandleErrors errors;
  String errorMessage = "";

  LoginService(this.loginRequest);

   login() async{
    final dio = Dio(BaseOptions(headers: headers)); // Provide a dio instance
    final client = RestClient(dio);
    logger.i("Login request is ${this.loginRequest.username}");
    logger.i("Login request is ${this.loginRequest.password}");
    await client.login(loginRequest).then((it) {
      if (it != null) {
        if (it.user != null) {
          SalesRepLoginResponse response = it;
          logger.i(response.user.toJson().toString());
          loginResponse =  response;
        }
      }
    }).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          logger.e("Got error : ${res.data} -> ${res.statusMessage}");
          errors = HandleErrors.fromJson(res.data);
          errorMessage = errors.errorList.toString()
              .replaceAll('[', '').replaceAll(']', '');

          showMessage(errorMessage);
          break;
        default:
      }
    });
  }
}
