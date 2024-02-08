// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ir_sensor_plugin/ir_sensor_plugin.dart';
import 'package:remote_control/data_source/local_data_source/app_prefs.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/infrared/infrared_check_success_or_fail_screen.dart';

class CheckInfraredBlasterScreen extends StatelessWidget {
  const CheckInfraredBlasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        const RemoteLottie(),
        const Text(
          "Controlling TV via IR requires a built-in infrared blaster, please check it beofre use",
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
            onPressed: () {
              checkDeviceIR(context);
            },
            child: const Text("Check built-in IR"))
      ]),
    );
  }

  void checkDeviceIR(BuildContext context) async {
    showLoadingDialog("Checking IR on device", context);

    bool hasIR = await IrSensorPlugin.hasIrEmitter;
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pop();

    if (hasIR) {
      AppPreferences appPref = appPreferences;
      await appPref.setIrTrue();

      showModalBottomSheet(
        context: context,
        builder: (context) => const InfraredCheckSucessDialog(),
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) => const InfraredCheckFailDialog(),
      );
    }
  }
}
