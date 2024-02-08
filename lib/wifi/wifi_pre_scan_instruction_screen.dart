import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/wifi/wifi_scan_screen.dart';

class WifiPreScanInstructionScreen extends StatefulWidget {
  const WifiPreScanInstructionScreen({super.key});

  @override
  State<WifiPreScanInstructionScreen> createState() =>
      _WifiPreScanInstructionScreenState();
}

class _WifiPreScanInstructionScreenState
    extends State<WifiPreScanInstructionScreen> {
  bool startScanning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const RemoteLottie(),
            if (startScanning == true)
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Searching Device..."),
                  SizedBox(
                    height: 20,
                  ),
                  CupertinoActivityIndicator(
                    radius: 15,
                  )
                ],
              ),
            const SizedBox(
              height: 20,
            ),
            const WifiInstructionWidget(),
            const SizedBox(
              height: 20,
            ),
            if (startScanning == false)
              ElevatedButton(
                  onPressed: () {
                    startScanning = true;
                    setState(() {});
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
