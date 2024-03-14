import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/wifi_remote/roku/roku_remote_model.dart';
import 'package:remote_control/wifi_remote/roku/roku_wifi_remote.dart';
import 'package:xml/xml.dart';
import 'package:http/http.dart' as http;

class RokuSearchScreen extends StatefulWidget {
  const RokuSearchScreen({super.key});

  @override
  State<RokuSearchScreen> createState() => _RokuSearchScreenState();
}

class _RokuSearchScreenState extends State<RokuSearchScreen> {
  List<RokuDeviceModel> rokuDevices = [];
  bool gettingDevices = false;
  String ipAddress = '';
  String? selectedDeviceIp;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      connectRoku();
    });
  }

  void connectRoku() async {
    try {
      await getListOfDevices();
    } catch (e) {
      if (mounted) {
        Navigator.pop(context);
        Navigator.pop(context);
        showErrorDialog(e.toString(), context);
      }
    }
  }

  Future<void> getListOfDevices() async {
    if (gettingDevices) {
      return;
    }

    gettingDevices = true;
    final info = NetworkInfo();
    var wifiIP = await info.getWifiIP(); // 192.168.1.43

    final String ip = wifiIP as String;
    print(ip);
    final String subnet = ip.substring(0, ip.lastIndexOf('.'));
    List<Future> futures = [];
    for (int i = 0; i < 999; i++) {
      Future<bool> future = isIpRoku("$subnet.$i");
      futures.add(future);
    }
    List<dynamic>? devices = await Future.wait(futures).then((value) {
      setState(() {});
      return null;
    });
    gettingDevices = false;
  }

  void connectToDevice(String selectedDeviceIp) {
    try {
      ipAddress = selectedDeviceIp;
      getApps();

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => RokuWifiRemote(ipAddress: selectedDeviceIp),
          ));
    } catch (e) {
      Navigator.pop(context);
      Navigator.pop(context);
      showErrorDialog("Couldnt connect to Roku device", context);
    }
  }

  Future<void> getApps() async {
    if (ipAddress == '') {
      return;
    }

    var url = Uri.parse('http://$ipAddress:8060/query/apps');
    var response = await http.post(url);
  }

  Future<bool> isIpRoku(String ip) async {
    var url = Uri.parse("http://$ip:8060");
    print(url);
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        if (response.body.contains('roku')) {
          print("$ip is roku");
          String deviceName = '';

          const String startingName = '<friendlyName>';
          try {
            deviceName = response.body
                .substring(
                    response.body.indexOf(startingName) + startingName.length,
                    response.body.indexOf('</friendlyName>'))
                .trim();
            deviceName = deviceName.replaceAll('&quot;', '"');
          } catch (e) {
            deviceName = "Roku";
          }

          rokuDevices.add(RokuDeviceModel(ip, deviceName));
          setState(() {});

          return true;
        }
      }
    } catch (e) {
      //print(e.toString());
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Found Devices "),
      ),
      body: rokuDevices.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "No Roku found on your network\n Please turn off your mobile network",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        getListOfDevices();
                      },
                      child: const Text("Retry")),
                ],
              ),
            )
          : ListView.builder(
              itemCount: rokuDevices.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () async {
                  connectToDevice(rokuDevices[index].ip);
                },
                title: Text(
                  rokuDevices[index].name ?? "Roku",
                ),
                subtitle: Text(
                  rokuDevices[index].ip,
                ),
              ),
            ),
    );
  }
}
