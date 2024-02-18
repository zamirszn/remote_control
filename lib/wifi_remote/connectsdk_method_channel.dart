import 'dart:async';
import 'package:flutter/services.dart';
import 'package:remote_control/model/connectable_devices.dart';

class ConnectSdkMethodChannel {
  static const MethodChannel _channel =
      MethodChannel('connectsdkMethodChannel');

  Future<void> initialize() async {
    try {
      bool isInitialized = await _channel.invokeMethod('initialize');
      print(isInitialized);
    } catch (e) {
      print('Error connecting to device: $e');
    }
  }


  Future<void> onPairingRequired()async{
    
  }

  Future<List<ConnectableDeviceModel>> getAvailableDevices() async {
    try {
      final List<dynamic> devices =
          await _channel.invokeMethod('getAvailableDevices');

      // List<ConnectableDeviceModel> devices = [
      //   ConnectableDeviceModel(
      //     friendlyName: "KD-49X88308C",
      //     id: "9223372036854775807",
      //     modelName: "BRAVIA 4K 2015",
      //     ipAddress: "192.168.1.171",
      //   ),
      // ];

      // return devices;
      return devices
          .map((device) => ConnectableDeviceModel.fromJson(device))
          .toList();
    } on PlatformException catch (e) {
      print("Error: ${e.message}");
      return [];
    }
  }

  Future<bool> connectToDevice(String deviceId) async {
    try {
      bool isConnected = await _channel
          .invokeMethod('connectToDevice', {'deviceId': deviceId});
      return isConnected;
    }  catch (e) {
      return false;
    }
  }
}
