import 'package:flutter/material.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/model/samsung_tv_model.dart';
import 'package:remote_control/remote_button.dart';
import 'package:remote_control/wifi_remote/samsung/samsung_key_code.dart';

class SamsungWifiRemote extends StatelessWidget {
  const SamsungWifiRemote({super.key, required this.tv});
  final SamsungTVModel tv;

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
        appBar: AppBar(title: const Text("Samsung Remote")),
        body: Container(
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
                  WifiRemoteButton(
                    onPressed: () async {
                      await tv.sendKey(samsungKeyCodes.KEY_POWER);
                    },
                    child: const Icon(
                      Icons.power_settings_new_rounded,
                      size: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => showNumberPadBottomSheet(context),
                    child: const AbsorbPointer(
                      absorbing: true,
                      child: WifiRemoteButton(
                        onPressed: null,
                        child: Text("123"),
                      ),
                    ),
                  ),
                ],
              ),
              //mute
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WifiRemoteButton(
                    onPressed: () async {
                      await tv.sendKey(samsungKeyCodes.KEY_HOME);
                    },
                    child: const Text("HOME"),
                  ),
                  WifiRemoteButton(
                    onPressed: () async {
                      await tv.sendKey(samsungKeyCodes.KEY_RETURN);
                    },
                    child: const Text("RETURN"),
                  ),
                ],
              ),
              // volume

              Container(
                width: 200,
                height: 200,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      Border.all(width: 2, color: Colors.deepPurple.shade300),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WifiRemoteButton(
                      hasBorder: false,
                      onPressed: () async {
                        await tv.sendKey(samsungKeyCodes.KEY_UP);
                      },
                      child: const Icon(
                        Icons.keyboard_arrow_up_rounded,
                        size: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        WifiRemoteButton(
                          hasBorder: false,
                          onPressed: () async {
                            await tv.sendKey(samsungKeyCodes.KEY_LEFT);
                          },
                          child: const Icon(
                            Icons.keyboard_arrow_left,
                            size: 20,
                          ),
                        ),
                        WifiRemoteButton(
                            onPressed: () async {
                              await tv.sendKey(samsungKeyCodes.KEY_ENTER);
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "OK",
                              ),
                            )),
                        WifiRemoteButton(
                          hasBorder: false,
                          onPressed: () async {
                            await tv.sendKey(samsungKeyCodes.KEY_RIGHT);
                          },
                          child: const Icon(
                            Icons.keyboard_arrow_right,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    WifiRemoteButton(
                      hasBorder: false,
                      onPressed: () async {
                        await tv.sendKey(samsungKeyCodes.KEY_DOWN);
                      },
                      child: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WifiRemoteButton(
                          onPressed: () async {
                            await tv.sendKey(samsungKeyCodes.KEY_MUTE);
                          },
                          child: const Icon(
                            Icons.volume_off_outlined,
                            size: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: WifiRemoteButton(
                            onPressed: () async {
                              await tv.sendKey(samsungKeyCodes.KEY_FF);
                            },
                            child: const Icon(
                              Icons.fast_forward,
                              size: 20,
                            ),
                          ),
                        ),
                        WifiRemoteButton(
                          onPressed: () async {
                            await tv.sendKey(samsungKeyCodes.KEY_REWIND);
                          },
                          child: const Icon(
                            Icons.fast_rewind,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    WifiRemoteButton(
                      onPressed: null,
                      borderRadius: 15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WifiRemoteButton(
                            hasBorder: false,
                            onPressed: () async {
                              await tv.sendKey(samsungKeyCodes.KEY_VOLUP);
                            },
                            child: const Icon(
                              Icons.add,
                              size: 20,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "VOL",
                            ),
                          ),
                          WifiRemoteButton(
                            hasBorder: false,
                            onPressed: () async {
                              await tv.sendKey(samsungKeyCodes.KEY_VOLDOWN);
                            },
                            child: const Icon(
                              Icons.remove,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    WifiRemoteButton(
                      onPressed: null,
                      borderRadius: 15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WifiRemoteButton(
                            hasBorder: false,
                            onPressed: () async {
                              await tv.sendKey(samsungKeyCodes.KEY_CHUP);
                            },
                            child: const Icon(
                              Icons.keyboard_arrow_up,
                              size: 20,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "CH",
                            ),
                          ),
                          WifiRemoteButton(
                            hasBorder: false,
                            onPressed: () async {
                              await tv.sendKey(samsungKeyCodes.KEY_CHDOWN);
                            },
                            child: const Icon(
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
                        WifiRemoteButton(
                          onPressed: () async {
                            await tv.sendKey(samsungKeyCodes.KEY_INFO);
                          },
                          child: const Icon(
                            Icons.info_outline,
                            size: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: WifiRemoteButton(
                            onPressed: () async {
                              await tv.sendKey(samsungKeyCodes.KEY_PLAY);
                            },
                            child: const Icon(
                              Icons.play_arrow,
                              size: 20,
                            ),
                          ),
                        ),
                        WifiRemoteButton(
                          onPressed: () async {
                            await tv.sendKey(samsungKeyCodes.KEY_PAUSE);
                          },
                          child: const Icon(
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
        ));
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
                  WifiRemoteButton(
                    onPressed: () async {
                      await tv.sendKey(samsungKeyCodes.KEY_1);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "1",
                        style: getBoldStyle(),
                      ),
                    ),
                  ),
                  WifiRemoteButton(
                    onPressed: () async {
                      await tv.sendKey(samsungKeyCodes.KEY_2);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "2",
                        style: getBoldStyle(),
                      ),
                    ),
                  ),
                  WifiRemoteButton(
                    onPressed: () async {
                      await tv.sendKey(samsungKeyCodes.KEY_3);
                    },
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
                  WifiRemoteButton(
                    onPressed: () async {
                      await tv.sendKey(samsungKeyCodes.KEY_4);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "4",
                        style: getBoldStyle(),
                      ),
                    ),
                  ),
                  WifiRemoteButton(
                    onPressed: () async {
                      await tv.sendKey(samsungKeyCodes.KEY_5);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "5",
                        style: getBoldStyle(),
                      ),
                    ),
                  ),
                  WifiRemoteButton(
                    onPressed: () async {
                      await tv.sendKey(samsungKeyCodes.KEY_6);
                    },
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
                  WifiRemoteButton(
                    onPressed: () async {
                      await tv.sendKey(samsungKeyCodes.KEY_7);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "7",
                        style: getBoldStyle(),
                      ),
                    ),
                  ),
                  WifiRemoteButton(
                    onPressed: () async {
                      await tv.sendKey(samsungKeyCodes.KEY_8);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "8",
                        style: getBoldStyle(),
                      ),
                    ),
                  ),
                  WifiRemoteButton(
                    onPressed: () async {
                      await tv.sendKey(samsungKeyCodes.KEY_9);
                    },
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
              WifiRemoteButton(
                onPressed: () async {
                  await tv.sendKey(samsungKeyCodes.KEY_0);
                },
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
