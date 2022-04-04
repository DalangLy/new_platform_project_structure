import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage{
  final Future<SharedPreferences> _prefs;

  TokenStorage({required Future<SharedPreferences> sharedPreferences}) : _prefs = sharedPreferences;

  Future<String> read({required String key}) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key) ?? '';
  }

  Future<void> write({required String key, required String value}) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(key, value);
  }

  Future<void> delete({required String key}) async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove(key);
  }
}