import 'package:flutter/material.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/infrared_remote/infrared_remote_test_screen.dart';
import 'package:remote_control/model/remote_model.dart';

class FoundRemoteScreen extends StatelessWidget {
  const FoundRemoteScreen(
      {super.key, required this.infraredRemotes, required this.brandName});
  final List<InfraredRemote> infraredRemotes;
  final String brandName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.settings_remote,
            size: 80,
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            "We've found ${infraredRemotes.length} remote controls for your $brandName TV",
            style: getBoldStyle(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Please test one after the other to find the remote that matces your tv model",
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InfraredRemoteTestScreen(
                              brandName: brandName,
                              infraredRemotes: infraredRemotes,
                            )));
              },
              child: const Text("Start Testing"))
        ],
      ),
    );
  }
}
