import 'package:ir_sensor_plugin/ir_sensor_plugin.dart';
import 'package:remote_control/global.dart';
import 'package:vibration/vibration.dart';

void sendInfraredSignal(String code, context) async {
  vibrateOnPress();

  try {
    await IrSensorPlugin.transmitString(pattern: code);
  } catch (e) {
    showErrorDialog(e.toString(), context);
  }
}


