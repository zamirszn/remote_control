import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/model/connectable_devices.dart';
import 'package:remote_control/wifi_remote/connectsdk_method_channel.dart';
import 'package:remote_control/wifi_remote/wifi_remote_screen.dart';

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
  ConnectSdkMethodChannel connectSdkMethodChannel = ConnectSdkMethodChannel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (listofDevices.isEmpty) const RemoteLottie(),
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
                        if (connectableDevice.id != null) {
                          connectToDevice(connectableDevice.id!);
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
            if (isScanning == false && listofDevices.isEmpty)
              const WifiInstructionWidget(),
            const SizedBox(
              height: 20,
            ),
            if (isScanning == false && listofDevices.isEmpty)
              ElevatedButton(
                  onPressed: () {
                    // isScanning = true;
                    initConnectSdk();
                    setState(() {});
                  },
                  child: const Text("Ready"))
          ],
        ),
      ),
    );
  }

  void connectToDevice(String deviceId) async {
    showLoadingDialog("Connecting please wait", context);
    bool isDevicesConnected =
        await connectSdkMethodChannel.connectToDevice(deviceId);
    Navigator.pop(context);

    if (isDevicesConnected) {}

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const WifiRemoteScreen()));
  }

  void initConnectSdk() async {
    isScanning = false;
    setState(() {});
    await connectSdkMethodChannel.initialize();

    await connectSdkMethodChannel.getAvailableDevices().then((value) {
      listofDevices = value;
      setState(() {});
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
