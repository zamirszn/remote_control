import 'package:flutter/material.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/remote_button.dart';
import 'package:http/http.dart' as http;


class RokuWifiRemote extends StatelessWidget {
  const RokuWifiRemote({super.key, required this.ipAddress});
  final String ipAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Roku Remote")),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          decoration: BoxDecoration(
              // color: Colors.grey.shade300,
              border: Border.all(width: 2, color: appPurple),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // power

              //mute
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WifiRemoteButton(
                    onPressed: () {
                      buttonPressed("power");
                    },
                    child: const Icon(
                      Icons.power_settings_new_rounded,
                      size: 20,
                    ),
                  ),
                  WifiRemoteButton(
                    hasBorder: true,
                    onPressed: () {
                      buttonPressed('volumemute');
                    },
                    child: const Icon(
                      Icons.volume_off_outlined,
                      size: 20,
                    ),
                  ),
                ],
              ),
              // volume

              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WifiRemoteButton(
                      onPressed: null,
                      borderRadius: 15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WifiRemoteButton(
                            hasBorder: false,
                            onPressed: () {
                              buttonPressed('volumeup');
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
                            onPressed: () {
                              buttonPressed('volumedown');
                            },
                            child: const Icon(
                              Icons.remove,
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
                          onPressed: () {
                            buttonPressed('home');
                          },
                          child: const Text("HOME"),
                        ),
                        WifiRemoteButton(
                          hasBorder: true,
                          onPressed: () {
                            buttonPressed('back');
                          },
                          child: const Text("RETURN"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

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
                      onPressed: () {
                        buttonPressed('up');
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
                          onPressed: () {
                            buttonPressed('left');
                          },
                          child: const Icon(
                            Icons.keyboard_arrow_left,
                            size: 20,
                          ),
                        ),
                        WifiRemoteButton(
                            onPressed: () {
                              buttonPressed('select');
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "OK",
                              ),
                            )),
                        WifiRemoteButton(
                          hasBorder: false,
                          onPressed: () {
                            buttonPressed('right');
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
                      onPressed: () {
                        buttonPressed('down');
                      },
                      child: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void buttonPressed(String key) async {
    vibrateOnPress();
    if (ipAddress == '') {
      return;
    }

    var url = Uri.parse('http://$ipAddress:8060/keypress/$key');
    var response = await http.post(url);
    print(response.body);
  }
}
