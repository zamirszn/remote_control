import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:remote_control/data_source/local_data_source/app_prefs.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/setup/choose_remote_type.dart';
import 'package:remote_control/setup/select_language_screen.dart';
import 'package:remote_control/test_screen.dart';

class SetupScreen extends StatelessWidget {
  const SetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const TestScreen(),
                ));
              },
              icon: const Icon(Icons.bug_report))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const RemoteLottie(),
            Text(
              "Welcome",
              style: getBoldStyle(),
              textAlign: TextAlign.center,
            ),
            Text(
              "You're about to turn your phone into a TV remote",
              style: getRegularStyle(),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => const SelectLanguageScreen(),
                // ));
                appPreferences.setupCompleted();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChooseRemoteTypeScreen(),
                ));
              },
              child: const Text("Start Now"),
            )
          ],
        ),
      ),
    );
  }
}
