import 'package:remote_control/data_source/ir_remotes/acer.dart';
import 'package:remote_control/data_source/ir_remotes/admiral.dart';
import 'package:remote_control/data_source/ir_remotes/aiwa.dart';
import 'package:remote_control/data_source/ir_remotes/alba.dart';
import 'package:remote_control/data_source/ir_remotes/aoc.dart';
import 'package:remote_control/data_source/ir_remotes/apple.dart';
import 'package:remote_control/data_source/ir_remotes/arcelik.dart';
import 'package:remote_control/data_source/ir_remotes/asus.dart';
import 'package:remote_control/data_source/ir_remotes/daewoo.dart';
import 'package:remote_control/data_source/ir_remotes/dell.dart';
import 'package:remote_control/data_source/ir_remotes/lg.dart';
import 'package:remote_control/data_source/ir_remotes/samsung.dart';
import 'package:remote_control/data_source/ir_remotes/sony.dart';
import 'package:remote_control/model/brands.dart';

List<RemoteBrand> allIRRemoteBrands = [
  RemoteBrand(brandName: "Acer", infraredRemotes: [
    acerIRRemote1,
  ]),
  RemoteBrand(brandName: "AOC", infraredRemotes: [
    aocIRRemote1,
  ]),
  RemoteBrand(brandName: "Aiwa", infraredRemotes: [
    aiwaIRRemote1,
  ]),
  RemoteBrand(brandName: "Admiral", infraredRemotes: [
    admiralIRRemote1,
  ]),
  RemoteBrand(brandName: "Alba", infraredRemotes: [
    albaIRRemote1,
  ]),
  RemoteBrand(brandName: "Arcelik", infraredRemotes: [
    arcelikIRRemote1,
  ]),
  RemoteBrand(brandName: "Apple", infraredRemotes: [
    appleIRRemote1,
  ]),
  RemoteBrand(brandName: "Samsung", infraredRemotes: [
    samsungIRRemote1,
  ]),
  RemoteBrand(brandName: "LG", infraredRemotes: [
    lgIRRemote1,
  ]),
  RemoteBrand(brandName: "Sony", infraredRemotes: [
    sonyIRRemote1,
  ]),
  RemoteBrand(brandName: "Asus", infraredRemotes: [
    asusIRRemote1,
  ]),
  RemoteBrand(brandName: "Dell", infraredRemotes: [
    dellIRRemote1,
  ]),
  RemoteBrand(brandName: "Daewoo", infraredRemotes: [
    daewoIRRemote1,
  ]),
];
