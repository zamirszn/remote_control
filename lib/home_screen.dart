import 'package:flutter/material.dart';
import 'package:remote_control/data_source/local_data_source/app_prefs.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/my_remote/my_remote_screen.dart';
import 'package:remote_control/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  changePageIndex(index) {
    currentPageIndex = index;
    setState(() {});
  }

  @override
  void initState() {
    getVibration();
    super.initState();
  }

  getVibration() async {
    vibrationValue=  await appPreferences.getVibration();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeScreens[currentPageIndex],
      bottomNavigationBar: NavigationBar(
          selectedIndex: currentPageIndex,
          onDestinationSelected: (int index) => changePageIndex(index),
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.settings_remote), label: "My Remote"),
            // NavigationDestination(icon: Icon(Icons.cast), label: "Cast"),
            NavigationDestination(
                icon: Icon(Icons.settings), label: "Settings"),
          ]),
    );
  }
}

List<Widget> homeScreens = [
  const MyRemoteScreen(),
  // Container(
  //   child: const Center(child: Text("Cast Screen")),
  // ),
  const SettingScreen(),
];
