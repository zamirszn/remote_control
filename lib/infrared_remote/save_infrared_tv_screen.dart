import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:remote_control/data_source/local_data_source/storage.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/home_screen.dart';
import 'package:remote_control/model/remote_model.dart';
import 'package:remote_control/model/saved_remote_model.dart';
import 'package:remote_control/my_remote/my_remote_screen.dart';

class SaveInfraredRemoteScreen extends StatefulWidget {
  const SaveInfraredRemoteScreen(
      {super.key, required this.remote, required this.brandName, this.id});
  final InfraredRemote remote;
  final String brandName;
  final String? id;

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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.id != null
            ? const Text("Edit Remote")
            : const Text("Save Remote"),
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
                  widget.id != null
                      ? Text(
                          "${widget.brandName} TV ",
                          style: getBoldStyle(),
                          textAlign: TextAlign.center,
                        )
                      : Text(
                          "${widget.brandName} TV connected!",
                          style: getBoldStyle(),
                          textAlign: TextAlign.center,
                        ),
                  if (widget.id == null)
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
                  TextFormField(
                    maxLength: 20,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a name";
                      }
                      return null;
                    },
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
                                    tvNameTextEditingController.clear();

                                    tvNameTextEditingController.text = location;
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
                        if (_formKey.currentState!.validate()) {
                          saveRemoteToStorage();
                        }
                      },
                      child: const Text("Save"))
                ]),
          ),
        ),
      ),
    );
  }

  void saveRemoteToStorage() {
    // showLoadingDialog("Saving Remote", context);
    String customName = tvNameTextEditingController.text;
    String icon = tvIcon[selectedTVIconIndex];
    Map<String, dynamic> remote = widget.remote.toJson();

    //if widget.id is not null this means we are editing an existing remote using an id
    // because hive db will overwrite an existing id

    SavedRemoteModel saveRemoteObj = SavedRemoteModel(
      icon: icon,
      remote: remote,
      customName: customName,
      type: ir,
      id: widget.id ?? DateTime.now().toString(),
      brand: widget.brandName,
    );

    Storage().saveRemote(saveRemoteObj);
    //clear all the routes and replace with home screen
    
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
  }
}
