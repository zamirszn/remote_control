import 'package:flutter/material.dart';
import 'package:remote_control/wifi_remote/roku/roku_search_screen.dart';
import 'package:remote_control/wifi_remote/roku/roku_wifi_remote.dart';
import 'package:remote_control/wifi_remote/samsung/samsung_search_screen.dart';
import 'package:remote_control/wifi_remote/samsung/samsung_wifi_remote.dart';
import 'package:remote_control/wifi_remote/all_wifi_remote/universal_remote_search_screen.dart';

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
            remoteScreen: SamsungSearchScreen(),
          ),
          WifiRemoteListTile(
            remoteName: "Roku",
            remoteScreen: RokuSearchScreen(),
          ),
          WifiRemoteListTile(
            remoteName: "Universal",
            remoteScreen: UniversalRemoteSearchScreen(),
          ),
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
