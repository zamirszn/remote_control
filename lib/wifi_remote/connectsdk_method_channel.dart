import 'dart:async';
import 'package:flutter/services.dart';
import 'package:remote_control/model/connectable_devices.dart';

class ConnectSdkMethodChannel {
  static const MethodChannel _channel =
      MethodChannel('connectsdkMethodChannel');

  Future<void> initialize() async {
    try {
      bool isInitialized =await _channel.invokeMethod('initialize');
    } catch (e) {
      print('Error connecting to device: $e');
    }
  }

  Future<List<ConnectableDeviceModel>> getAvailableDevices() async {
    try {
      final List<dynamic> devices =
          await _channel.invokeMethod('getAvailableDevices');
      return devices
          .map((device) => ConnectableDeviceModel.fromJson(device))
          .toList();
    } on PlatformException catch (e) {
      print("Error: ${e.message}");
      return [];
    }
  }

  Future<void> connectToDevice(String deviceId) async {
    try {
      await _channel.invokeMethod('connectToDevice', {'deviceId': deviceId});
    } on PlatformException catch (e) {
      print("Error: ${e.message}");
    }
  }
}
