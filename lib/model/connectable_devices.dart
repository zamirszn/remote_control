// device_model.dart

class ConnectableDeviceModel {
  final String? id;
  final String? ipAddress;
  final String? friendlyName;
  final String? modelName;

  ConnectableDeviceModel({
    required this.id,
    required this.ipAddress,
    required this.friendlyName,
    required this.modelName,
  });

  factory ConnectableDeviceModel.fromJson(Map<String, dynamic> json) {
    return ConnectableDeviceModel(
      id: json['id']?.toString() ?? '',
      ipAddress: json['ipAddress']?.toString() ?? '',
      friendlyName: json['friendlyName']?.toString() ?? '',
      modelName: json['modelName']?.toString() ?? '',
    );
  }
}
