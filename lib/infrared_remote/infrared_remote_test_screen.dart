import 'package:flutter/material.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/infrared_remote/save_infrared_tv_screen.dart';
import 'package:remote_control/infrared_remote/signal_emmiter.dart';
import 'package:remote_control/misc_screens/feedback_screen.dart';
import 'package:remote_control/model/remote_model.dart';

class InfraredRemoteTestScreen extends StatefulWidget {
  const InfraredRemoteTestScreen(
      {super.key, required this.infraredRemotes, required this.brandName});
  final List<InfraredRemote> infraredRemotes;
  final String brandName;

  @override
  State<InfraredRemoteTestScreen> createState() =>
      _InfraredRemoteTestScreenState();
}

class _InfraredRemoteTestScreenState extends State<InfraredRemoteTestScreen> {
  bool? isTVTurnedOn;

  bool isDoesTVRespondShown = false;

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test ${widget.brandName} Remote"),
      ),
      body: isTVTurnedOn != null
          ? Column(
              children: [
                // if the tv is turned on
                if (isTVTurnedOn == true)
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Tap the buttons below to test if the TV responds correctly",
                        style: getRegularStyle(),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // volume up card
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 40, horizontal: 50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleButton(
                                  color: null,
                                  callback: () {
                                    InfraredRemote remote =
                                        widget.infraredRemotes[currentIndex];

                                    if (remote.volumePlus != null) {
                                      sendInfraredSignal(
                                          remote.volumePlus!, context);
                                    }

                                    isDoesTVRespondShown = true;
                                    setState(() {});
                                  },
                                  text: "Volume up",
                                  iconData: Icons.volume_up),
                              const SizedBox(
                                height: 40,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(width: 2, color: appPurple),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                        onPressed: currentIndex == 0
                                            ? null
                                            : () {
                                                decreaseIndex();
                                              },
                                        icon: const Icon(Icons.arrow_back)),
                                    Text(
                                        "${currentIndex + 1}/${widget.infraredRemotes.length}"),
                                    IconButton(
                                        onPressed: currentIndex + 1 ==
                                                widget.infraredRemotes.length
                                            ? null
                                            : () {
                                                increaseIndex();
                                              },
                                        icon: const Icon(Icons.arrow_forward)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      // Does your tv response card
                      if (isDoesTVRespondShown == true)
                        Column(
                          children: [
                            const SizedBox(
                              height: 80,
                            ),
                            Text(
                              "Did your TV respond?",
                              style: getBoldStyle(),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleButton(
                                    color: null,
                                    callback: () {
                                      if (currentIndex + 1 ==
                                          widget.infraredRemotes.length) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const FeedBackScreen()));
                                      } else {
                                        increaseIndex();
                                      }
                                    },
                                    text: "No",
                                    iconData: Icons.close),
                                CircleButton(
                                    color: appPurple,
                                    callback: () {
                                      InfraredRemote remote =
                                          widget.infraredRemotes[currentIndex];
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SaveInfraredRemoteScreen(
                                                    remote: remote,
                                                    brandName: widget.brandName,
                                                  )));
                                    },
                                    text: "Yes",
                                    iconData: Icons.check),
                              ],
                            )
                          ],
                        )
                    ],
                  ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const RemoteLottie(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Is your TV turned on?",
                  style: getBoldStyle(),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleButton(
                        color: null,
                        callback: () {
                          showInfoDialog(
                              context: context,
                              message: "Please turn on your televison set");
                        },
                        text: "No",
                        iconData: Icons.close),
                    CircleButton(
                        color: appPurple,
                        callback: () {
                          isTVTurnedOn = true;
                          setState(() {});
                        },
                        text: "Yes",
                        iconData: Icons.check),
                  ],
                )
              ],
            ),
    );
  }

  void increaseIndex() {
    currentIndex++;
    isDoesTVRespondShown = false;
    setState(() {});
  }

  void decreaseIndex() {
    isDoesTVRespondShown = false;

    currentIndex--;
    setState(() {});
  }
}
