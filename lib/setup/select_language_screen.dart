import 'package:flutter/material.dart';
import 'package:remote_control/data_source/local_data_source/app_prefs.dart';
import 'package:remote_control/setup/choose_remote_type.dart';

class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Language"),
          actions: [
            IconButton(
                onPressed: () {
                  appPreferences.setupCompleted();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ChooseRemoteTypeScreen(),
                  ));
                },
                icon: const Icon(
                  Icons.check,
                ))
          ],
        ),
        body: ListView.builder(
          itemCount: languagesList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.language),
              title: Text(languagesList[index]),
            );
          },
        ));
  }
}

List<String> languagesList = [
  "English",
  "Portuguese",
  "Espanyol",
  "Turkce",
  "Indonesia",
  "Roman",
  "Francais",
  "Arabic",
  "Deutsch",
  "Italiano",
];
