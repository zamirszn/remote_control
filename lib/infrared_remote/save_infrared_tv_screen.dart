import 'package:flutter/material.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/model/remote_model.dart';
import 'package:remote_control/my_remote/my_remote_screen.dart';

class SaveInfraredRemoteScreen extends StatefulWidget {
  const SaveInfraredRemoteScreen(
      {super.key, required this.remote, required this.brandName});
  final InfraredRemote remote;
  final String brandName;

  @override
  State<SaveInfraredRemoteScreen> createState() =>
      _SaveInfraredRemoteScreenState();
}

class _SaveInfraredRemoteScreenState extends State<SaveInfraredRemoteScreen> {
  final TextEditingController tvNameTextEditingController =
      TextEditingController();

  @override
  void dispose() {
    tvNameTextEditingController.dispose();
    super.dispose();
  }

  String selectedTvLocation = tvLocations.first;

  static List<String> tvLocations = [
    "Default",
    "Living Room",
    "Bedroom",
    "Dinning room",
    "Media room",
    "Office",
  ];

  int selectedTVIconIndex = 0;

  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Save Remote"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${widget.brandName} TV connected!",
                    style: getBoldStyle(),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    "The remote is now connected to your TV. Please save it for future use",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Name your remote",
                      style: getBoldStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: tvNameTextEditingController,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                tvNameTextEditingController.clear();
                              },
                              icon: const Icon(Icons.close)),
                          hintText: "Enter name here",
                          contentPadding:
                              const EdgeInsets.only(top: 10, left: 10),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "TV location",
                      style: getBoldStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Wrap(
                      children: tvLocations
                          .map((location) => Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: ChoiceChip(
                                  onSelected: (value) {
                                    selectedTvLocation = location;
                                    if (location != tvLocations.first) {
                                      tvNameTextEditingController.text =
                                          location;
                                    } else {
                                      tvNameTextEditingController.clear();
                                    }
                                    setState(() {});
                                  },
                                  selected: location == selectedTvLocation,
                                  label: Text(location),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Select icon",
                      style: getBoldStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        String iconName = tvIcon[index];
                        return GestureDetector(
                          onTap: () {
                            selectedTVIconIndex = index;
                            setState(() {});
                          },
                          child: Container(
                            padding: const EdgeInsetsDirectional.all(10),
                            margin: const EdgeInsets.only(left: 5),
                            decoration: index == selectedTVIconIndex
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(width: 1, color: appPurple))
                                : null,
                            child: Image.asset(
                              "assets/tv_$iconName.webp",
                              height: 130,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        saveRemoteToStorage();
                      },
                      child: const Text("Save"))
                ]),
          ),
        ),
      ),
    );
  }

  void saveRemoteToStorage() {
    String remoteName = tvNameTextEditingController.text;
    String icon = tvIcon[selectedTVIconIndex];
    Map<String, dynamic> remote = widget.remote.toJson();
  }
}
