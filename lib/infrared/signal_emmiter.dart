import 'package:ir_sensor_plugin/ir_sensor_plugin.dart';
import 'package:remote_control/global.dart';
import 'package:vibration/vibration.dart';

void sendInfraredSignal(String code, context) async {
  bool? deviceHasVibrator = await Vibration.hasVibrator();
  if (deviceHasVibrator == true) {
    Vibration.vibrate(duration: 20);
  }
  try {
    await IrSensorPlugin.transmitString(pattern: code);
  } catch (e) {
    showErrorDialog(e.toString(), context);
  }
}
