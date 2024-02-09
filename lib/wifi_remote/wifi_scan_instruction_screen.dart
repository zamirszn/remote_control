import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/model/connectable_devices.dart';
import 'package:remote_control/wifi_remote/connectsdk_method_channel.dart';

class WifiPreScanInstructionScreen extends StatefulWidget {
  const WifiPreScanInstructionScreen({super.key});

  @override
  State<WifiPreScanInstructionScreen> createState() =>
      _WifiPreScanInstructionScreenState();
}

class _WifiPreScanInstructionScreenState
    extends State<WifiPreScanInstructionScreen> {
  bool isScanning = false;

  List<ConnectableDeviceModel> listofDevices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const RemoteLottie(),
            if (isScanning == true)
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
            if (listofDevices.isNotEmpty)
              ListView.builder(
                itemBuilder: (context, index) {
                  ConnectableDeviceModel connectableDevice =
                      listofDevices[index];
                  return ListTile(
                    title: Text(connectableDevice.friendlyName ?? ""),
                    subtitle: Text(connectableDevice.ipAddress ?? ""),
                  );
                },
              ),
            const SizedBox(
              height: 20,
            ),
            const WifiInstructionWidget(),
            const SizedBox(
              height: 20,
            ),
            if (isScanning == false)
              ElevatedButton(
                  onPressed: () {
                    isScanning = true;
                    initConnectSdk();
                    setState(() {});
                  },
                  child: const Text("Ready"))
          ],
        ),
      ),
    );
  }

  void initConnectSdk() async {
    ConnectSdkMethodChannel connectSdkMethodChannel = ConnectSdkMethodChannel();
    await connectSdkMethodChannel.initialize();

    listofDevices = await connectSdkMethodChannel.getAvailableDevices();
    isScanning = false;
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
