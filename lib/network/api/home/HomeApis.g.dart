// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeApis.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _HomeApis implements HomeApis {
  _HomeApis(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://fieldforceadmin-dev.ibnsina-pharma.com';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<Home> getRepStatistics() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/statistics/Customerstatistics',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Home.fromJson(_result.data);
    return value;
  }

  @override
  Future<Home> getRepStatisticsTwo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/statistics/Customerstatistics',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Home.fromJson(_result.data);
    return value;
  }
}
