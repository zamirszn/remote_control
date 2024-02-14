import 'package:remote_control/model/remote_model.dart';

class SavedRemoteModel {
  final String customName;
  final String icon;
  final Map<String, dynamic> remote;
  final String type;

  SavedRemoteModel({
    required this.customName,
    required this.icon,
    required this.remote,
    required this.type,
  });

  factory SavedRemoteModel.fromJson(Map<String, dynamic> json) {
    return SavedRemoteModel(
      customName: json["remoteName"],
      icon: json["icon"],
      remote: json["remote"],
      type: json["type"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "remoteName": customName,
      "icon": icon,
      "remote": remote,
      "type": type,
    };
  }
}
