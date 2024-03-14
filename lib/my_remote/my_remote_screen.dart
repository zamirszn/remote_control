import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:remote_control/data_source/local_data_source/storage.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/infrared_remote/infrared_remote_screen.dart';
import 'package:remote_control/infrared_remote/save_infrared_tv_screen.dart';
import 'package:remote_control/model/remote_model.dart';
import 'package:remote_control/model/saved_remote_model.dart';
import 'package:remote_control/setup/choose_remote_type.dart';
import 'package:remote_control/test_screen.dart';
import 'package:remote_control/infrared_remote/infrared_tv_brands_screen.dart';

class MyRemoteScreen extends StatelessWidget {
  const MyRemoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TV Remote Control"),
      // actions: [
      //   IconButton(onPressed: (){
      //      Navigator.of(context).push(MaterialPageRoute(
      //         builder: (context) => const TestScreen(),
      //       ));
      //   }, icon: Icon(Icons.bug_report))
      // ],
      ),
      
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ChooseRemoteTypeScreen(),
            ));
          },
          label: const Text("Add New Remote")),
      body: ValueListenableBuilder(
          valueListenable:
              Hive.box<SavedRemoteModel>("savedRemotes").listenable(),
          builder: (context, box, child) {
            Iterable<SavedRemoteModel> remotes = box.values;
            return remotes.isEmpty
                ? const RemoteLottie()
                : GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: remotes.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      SavedRemoteModel remote = remotes.elementAt(index);
                      return MyTVRemoteWidget(
                        id: remote.id!,
                        icon: "assets/tv_${remote.icon}.webp",
                        brand: remote.brand,
                        remoteNickName: remote.customName,
                        type: remote.type,
                        remote: remote.remote,
                        onPressed: () {
                          if (remote.type == ir) {
                            InfraredRemote r =
                                InfraredRemote.fromJson(remote.remote);
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => InfraredRemoteScreen(
                                remote: r,
                                remoteName: remote.brand,
                              ),
                            ));
                          }
                        },
                      );
                    },
                  );
          }),
    );
  }
}

class MyTVRemoteWidget extends StatelessWidget {
  const MyTVRemoteWidget({
    super.key,
    required this.brand,
    required this.remoteNickName,
    required this.icon,
    required this.type,
    required this.remote,
    required this.onPressed,
    required this.id,
  });
  final String brand;
  final String remoteNickName;
  final String icon;
  final String type;
  final Map<String, dynamic> remote;
  final Function onPressed;
  final String id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
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
                  icon,
                  height: 80,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    remoteNickName,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  brand,
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
                child: PopupMenuButton(
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: edit,
                      child: Text(edit),
                    ),
                    const PopupMenuItem(
                      value: delete,
                      child: Text(delete),
                    )
                  ],
                  onSelected: (value) {
                    // for ir based remotes
                    if (value == edit && type == ir) {
                      InfraredRemote r = InfraredRemote.fromJson(remote);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SaveInfraredRemoteScreen(
                          brandName: brand,
                          remote: r,
                          id: id,
                        ),
                      ));
                    } else if (value == delete && type == ir) {
                      Storage().deleteRemove(id);
                    }
                  },
                ))
          ],
        ),
      ),
    );
  }
}
