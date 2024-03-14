import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remote_control/model/connectable_devices.dart';
import 'package:remote_control/wifi_remote/pairing_code_bottom_sheet.dart';

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

  Future<bool> sendPairingKey(String key) async {
    try {
      bool isKeySent = await _channel.invokeMethod("sendKey", {"key": key});
      return isKeySent;
    } catch (e) {
      return false;
    }
  }

  Future onPairingRequired(BuildContext context) async {
    try {
      _channel.setMethodCallHandler((call) async {
        if (call.method == "onPairingRequired") {
          pairingCodeBrandBottomSheet(context);
        }
      });
    } catch (e) {}
  }

  Future<List<ConnectableDeviceModel>> getAvailableDevices() async {
    try {
      List<dynamic> devices =
          await _channel.invokeMethod('getAvailableDevices');

      print("devices are : $devices");

      // Create a new list to store the converted devices
      List<Map<Object?, Object?>> deviceList = [];

      for (var item in devices) {
        Map<Object?, Object?> device = item;
        print("device item  ${device.runtimeType}");
        deviceList.add(device);
      }

      print("calling devices List $deviceList");

      List<ConnectableDeviceModel> convertMapListToConnectableDeviceList(
          List<Map<Object?, Object?>> mapList) {
        List<ConnectableDeviceModel> deviceModelList = [];

        for (var map in mapList) {
          deviceModelList.add(
              ConnectableDeviceModel.fromJson(map.cast<String, dynamic>()));
        }

        return deviceModelList;
      }

// Usage
      List<ConnectableDeviceModel> convertedList =
          convertMapListToConnectableDeviceList(deviceList);

      // Now you can work with the List<Object?> in Dart
      print(convertedList.length);
      return convertedList;
    } on PlatformException catch (e) {
      print("Error: ${e.message}");
      // Handle the error as needed
      return []; // Return an empty list or handle the error in a different way
    }
  }

  Future<bool> connectToDevice(String deviceId) async {
    try {
      var isConnected = await _channel
          .invokeMethod('connectToDevice', {'deviceId': deviceId});

      print("devices is connected $isConnected");
      return isConnected;
    } catch (e) {
      return false;
    }
  }

  Future<bool> sendTVCommand({required String command}) async {
    try {
      bool isCommandSent =
          await _channel.invokeMethod('sendTVCommand', {'command': command});
      return isCommandSent;
    } catch (e) {
      print('Error invoking powerOn method: $e');
      return false;
    }
  }
}

ConnectSdkMethodChannel connectSdkMethodChannel = ConnectSdkMethodChannel();
