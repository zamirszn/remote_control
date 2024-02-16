import 'package:remote_control/global.dart';
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
    return sharedPref.getBool(ir) ?? false;
  }

  Future<void> setIrTrue() async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setBool(ir, true);
  }

  Future<bool> getVibration() async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getBool("vibration") ?? true;
  }

  Future<void> setVibration(bool value) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setBool("vibration", value);
  }
}

final appPreferences = AppPreferences();
