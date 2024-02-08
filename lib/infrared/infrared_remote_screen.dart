import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/home_screen.dart';
import 'package:remote_control/model/remote_model.dart';
import 'package:remote_control/remote_button.dart';

class InfraredRemoteScreen extends StatelessWidget {
  const InfraredRemoteScreen(
      {super.key, required this.remoteName, required this.remote});
  final String remoteName;
  final IrTvRemote remote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$remoteName Remote"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
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
                ControllerButton(
                  code: remote.power,
                  child: const Icon(
                    Icons.power_settings_new_rounded,
                    size: 20,
                  ),
                ),
                ControllerButton(
                  code: remote.info,
                  child: const Icon(
                    Icons.info_outline,
                    size: 20,
                  ),
                ),
              ],
            ),
            //mute
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ControllerButton(
                  code: remote.mute,
                  child: const Icon(
                    Icons.volume_off_outlined,
                    size: 20,
                  ),
                ),
                const ControllerButton(
                  code: null,
                  child: Icon(
                    Icons.more_horiz_rounded,
                    size: 20,
                  ),
                ),
                ControllerButton(
                  code: remote.menu,
                  child: const Icon(
                    Icons.list_rounded,
                    size: 20,
                  ),
                ),
              ],
            ),
            // volume
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ControllerButton(
                  code: null,
                  borderRadius: 15,
                  child: Column(
                    children: [
                      ControllerButton(
                        hasBorder: false,
                        code: remote.volumePlus,
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
                      ControllerButton(
                        hasBorder: false,
                        code: remote.volumnMinus,
                        child: const Icon(
                          Icons.remove,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const ControllerButton(
                  code: null,
                  child: Icon(
                    Icons.home_max_rounded,
                    size: 20,
                  ),
                ),
                ControllerButton(
                  code: null,
                  borderRadius: 15,
                  child: Column(
                    children: [
                      ControllerButton(
                        hasBorder: false,
                        code: remote.channelPlus,
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
                      ControllerButton(
                        hasBorder: false,
                        code: remote.channelMinus,
                        child: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Container(
              width: 200,
              height: 200,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: Colors.deepPurple.shade300),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ControllerButton(
                    hasBorder: false,
                    code: remote.up,
                    child: const Icon(
                      Icons.keyboard_arrow_up_rounded,
                      size: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ControllerButton(
                        hasBorder: false,
                        code: remote.left,
                        child: const Icon(
                          Icons.keyboard_arrow_left,
                          size: 20,
                        ),
                      ),
                      ControllerButton(
                          code: remote.enter,
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "OK",
                            ),
                          )),
                      ControllerButton(
                        hasBorder: false,
                        code: remote.left,
                        child: const Icon(
                          Icons.keyboard_arrow_right,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  ControllerButton(
                    hasBorder: false,
                    code: remote.down,
                    child: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ControllerButton(
                  code: remote.exit,
                  child: const Icon(
                    Icons.keyboard_arrow_left_outlined,
                    size: 20,
                  ),
                ),
                GestureDetector(
                  onTap: () => showNumberPadBottomSheet(context),
                  child: const AbsorbPointer(
                    absorbing: true,
                    child: ControllerButton(
                      code: null,
                      child: Text(
                        "123",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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
                  ControllerButton(
                    code: remote.one,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "1",
                        style: getBoldStyle(),
                      ),
                    ),
                  ),
                  ControllerButton(
                    code: remote.two,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "2",
                        style: getBoldStyle(),
                      ),
                    ),
                  ),
                  ControllerButton(
                    code: remote.three,
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
                  ControllerButton(
                    code: remote.four,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "4",
                        style: getBoldStyle(),
                      ),
                    ),
                  ),
                  ControllerButton(
                    code: remote.five,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "5",
                        style: getBoldStyle(),
                      ),
                    ),
                  ),
                  ControllerButton(
                    code: remote.six,
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
                  ControllerButton(
                    code: remote.seven,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "7",
                        style: getBoldStyle(),
                      ),
                    ),
                  ),
                  ControllerButton(
                    code: remote.eight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "8",
                        style: getBoldStyle(),
                      ),
                    ),
                  ),
                  ControllerButton(
                    code: remote.nine,
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
              ControllerButton(
                code: remote.zero,
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
