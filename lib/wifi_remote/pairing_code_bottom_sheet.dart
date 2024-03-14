import 'package:flutter/material.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/wifi_remote/connectsdk_method_channel.dart';

void pairingCodeBrandBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    useSafeArea: true,
    isScrollControlled: true,
    builder: (context) => const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: PairingCodeBottomSheet(),
    ),
  );
}

class PairingCodeBottomSheet extends StatefulWidget {
  const PairingCodeBottomSheet({
    super.key,
  });

  @override
  State<PairingCodeBottomSheet> createState() => _PairingCodeBottomSheetState();
}

class _PairingCodeBottomSheetState extends State<PairingCodeBottomSheet> {
  final TextEditingController pairingCodeController = TextEditingController();

  @override
  void dispose() {
    pairingCodeController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close_rounded)),
          ),
          Text(
            "Pairing Code",
            style: getBoldStyle(),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Please enter the pairing code on your TV",
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: pairingCodeController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter the pairing code";
              }
              return null;
            },
            maxLength: 10,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: "Enter the pairing code"),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  connectSdkMethodChannel
                      .sendPairingKey(pairingCodeController.text);
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Submit"))
        ]),
      ),
    );
  }
}
