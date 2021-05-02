import 'package:logger/logger.dart';

const String productionBaseUrl = 'https://fieldforceadmin.ibnsina-pharma.com/';
const String alphaBaseUrl =
    'https://fieldforceadmin-preprod.ibnsina-pharma.com/';
const String qaBaseUrl = 'https://fieldforceadmin-qa.ibnsina-pharma.com/';
const String developBaseUrl = 'https://fieldforceadmin-dev.ibnsina-pharma.com/';
const String b2bProductionBaseUrl = 'https://newmobileapi.ibnsina-pharma.com/';
const String b2bTestBaseUrl = 'http://40.113.138.110:8000/';

Map<String, String> headers = {
  "Accept-Language": "EN",
  "UI-Language": "application/json",
  "accept": "application/json",
  "Content-Type": "application/json-patch+json"};


final logger = Logger();
