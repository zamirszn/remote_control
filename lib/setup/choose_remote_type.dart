import 'package:flutter/material.dart';
import 'package:remote_control/data_source/local_data_source/app_prefs.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/infrared_remote/check_infrared_blaster_screen.dart';
import 'package:remote_control/infrared_remote/infrared_tv_brands_screen.dart';
import 'package:remote_control/wifi_remote/wifi_scan_instruction_screen.dart';

class ChooseRemoteTypeScreen extends StatelessWidget {
  const ChooseRemoteTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Choose the type of your TV remote",
              textAlign: TextAlign.center,
              style: getBoldStyle(),
            ),
            RemoteTypeWidget(
              onPressed: () async {
                NavigatorState nav = Navigator.of(context);
                bool hasIR = await appPreferences.hasIR();
                if (hasIR) {
                  nav.push(MaterialPageRoute(
                    builder: (context) => const InfraredTvBrandsScreen(),
                  ));
                } else {
                  nav.push(MaterialPageRoute(
                    builder: (context) => const CheckInfraredBlasterScreen(),
                  ));
                }
              },
              remoteImage: "assets/ir.png",
              remoteName: "IR Televison Remote",
              remoteTypeInformation:
                  "Your device will need to have a built in Infrared blaster",
            ),
            RemoteTypeWidget(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const WifiPreScanInstructionScreen(),
                    ));
              },
              remoteImage: "assets/wifi.png",
              remoteName: "Smart TV Remote",
              remoteTypeInformation:
                  "Your device and TV need to be on the same WiFI network",
            ),
          ],
        ),
      ),
    );
  }
}

class RemoteTypeWidget extends StatelessWidget {
  const RemoteTypeWidget(
      {super.key,
      required this.remoteImage,
      required this.remoteName,
      required this.onPressed,
      required this.remoteTypeInformation});
  final String remoteImage;
  final String remoteName;
  final VoidCallback onPressed;
  final String remoteTypeInformation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Stack(
        children: [
          Container(
            height: 150,
            width: 300,
            decoration: BoxDecoration(
                // color: Colors.grey.shade300,
                border: Border.all(width: 2, color: appPurple),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(
                      remoteImage,
                    ),
                  ),
                ),
                Text(
                  remoteName,
                  textAlign: TextAlign.center,
                  style: getRegularStyle(),
                )
              ],
            ),
          ),
          Positioned(
              right: 10,
              child: IconButton(
                icon: const Icon(Icons.info),
                onPressed: () {
                  showInfoDialog(
                      context: context, message: remoteTypeInformation);
                },
              ))
        ],
      ),
    );
  }
}
