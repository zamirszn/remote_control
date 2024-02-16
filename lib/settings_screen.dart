import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remote_control/global.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text(
              "Feedback",
            ),
            onTap: () => showFeedBackBottomSheet(context),
            leading: const Icon(Icons.feedback),
            subtitle: const Text("Report bugs and tell us what to improve"),
          ),
          ListTile(
            title: const Text(
              "Haptic Feedback",
            ),
            leading: const Icon(Icons.vibration),
            trailing: Switch(
              value: vibrationValue,
              onChanged: (value) {
                toggleVibrationSwitch(value);
                setState(() {
                  vibrationValue = value;
                });
              },
            ),
            subtitle: const Text("Toggle vibration for remotes"),
          ),
          // const ListTile(
          //   title: Text(
          //     "Rate us",
          //   ),
          //   leading: Icon(Icons.star),
          //   subtitle: Text("Like this app? Please rate us!"),
          // ),
          // const ListTile(
          //   title: Text(
          //     "Share",
          //   ),
          //   leading: Icon(Icons.share),
          //   subtitle: Text("Share this app"),
          // ),
          // ListTile(
          //   title: Text(
          //     "Language",
          //   ),
          //   leading: Icon(Icons.language),
          //   subtitle: Text("English"),
          // ),
          const ListTile(
            title: Text(
              "Privacy Policy",
            ),
            leading: Icon(Icons.privacy_tip_rounded),
          ),
        ],
      ),
    );
  }

  void showFeedBackBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: FeedbackBottomSheet(),
      ),
    );
  }
}

class FeedbackBottomSheet extends StatefulWidget {
  const FeedbackBottomSheet({
    super.key,
  });

  @override
  State<FeedbackBottomSheet> createState() => _FeedbackBottomSheetState();
}

class _FeedbackBottomSheetState extends State<FeedbackBottomSheet> {
  final TextEditingController feedbackController = TextEditingController();

  @override
  void dispose() {
    feedbackController.dispose();
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
            "FeedBack",
            style: getBoldStyle(),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: feedbackController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a message";
              }
              return null;
            },
            maxLength: 30,
            maxLines: 5,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: "Enter your message here"),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  sendFeedbackEmail(
                      subject: "Remote Control App FeedBack ",
                      body: feedbackController.text);
                }
              },
              child: const Text("Submit"))
        ]),
      ),
    );
  }
}
