import 'package:flutter/material.dart';
import 'package:remote_control/data_source/ir_remotes/lg.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/model/remote_model.dart';
import 'package:remote_control/wifi_remote/wifi_scan_instruction_screen.dart';


class SmartTvBrandScreen extends StatelessWidget {
  const SmartTvBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select TV Brand"),
        actions: [
          IconButton(
              onPressed: () {
                showHelpFindBrandBottomSheet(context);
              },
              icon: const Icon(Icons.info))
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: SizedBox(
              height: 50,
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    hintText: "Enter the model",
                    contentPadding: EdgeInsets.only(top: 10),
                    prefixIcon: Icon(
                      Icons.search,
                    )),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: null,
              itemBuilder: (context, index) {
                //  SmartTvRemote = allRemotes[index];
                return ListTile(
                  leading: const Icon(Icons.tv),
                  title: const Text("Samsung"),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const WifiPreScanInstructionScreen())),
                );
                // return ListTile(
                //   leading: const Icon(Icons.tv),
                //   title: Text(selectedRemote.remoteName ?? ""),
                //   onTap: () => Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => InfraredRemoteScreen(
                //           remoteName: selectedRemote.remoteName ?? "",
                //           remote: selectedRemote,
                //         ),
                //       )),
                // );
              },
            ),
          )
        ],
      ),
    );
  }

  void showHelpFindBrandBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close_rounded)),
          ),
          Text(
            "Cant find your brand",
            style: getBoldStyle(),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Please tell us the brand and model you need and we'll update soon",
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          const TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(hintText: "Enter the brand name"),
          ),
          const SizedBox(
            height: 20,
          ),
          const TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(hintText: "Enter the model"),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Submit"))
        ]),
      ),
    );
  }
}
