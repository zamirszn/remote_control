import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text(
              "Feedback",
            ),
            leading: Icon(Icons.feedback),
            subtitle: Text("Report bugs and tell us what to improve"),
          ),
          ListTile(
            title: Text(
              "Rate us",
            ),
            leading: Icon(Icons.star),
            subtitle: Text("Like this app? Please rate us!"),
          ),
          ListTile(
            title: Text(
              "Share",
            ),
            leading: Icon(Icons.share),
            subtitle: Text("Share TV Rem"),
          ),
          ListTile(
            title: Text(
              "Language",
            ),
            leading: Icon(Icons.language),
            subtitle: Text("English"),
          ),
          ListTile(
            title: Text(
              "Privacy Policy",
            ),
            leading: Icon(Icons.privacy_tip_rounded),
          ),
        ],
      ),
    );
  }
}
