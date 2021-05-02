import 'package:ibnsina_pharma_supplier/network/models/profile/sales_rep_login_request.dart';
import 'package:ibnsina_pharma_supplier/network/models/profile/sales_rep_login_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'RestClient.g.dart';

@RestApi(baseUrl: 'https://fieldforceadmin-dev.ibnsina-pharma.com')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("/api/MobileAuth/Login")
  Future<SalesRepLoginResponse> login(@Body() SalesRepLoginRequest signIn);
}
