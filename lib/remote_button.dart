import 'package:flutter/material.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/infrared_remote/signal_emmiter.dart';
import 'package:remote_control/wifi_remote/connectsdk_method_channel.dart';

class InfraredRemoteButton extends StatelessWidget {
  final Widget? child;
  final double borderRadius;
  final String? code;
  final bool? hasBorder;
  const InfraredRemoteButton({
    super.key,
    this.child,
    this.borderRadius = 100,
    required this.code,
    this.hasBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: hasBorder == true || hasBorder == null
            ? BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                border: Border.all(width: 2, color: appPurple),
              )
            : null,
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onTap: () {
            if (code != null && code!.isNotEmpty) {
              sendInfraredSignal(code!, context);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: child,
          ),
        ));
  }
}

class WifiRemoteButton extends StatelessWidget {
  final Widget? child;
  final double borderRadius;
  final Function? onPressed;
  final bool? hasBorder;
  const WifiRemoteButton({
    super.key,
    this.child,
    this.borderRadius = 100,
    required this.onPressed,
    this.hasBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: hasBorder == true || hasBorder == null
            ? BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                border: Border.all(width: 2, color: appPurple),
              )
            : null,
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onTap: () {
            if (onPressed != null) {
              onPressed!();
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: child,
          ),
        ));
  }
}

class WifiControllerButtonOld extends StatelessWidget {
  final Widget? child;
  final double borderRadius;
  final String? code;
  final bool? hasBorder;
  const WifiControllerButtonOld({
    super.key,
    this.child,
    this.borderRadius = 100,
    required this.code,
    this.hasBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: hasBorder == true || hasBorder == null
            ? BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                border: Border.all(width: 2, color: appPurple),
              )
            : null,
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onTap: () {
            if (code != null && code!.isNotEmpty) {
              connectSdkMethodChannel.sendTVCommand(command: code!);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: child,
          ),
        ));
  }
}
