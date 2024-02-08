import 'package:flutter/material.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/infrared/ir_tv_brand_screen.dart';

class InfraredCheckSucessDialog extends StatelessWidget {
  const InfraredCheckSucessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        const SuccessLottie(),
        Text(
          "Great! it works on your device",
          style: getBoldStyle(),
          textAlign: TextAlign.center,
        ),
        Text(
          "Continue to selet your TV brand",
          style: getRegularStyle(),
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const IrTvBrandScreen(),
                )),
            child: const Text("Continue"))
      ]),
    );
  }
}

class InfraredCheckFailDialog extends StatelessWidget {
  const InfraredCheckFailDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        const FailLottie(),
        Text(
          "Oops! your device doesn't have an IR Blaster",
          style: getBoldStyle(),
          textAlign: TextAlign.center,
        ),
        const Text(
          "Please try again with a device that has an IR Blaster",
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}
