import 'package:flutter/material.dart';
import 'package:remote_control/data_source/ir_remotes/lg.dart';
import 'package:remote_control/global.dart';
import 'package:remote_control/infrared_remote/all_infrared_tv_brands.dart';
import 'package:remote_control/infrared_remote/found_remote_screen.dart';
import 'package:remote_control/infrared_remote/infrared_remote_screen.dart';
import 'package:remote_control/infrared_remote/infrared_remote_test_screen.dart';
import 'package:remote_control/model/brands.dart';
import 'package:remote_control/model/remote_model.dart';

class InfraredTvBrandsScreen extends StatefulWidget {
  const InfraredTvBrandsScreen({super.key});

  @override
  State<InfraredTvBrandsScreen> createState() => _InfraredTvBrandsScreenState();
}

class _InfraredTvBrandsScreenState extends State<InfraredTvBrandsScreen> {
  List<RemoteBrand> _filteredBrands = [];

  @override
  void initState() {
    _filteredBrands = List.from(allIRRemoteBrands);
    _filteredBrands.sort(((a, b) => a.brandName.compareTo(b.brandName)));
    super.initState();
  }

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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: SizedBox(
              height: 50,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _filteredBrands = allIRRemoteBrands
                        .where((brand) => brand.brandName
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  });
                },
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
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
              itemCount: _filteredBrands.length,
              itemBuilder: (context, index) {
                RemoteBrand selectedRemote = _filteredBrands[index];
                return ListTile(
                  leading: const Icon(Icons.tv),
                  title: Text(selectedRemote.brandName ?? ""),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FoundRemoteScreen(
                                brandName: selectedRemote.brandName,
                                infraredRemotes: selectedRemote.infraredRemotes,
                              ))),
                );
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
      builder: (context) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: MissingBrandFeedbackBottomSheet(),
      ),
    );
  }
}

class MissingBrandFeedbackBottomSheet extends StatefulWidget {
  const MissingBrandFeedbackBottomSheet({
    super.key,
  });

  @override
  State<MissingBrandFeedbackBottomSheet> createState() =>
      _MissingBrandFeedbackBottomSheetState();
}

class _MissingBrandFeedbackBottomSheetState
    extends State<MissingBrandFeedbackBottomSheet> {
  final TextEditingController modelController = TextEditingController();
  final TextEditingController brandController = TextEditingController();

  @override
  void dispose() {
    modelController.dispose();
    brandController.dispose();
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
          TextFormField(
            controller: brandController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a brand name";
              }
              return null;
            },
            maxLength: 30,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: "Enter the brand name"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: modelController,
            maxLength: 30,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a model";
              }
              return null;
            },
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: "Enter the model"),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  sendFeedbackEmail(
                      subject: "Remote Control Support",
                      body:
                          "I've got a ${brandController.text} ${modelController.text} remote, can you add support in $appName App.");
                }
              },
              child: const Text("Submit"))
        ]),
      ),
    );
  }
}
