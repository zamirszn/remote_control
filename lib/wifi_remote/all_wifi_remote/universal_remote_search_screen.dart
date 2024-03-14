// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/model/connectable_devices.dart';
import 'package:remote_control/wifi_remote/all_wifi_remote_screen.dart';
import 'package:remote_control/wifi_remote/connectsdk_method_channel.dart';
import 'package:remote_control/wifi_remote/all_wifi_remote/universal_remote_screen.dart';

class UniversalRemoteSearchScreen extends StatefulWidget {
  const UniversalRemoteSearchScreen({super.key});

  @override
  State<UniversalRemoteSearchScreen> createState() =>
      _UniversalRemoteSearchScreenState();
}

class _UniversalRemoteSearchScreenState
    extends State<UniversalRemoteSearchScreen> {
  bool isScanning = false;

  List<ConnectableDeviceModel> listofDevices = [];

  @override
  void initState() {
    init();

    super.initState();
  }

  void init() {
    isScanning = true;
    setState(() {});

    Future.delayed(const Duration(seconds: 2))
        .then((value) => {initConnectSdk()});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isScanning == true
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Searching for Devices..."),
                  Text("Turn off mobile data if you cant find your device"),
                  SizedBox(
                    height: 20,
                  ),
                  CupertinoActivityIndicator(
                    radius: 15,
                  )
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (listofDevices.isNotEmpty)
                    const Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text("Found Devices"),
                      ],
                    ),
                  if (listofDevices.isNotEmpty)
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.15,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: listofDevices.length,
                        itemBuilder: (context, index) {
                          ConnectableDeviceModel connectableDevice =
                              listofDevices[index];
                          return ListTile(
                            leading: const Icon(Icons.tv),
                            onTap: () {
                              if (connectableDevice.ipAddress != null) {
                                connectToDevice(connectableDevice.ipAddress!);
                              }
                            },
                            title: Text(
                                "${connectableDevice.modelName ?? ""} - ${connectableDevice.friendlyName ?? ""} "),
                            subtitle: Text(connectableDevice.ipAddress ?? ""),
                          );
                        },
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
    );
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void connectToDevice(String deviceId) async {
    showLoadingDialog("Connecting please wait", context);
    bool isDevicesConnected =
        await connectSdkMethodChannel.connectToDevice(deviceId);

      
        await connectSdkMethodChannel.onPairingRequired(context);

    Navigator.pop(context);

    if (isDevicesConnected) {
      timer?.cancel();

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const UniversalRemoteScreen()));
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    // NOTE: close connectsdk connection
    super.dispose();
  }

  Timer? timer;

  void initConnectSdk() async {
    await connectSdkMethodChannel.initialize().then((value) => {
          timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
            await connectSdkMethodChannel.getAvailableDevices().then((value) {
              listofDevices = value;
              if (listofDevices.isNotEmpty) {
                isScanning = false;
              }

              setState(() {});
            });
          })
        });
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
