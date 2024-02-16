import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:remote_control/data_source/local_data_source/app_prefs.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/home_screen.dart';
import 'package:remote_control/model/saved_remote_model.dart';
import 'package:remote_control/my_remote/my_remote_screen.dart';
import 'package:remote_control/setup/setup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.registerAdapter<SavedRemoteModel>(SavedRemoteModelAdapter());

  await Hive.initFlutter();
  await Hive.openBox<SavedRemoteModel>("savedRemotes"); 
  runApp(const RemoteControlApp());
}

class RemoteControlApp extends StatelessWidget {
  const RemoteControlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: appName,
        darkTheme: ThemeData.dark(),
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            fontFamily: FontFamily.fontFamily),
        debugShowCheckedModeBanner: false,
        home: FutureBuilder<bool>(
          future: appPreferences.isSetupDone(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data == true) {
              return const HomeScreen();
            }

            return const SetupScreen();
          },
        ));
  }
}
