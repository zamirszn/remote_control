import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:remote_control/data_source/local_data_source/app_prefs.dart';
import 'package:remote_control/infrared_remote/signal_emmiter.dart';
import 'package:url_launcher/url_launcher.dart';

const String appName = "Remote Control";
const String edit = "Edit";
const String delete = "Delete";
const String ir = "ir";

final Color appPurple = Colors.deepPurple.shade300;

final Color remoteButtonColor = Colors.grey.shade900;

List<String> tvIcon = ["blue", "orange", "pink", "purple"];

bool vibrationValue = true;

void toggleVibrationSwitch(bool value) async {
  await appPreferences.setVibration(value);
}

const String supportEmail = "sample@mail.com";

void sendFeedbackEmail({
  required String subject,
  required String body,
}) async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: supportEmail,
    query: "mailto:$supportEmail?subject=$subject&body=$body",
  );

  if (await canLaunchUrl(emailUri)) {
    await launchUrl(emailUri);
  } else {
    throw 'Could not launch email';
  }
}

TextStyle getBoldStyle({
  double fontSize = 25,
}) {
  return _getTextStyle(
    fontSize,
    FontFamily.fontFamily,
    FontWeight.bold,
  );
}

TextStyle getRegularStyle({
  double fontSize = 18,
}) {
  return _getTextStyle(
    fontSize,
    FontFamily.fontFamily,
    FontWeight.w100,
  );
}

TextStyle _getTextStyle(
  double fontSize,
  String fontFamily,
  FontWeight fontWeight,
) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      // color: color,
      fontWeight: fontWeight);
}

class CircleButton extends StatelessWidget {
  const CircleButton(
      {super.key,
      required this.color,
      required this.callback,
      required this.text,
      required this.iconData});
  final Color? color;
  final VoidCallback callback;
  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 40,
          child: IconButton(
              onPressed: () => callback(),
              icon: Icon(
                iconData,
                size: 40,
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(text)
      ],
    );
  }
}

class FontFamily {
  static const String fontFamily = "PulpDisplay";
}

class RemoteLottie extends StatelessWidget {
  const RemoteLottie({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return
        // isDarkMode?  Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Lottie.asset("assets/tv_dark.json",),
        // ):
        Lottie.asset(
      "assets/remote_control.json",
      
    );
  }
}

class SuccessLottie extends StatelessWidget {
  const SuccessLottie({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      "assets/success.json",
      height: 200,
    );
  }
}

class FailLottie extends StatelessWidget {
  const FailLottie({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset("assets/fail.json", height: 200);
  }
}

Future<void> showErrorDialog(String message, context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: const Text('Error'),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(child: Text(message)),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> showLoadingDialog(String message, context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return SimpleDialog(
        title: const Text('Info'),
        alignment: Alignment.center,
        children: [
          const CupertinoActivityIndicator(
            radius: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Center(child: Text(message)),
          ),
        ],
      );
    },
  );
}

Future<void> showInfoDialog(
    {required String message, required BuildContext context}) async {
  return showDialog<void>(
    context: context,
    builder: (context) {
      return SimpleDialog(
        title: const Text('Info'),
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Center(child: Text(message)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Ok")),
            ),
          )
        ],
      );
    },
  );
}
