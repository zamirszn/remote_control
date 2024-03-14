import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/model/connectable_devices.dart';
import 'package:remote_control/wifi_remote/all_wifi_remote_screen.dart';
import 'package:remote_control/wifi_remote/connectsdk_method_channel.dart';
import 'package:remote_control/wifi_remote/all_wifi_remote/universal_remote_screen.dart';

class WifiPreScanInstructionScreen extends StatelessWidget {
  const WifiPreScanInstructionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const RemoteLottie(),
            const SizedBox(
              height: 20,
            ),
            const WifiInstructionWidget(),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  // isScanning = true;
                  //      setState(() {});

                  // showLoadingDialog("Searching for devices", context);

                  // Future.delayed(const Duration(seconds: 2))
                  //     .then((value) => {initConnectSdk()});

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AllWifiRemoteScreen()));
                },
                child: const Text("Ready"))
          ],
        ),
      ),
    );
  }
}

class WifiInstructionWidget extends StatelessWidget {
  const WifiInstructionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Please make sure\n"),
              Text("1. Your TV is turned on\n"),
              Text(
                  "2. Your TV is connected to the same WiFi network as your device\n"),
              Text(
                  "3. Turn of the VPN on the your device if you're connected to a VPN\n"),
            ],
          ),
        ),
      ),
    );
  }
}
