// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/model/samsung_tv_model.dart';
import 'package:remote_control/wifi_remote/samsung/samsung_wifi_remote.dart';

class SamsungSearchScreen extends StatefulWidget {
  const SamsungSearchScreen({super.key});

  @override
  State<SamsungSearchScreen> createState() => _SamsungSearchScreenState();
}

class _SamsungSearchScreenState extends State<SamsungSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Found Devices "),
      ),
      body: foundTVs.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("No TV found on your network"),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        listDevices();
                      },
                      child: const Text("Retry"))
                ],
              ),
            )
          : ListView.builder(
              itemCount: foundTVs.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () async {
                  try {
                    showLoadingDialog("Connecting to TV", context);

                    await foundTVs[index]?.connect();
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SamsungWifiRemote(tv: foundTVs[index]!),
                        ));
                  } catch (e) {
                    Navigator.pop(context);
                    showErrorDialog(e.toString(), context);
                  }
                },
                title: Text(
                  foundTVs[index]?.services[0]["server"] ?? "",
                ),
              ),
            ),
    );
  }

  SamsungTVModel? tv;
  String? token;

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  List<SamsungTVModel?> foundTVs = [];

  void listDevices() async {
    try {
      await SamsungTVModel().discover((List<SamsungTVModel?> tvs) async {
        if (tvs.isNotEmpty) {
          foundTVs = tvs;
          setState(() {});
        }
      });
    } catch (e) {
      // close dialog
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      listDevices();
    });
  }
}
