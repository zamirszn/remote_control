import 'package:flutter/material.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/infrared_remote/signal_emmiter.dart';

class InfraredControllerButton extends StatelessWidget {
  final Widget? child;
  final double borderRadius;
  final String? code;
  final bool? hasBorder;
  const InfraredControllerButton({
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
            if (code != null) {
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

class WifiControllerButton extends StatelessWidget {
  final Widget? child;
  final double borderRadius;
  final String? code;
  final bool? hasBorder;
  const WifiControllerButton({
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
            if (code != null) {}
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: child,
          ),
        ));
  }
}
