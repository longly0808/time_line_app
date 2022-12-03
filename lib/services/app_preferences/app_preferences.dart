import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static const String auth = 'AUTH';

  static SharedPreferences? _sharePreferences;

  Future<bool> getAuth() async => await getBoolValue(auth);

  Future<void> setAuth(bool value) => setValueTypeBool(auth, value);

  Future<SharedPreferences> getInstance() async {
    return _sharePreferences ??= await SharedPreferences.getInstance();
  }

  static Future<void> setValueTypeString(String key, String value) async {
    await _sharePreferences?.setString(key, value);
  }

  static Future<void> setValueTypeDouble(String key, double value) async {
    await _sharePreferences?.setDouble(key, value);
  }

  static Future<void> setValueTypeBool(String key, bool value) async {
    await _sharePreferences?.setBool(key, value);
  }

  static Future<void> setValueTypeInt(String key, int value) async {
    await _sharePreferences?.setInt(key, value);
  }

  static Future<void> setValueTypeList(String key, List<String> value) async {
    await _sharePreferences?.setStringList(key, value);
  }

  static Future<String> getStringValue(String key) async {
    return _sharePreferences?.getString(key) ?? '';
  }

  static Future<double> getDoubleValue(String key) async {
    return _sharePreferences?.getDouble(key) ?? 0.0;
  }

  static Future<bool> getBoolValue(String key) async {
    return _sharePreferences?.getBool(key) ?? false;
  }

  static Future<int> getIntValue(String key) async {
    return _sharePreferences?.getInt(key) ?? 0;
  }

  static Future<List<String>> getListStringValue(String key) async {
    return _sharePreferences?.getStringList(key) ?? [];
  }

  static Future<dynamic> getValue(String key) async {
    return _sharePreferences?.get(key);
  }
}
