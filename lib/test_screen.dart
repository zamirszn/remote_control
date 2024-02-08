import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ir_sensor_plugin/ir_sensor_plugin.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final ctrl = TextEditingController();
  String? response = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: ctrl,
          ),
          ElevatedButton(
              onPressed: () => sendCode(context, ctrl.text),
              child: const Text("Send code")),
          Text("$response  ,${ctrl.text} code sent"),
        ],
      ),
    );
  }

  sendCode(BuildContext context, String text) async {
    response = await IrSensorPlugin.transmitString(pattern: ctrl.text);
    setState(() {});
  }
}
