import 'package:ibnsina_pharma_supplier/network/models/profile/sales_rep_login_response.dart';
import 'package:ibnsina_pharma_supplier/network/models/home/home_statistics_model.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'HttpUrls.dart';

part 'HomeApis.g.dart';

@RestApi(baseUrl: 'https://fieldforceadmin-dev.ibnsina-pharma.com')
abstract class HomeApis {
  factory HomeApis(Dio dio, {String baseUrl}) = _HomeApis;

  @GET("api/statistics/Customerstatistics")
  Future<HomeStatisticsModel> getHomeStatistics();
}
