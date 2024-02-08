import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:remote_control/infrared/signal_emmiter.dart';

const String appName = "Remote Control";

final Color appPurple = Colors.deepPurple.shade300;

final Color remoteButtonColor = Colors.grey.shade900;

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

class FontFamily {
  static const String fontFamily = "PulpDisplay";
}

class RemoteLottie extends StatelessWidget {
  const RemoteLottie({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset("assets/remote_control.json");
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
