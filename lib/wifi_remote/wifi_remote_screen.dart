import 'package:flutter/material.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/model/remote_model.dart';
import 'package:remote_control/remote_button.dart';

class WifiRemoteScreen extends StatelessWidget {
  const WifiRemoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
              tabAlignment: TabAlignment.center,
              isScrollable: true,
              tabs: [
                Tab(icon: Icon(Icons.settings_remote), text: "Remote"),
                Tab(icon: Icon(Icons.touch_app), text: "Trackpad"),
                Tab(icon: Icon(Icons.apps_rounded), text: "Apps"),
              ]),
        ),
        body: TabBarView(children: [
          WifiRemoteWidget(
            remote:
                WifiRemote(brand: "", customName: "", someWifiProperty: ""),
          ),
          const Center(
            child: Text("1"),
          ),
          const Center(
            child: Text("1"),
          ),
        ]),
      ),
    );
  }
}

class WifiRemoteWidget extends StatelessWidget {
  const WifiRemoteWidget({super.key, required this.remote});
  final WifiRemote remote;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          // color: Colors.grey.shade300,
          border: Border.all(width: 2, color: appPurple),
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // power
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WifiControllerButton(
                code: null,
                child: Icon(
                  Icons.power_settings_new_rounded,
                  size: 20,
                ),
              ),
              WifiControllerButton(
                code: null,
                child: Text("123"),
              ),
            ],
          ),
          //mute
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WifiControllerButton(code: null, child: Text("HELP")),
              WifiControllerButton(code: null, child: Text("OPTION")),
            ],
          ),
          // volume

          Container(
            width: 200,
            height: 200,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2, color: Colors.deepPurple.shade300),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WifiControllerButton(
                  hasBorder: false,
                  code: null,
                  child: Icon(
                    Icons.keyboard_arrow_up_rounded,
                    size: 20,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    WifiControllerButton(
                      hasBorder: false,
                      code: null,
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        size: 20,
                      ),
                    ),
                    WifiControllerButton(
                        code: null,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "OK",
                          ),
                        )),
                    WifiControllerButton(
                      hasBorder: false,
                      code: null,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                WifiControllerButton(
                  hasBorder: false,
                  code: null,
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WifiControllerButton(
                    code: null,
                    child: Icon(
                      Icons.circle,
                      size: 20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: WifiControllerButton(
                      code: null,
                      child: Icon(
                        Icons.fast_forward,
                        size: 20,
                      ),
                    ),
                  ),
                  WifiControllerButton(
                    code: null,
                    child: Icon(
                      Icons.fast_rewind,
                      size: 20,
                    ),
                  ),
                ],
              ),
              WifiControllerButton(
                code: null,
                borderRadius: 15,
                child: Column(
                  children: [
                    WifiControllerButton(
                      hasBorder: false,
                      code: null,
                      child: Icon(
                        Icons.add,
                        size: 20,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "VOL",
                      ),
                    ),
                    WifiControllerButton(
                      hasBorder: false,
                      code: null,
                      child: Icon(
                        Icons.remove,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              WifiControllerButton(
                code: null,
                borderRadius: 15,
                child: Column(
                  children: [
                    WifiControllerButton(
                      hasBorder: false,
                      code: null,
                      child: Icon(
                        Icons.keyboard_arrow_up,
                        size: 20,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "CH",
                      ),
                    ),
                    WifiControllerButton(
                      hasBorder: false,
                      code: null,
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WifiControllerButton(
                    code: null,
                    child: Icon(
                      Icons.stop,
                      size: 20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: WifiControllerButton(
                      code: null,
                      child: Icon(
                        Icons.play_arrow,
                        size: 20,
                      ),
                    ),
                  ),
                  WifiControllerButton(
                    code: null,
                    child: Icon(
                      Icons.pause,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
