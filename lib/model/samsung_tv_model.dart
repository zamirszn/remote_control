import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:remote_control/global.dart';
import 'package:remote_control/wifi_remote/samsung/samsung_key_code.dart';
import 'package:upnp2/upnp.dart';
import 'package:web_socket_channel/io.dart';

const int kConnectionTimeout = 60;
const kKeyDelay = 200;
const kWakeOnLanDelay = 5000;
const kUpnpTimeout = 1000;

class SamsungTVModel {
  final List<Map<String, dynamic>> services;
  final String? host;
  final String? mac;
  final String? api;
  final String? wsapi;
  bool isConnected = false;
  String? token;
  dynamic info;
  IOWebSocketChannel? ws;
  final Timer? timer;

  SamsungTVModel(
      {this.host, this.mac, this.token, this.info, this.ws, this.timer})
      : api = "http://$host:8001/api/v2/",
        wsapi = "wss://$host:8002/api/v2/",
        services = [];

  addService(service) {
    services.add(service);
  }

  connect({appName = 'DartSamsungSmartTVDriver'}) async {
    var completer = Completer();

    if (isConnected) {
      return;
    }

    // // make sure to turn on TV in case it is turned off
    // if (mac != null) {
    //   await this.wol(this.mac);
    // }

    // get device info
    info = await getDeviceInfo();

    // establish socket connection
    final appNameBase64 = base64.encode(utf8.encode(appName));
    String channel =
        "${wsapi}channels/samsung.remote.control?name=$appNameBase64";
    if (token != null) {
      channel += '&token=$token';
    }

    // log.info(`Connect to ${channel}`)
    // ws = IOWebSocketChannel.connect(channel);
    ws = IOWebSocketChannel.connect(
      channel,
    );
    // badCertificateCallback: (X509Certificate cert, String host, int port) =>true);

    ws?.stream.listen((message) {
      // timer?.cancel();

      Map<String, dynamic> data;
      try {
        data = json.decode(message);
      } catch (e) {
        throw ('Could not parse TV response $message');
      }

      if (data["data"] != null && data["data"]["token"] != null) {
        token = data["data"]["token"];
      }

      if (data["event"] != 'ms.channel.connect') {
        print('TV responded with $data');

        // throw ('Unable to connect to TV');
      }

      print('Connection successfully established');
      isConnected = true;
      completer.complete();

      // timer = Timer(Duration(seconds: kConnectionTimeout), () {
      //   throw ('Unable to connect to TV: timeout');
      // });

      // ws.sink.add("received!");
    });

    return completer.future;
  }

  // request TV info like udid or model name

  Future<http.Response> getDeviceInfo() async {
    print("Get device info from $api");
    return http.get(Uri.parse(api!));
  }

  // disconnect from device

  disconnect() {
    // ws.sink.close(status.goingAway);
    ws?.sink.close();
  }

  sendKey(samsungKeyCodes key) async {
    vibrateOnPress();
    if (!isConnected) {
      throw ('Not connected to device. Call `tv.connect()` first!');
    }

    print("Send key command  ${key.toString().split('.').last}");
    final data = json.encode({
      "method": 'ms.remote.control',
      "params": {
        "Cmd": 'Click',
        "DataOfCmd": key.toString().split('.').last,
        "Option": false,
        "TypeOfRemote": 'SendRemoteKey',
      }
    });

    ws?.sink.add(data);

    // add a delay so TV has time to execute
    Timer(const Duration(seconds: kConnectionTimeout), () {
      throw ('Unable to connect to TV: timeout');
    });

    return Future.delayed(const Duration(milliseconds: kKeyDelay));
  }

  //static method to discover Samsung Smart TVs in the network using the UPNP protocol

  static discover() async {
    var completer = Completer();

    final client = DeviceDiscoverer();
    final List<SamsungTVModel?> tvs = [];

    await client.start(ipv6: false);

    client.quickDiscoverClients().listen((client) async {
      RegExp re = RegExp(r'^.*?Samsung.+UPnP.+SDK\/1\.0$');

      //ignore other devices
      if (!re.hasMatch(client.server!)) {
        return;
      }
      try {
        final device = await client.getDevice();

        Uri location = Uri.parse(client.location!);

        final deviceExists = tvs.firstWhere((tv) => tv?.host == location.host,
            orElse: () => null);

        if (deviceExists == null) {
          print("Found ${device?.friendlyName} on IP ${location.host}");
          final tv = SamsungTVModel(host: location.host);
          tv.addService({
            "location": client.location,
            "server": client.server,
            "st": client.st,
            "usn": client.usn
          });
          tvs.add(tv);
        }
      } catch (e, stack) {
        print("ERROR: $e - ${client.location}");
        print(stack);
      }
    }).onDone(() {
      if (tvs.isEmpty) {
        completer.completeError(
            "No Samsung TVs found. Make sure the UPNP protocol is enabled in your network.");
      }
      completer.complete(tvs.first);
    });

    return completer.future;
  }
}
