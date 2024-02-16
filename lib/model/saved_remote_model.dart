import 'package:hive/hive.dart';
import 'package:remote_control/model/remote_model.dart';

part 'saved_remote_model.g.dart';

@HiveType(typeId: 0)
class SavedRemoteModel {
  @HiveField(0)
  final String customName;
  @HiveField(1)
  final String icon;
  @HiveField(2)
  final Map<String, dynamic> remote;
  @HiveField(3)
  final String type;
  @HiveField(4)
  final String? id;
  @HiveField(5)
  final String brand;

  SavedRemoteModel({
    required this.customName,
    required this.icon,
    required this.remote,
    required this.type,
    required this.id,
    required this.brand,
  });

  factory SavedRemoteModel.fromJson(Map<String, dynamic> json) {
    return SavedRemoteModel(
      customName: json["remoteName"],
      icon: json["icon"],
      remote: json["remote"],
      type: json["type"],
      id: json["id"],
      brand: json["brand"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "remoteName": customName,
      "icon": icon,
      "remote": remote,
      "type": type,
      "id": id,
      "brand": brand,
    };
  }
}
