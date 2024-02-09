// device_model.dart

class ConnectableDeviceModel {
  final String? id;
  final String? ipAddress;
  final String? friendlyName;
  final String? modelName;
  final String? modelNumber;
  final String? lastKnownIPAddress;
  final String? lastSeenOnWifi;
  final int? lastConnected;
  final int? lastDetection;

  ConnectableDeviceModel({
    required this.id,
    required this.ipAddress,
    required this.friendlyName,
    required this.modelName,
    required this.modelNumber,
    required this.lastKnownIPAddress,
    required this.lastSeenOnWifi,
    required this.lastConnected,
    required this.lastDetection,
  });

  factory ConnectableDeviceModel.fromJson(Map<String, dynamic> json) {
    return ConnectableDeviceModel(
      id: json['id'] ?? '',
      ipAddress: json['ipAddress'] ?? '',
      friendlyName: json['friendlyName'] ?? '',
      modelName: json['modelName'] ?? '',
      modelNumber: json['modelNumber'] ?? '',
      lastKnownIPAddress: json['lastKnownIPAddress'] ?? '',
      lastSeenOnWifi: json['lastSeenOnWifi'] ?? '',
      lastConnected: json['lastConnected'] ?? 0,
      lastDetection: json['lastDetection'] ?? 0,
    );
  }
}
