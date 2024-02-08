import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  Future<bool> isSetupDone() async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getBool("setup") ?? false;
  }

  Future<void> setupCompleted() async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setBool("setup", true);
  }

  Future<bool> hasIR() async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getBool("ir") ?? false;
  }

  Future<void> setIrTrue() async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setBool("ir", true);
  }
}

final appPreferences = AppPreferences();
