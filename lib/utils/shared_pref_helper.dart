import 'package:shared_preferences/shared_preferences.dart';

saveIntKey(String key, int value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt(key, value);
}

getIntKey(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int value = (prefs.getInt(key) ?? 0);
  return value;
}

saveStringKey(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

getStringKey(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String value = (prefs.getString(key) ?? "");
  return value;
}

saveBoolKey(String key, bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool(key, value);
}

getBoolKey(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool value = (prefs.getBool(key) ?? false);
  return value;
}
