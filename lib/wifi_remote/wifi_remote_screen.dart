import 'package:flutter/material.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/model/remote_model.dart';
import 'package:remote_control/remote_button.dart';

class WifiRemoteScreen extends StatelessWidget {
  const WifiRemoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Wifi Remote")),
        body: WifiRemoteWidget(
          remote: WifiRemote(customName: "", someWifiProperty: ""),
        ));

    //   DefaultTabController(
    //     length: 3,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         bottom: const TabBar(
    //             tabAlignment: TabAlignment.center,
    //             isScrollable: true,

    //             tabs: [
    //               Tab(
    //                 text: "Remote",
    //               ),
    //               Tab(
    //                 text: "Trackpad",
    //               ),
    //               Tab(
    //                 text: "Apps",
    //               ),
    //             ]),
    //       ),
    //       body: TabBarView(children: [
    //         WifiRemoteWidget(
    //           remote: WifiRemote(customName: "", someWifiProperty: ""),
    //         ),
    //         const Center(
    //           child: Text("2"),
    //         ),
    //         const Center(
    //           child: Text("1"),
    //         ),
    //       ]),
    //     ),
    //   );
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const WifiControllerButtonOld(
                code: "power_off",
                child: Icon(
                  Icons.power_settings_new_rounded,
                  size: 20,
                ),
              ),
              GestureDetector(
                onTap: () => showNumberPadBottomSheet(context),
                child: const AbsorbPointer(
                  absorbing: true,
                  child: WifiControllerButtonOld(
                    code: null,
                    child: Text("123"),
                  ),
                ),
              ),
            ],
          ),
          //mute
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WifiControllerButtonOld(code: "home", child: Text("HOME")),
              WifiControllerButtonOld(code: "back", child: Text("RETURN")),
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
                WifiControllerButtonOld(
                  hasBorder: false,
                  code: "go_up",
                  child: Icon(
                    Icons.keyboard_arrow_up_rounded,
                    size: 20,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    WifiControllerButtonOld(
                      hasBorder: false,
                      code: "go_left",
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        size: 20,
                      ),
                    ),
                    WifiControllerButtonOld(
                        code: "ok",
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "OK",
                          ),
                        )),
                    WifiControllerButtonOld(
                      hasBorder: false,
                      code: "go_right",
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                WifiControllerButtonOld(
                  hasBorder: false,
                  code: "go_down",
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WifiControllerButtonOld(
                      code: "mute",
                      child: Icon(
                        Icons.volume_off_outlined,
                        size: 20,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: WifiControllerButtonOld(
                        code: "fastForward",
                        child: Icon(
                          Icons.fast_forward,
                          size: 20,
                        ),
                      ),
                    ),
                    WifiControllerButtonOld(
                      code: "rewind",
                      child: Icon(
                        Icons.fast_rewind,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                WifiControllerButtonOld(
                  code: null,
                  borderRadius: 15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WifiControllerButtonOld(
                        hasBorder: false,
                        code: "volume_up",
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
                      WifiControllerButtonOld(
                        hasBorder: false,
                        code: "volume_down",
                        child: Icon(
                          Icons.remove,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                WifiControllerButtonOld(
                  code: null,
                  borderRadius: 15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WifiControllerButtonOld(
                        hasBorder: false,
                        code: "channel_up",
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
                      WifiControllerButtonOld(
                        hasBorder: false,
                        code: "channel_down",
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
                    WifiControllerButtonOld(
                      code: "back",
                      child: Icon(
                        Icons.arrow_back,
                        size: 20,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: WifiControllerButtonOld(
                        code: "play",
                        child: Icon(
                          Icons.play_arrow,
                          size: 20,
                        ),
                      ),
                    ),
                    WifiControllerButtonOld(
                      code: "pause",
                      child: Icon(
                        Icons.pause,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showNumberPadBottomSheet(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (context) =>
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Center(child: Text("Number", style: getBoldStyle())),
            ),
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close))
          ],
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WifiControllerButtonOld(
                    code: "1",
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "1",
                        style: getBoldStyle(),
                      ),
                    ),
                  ),
                  WifiControllerButtonOld(
                    code: "2",
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "2",
                        style: getBoldStyle(),
                      ),
                    ),
                  ),
                  WifiControllerButtonOld(
                    code: "3",
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "3",
                        style: getBoldStyle(),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WifiControllerButtonOld(
                    code: "4",
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "4",
                        style: getBoldStyle(),
                      ),
                    ),
                  ),
                  WifiControllerButtonOld(
                    code: "5",
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "5",
                        style: getBoldStyle(),
                      ),
                    ),
                  ),
                  WifiControllerButtonOld(
                    code: "6",
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "6",
                        style: getBoldStyle(),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WifiControllerButtonOld(
                    code: "7",
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "7",
                        style: getBoldStyle(),
                      ),
                    ),
                  ),
                  WifiControllerButtonOld(
                    code: "8",
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "8",
                        style: getBoldStyle(),
                      ),
                    ),
                  ),
                  WifiControllerButtonOld(
                    code: "9",
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "9",
                        style: getBoldStyle(),
                      ),
                    ),
                  ),
                ],
              ),
              WifiControllerButtonOld(
                code: "0",
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "0",
                    style: getBoldStyle(),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox()
      ]),
    );
  }
}
