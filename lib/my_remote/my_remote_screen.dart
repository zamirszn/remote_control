import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/model/remote_model.dart';
import 'package:remote_control/setup/choose_remote_type.dart';
import 'package:remote_control/test_screen.dart';
import 'package:remote_control/infrared/ir_tv_brand_screen.dart';

List<MyTvRemote> myTVRemotes = [
  const MyTvRemote(
      remoteName: "Samsung",
      remoteNickName: "My Bedroom TV",
      remoteImage: "blue"),
  const MyTvRemote(
      remoteName: "LG", remoteNickName: "Lounge", remoteImage: "orange"),
  const MyTvRemote(
      remoteName: "Sony", remoteNickName: "My Kitchen TV", remoteImage: "pink"),
];

class MyRemoteScreen extends StatelessWidget {
  const MyRemoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TV Remote Control")),
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ChooseRemoteTypeScreen(),
            ));
          },
          label: const Text("Add New Remote")),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: myTVRemotes.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          MyTvRemote remote = myTVRemotes[index];
          return MyTVRemoteWidget(
            remoteImage: "assets/tv_${remote.remoteImage}.webp",
            remoteName: remote.remoteName,
            remoteNickName: remote.remoteNickName,
          );
        },
      ),
    );
  }
}

class MyTVRemoteWidget extends StatelessWidget {
  const MyTVRemoteWidget({
    super.key,
    required this.remoteName,
    required this.remoteNickName,
    required this.remoteImage,
  });
  final String remoteName;
  final String remoteNickName;
  final String remoteImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: appPurple),
          borderRadius: BorderRadius.circular(10)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                remoteImage,
                height: 80,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                remoteNickName,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                remoteName,
                style: getBoldStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              icon: Icon(
                Icons.more_vert,
                color: appPurple,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
