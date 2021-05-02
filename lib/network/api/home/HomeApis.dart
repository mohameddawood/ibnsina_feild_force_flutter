import 'package:ibnsina_pharma_supplier/network/models/home/home.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'HomeApis.g.dart';

@RestApi(baseUrl: 'https://fieldforceadmin-dev.ibnsina-pharma.com')
abstract class HomeApis {
  factory HomeApis(Dio dio, {String baseUrl}) = _HomeApis;

  @GET("/api/statistics/Customerstatistics")
  Future<Home>getRepStatistics();
}
