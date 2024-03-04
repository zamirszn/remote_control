import 'package:flutter/material.dart';
import 'package:remote_control/wifi_remote/roku/roku_wifi_remote.dart';
import 'package:remote_control/wifi_remote/samsung/samsung_wifi_remote.dart';

class AllWifiRemoteScreen extends StatelessWidget {
  const AllWifiRemoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wifi Remotes"),
      ),
      body: const Column(
        children: [
          WifiRemoteListTile(
            remoteName: "Samsung",
            remoteScreen: SamsungWifiRemote(),
          ),
          WifiRemoteListTile(
            remoteName: "Roku",
            remoteScreen: RokuWifiRemote(),
          )
        ],
      ),
    );
  }
}

class WifiRemoteListTile extends StatelessWidget {
  const WifiRemoteListTile(
      {super.key, required this.remoteScreen, required this.remoteName});
  final Widget remoteScreen;
  final String remoteName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.settings_remote_rounded),
      title: Text(remoteName),
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => remoteScreen)),
    );
  }
}
