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
import 'package:remote_control/data_source/ir_remotes/durabrand.dart';
import 'package:remote_control/data_source/ir_remotes/element_.dart';
import 'package:remote_control/data_source/ir_remotes/epson.dart';
import 'package:remote_control/data_source/ir_remotes/finlux.dart';
import 'package:remote_control/data_source/ir_remotes/fisher.dart';
import 'package:remote_control/data_source/ir_remotes/fujitsu.dart';
import 'package:remote_control/data_source/ir_remotes/geniatech.dart';
import 'package:remote_control/data_source/ir_remotes/goldstar.dart';
import 'package:remote_control/data_source/ir_remotes/haier.dart';
import 'package:remote_control/data_source/ir_remotes/hitachi.dart';
import 'package:remote_control/data_source/ir_remotes/hp.dart';
import 'package:remote_control/data_source/ir_remotes/humax.dart';
import 'package:remote_control/data_source/ir_remotes/lg.dart';
import 'package:remote_control/data_source/ir_remotes/panasonic.dart';
import 'package:remote_control/data_source/ir_remotes/philco.dart';
import 'package:remote_control/data_source/ir_remotes/philips.dart';
import 'package:remote_control/data_source/ir_remotes/pioneer.dart';
import 'package:remote_control/data_source/ir_remotes/polaroid.dart';
import 'package:remote_control/data_source/ir_remotes/samsung.dart';
import 'package:remote_control/data_source/ir_remotes/shavaki.dart';
import 'package:remote_control/data_source/ir_remotes/sony.dart';
import 'package:remote_control/data_source/ir_remotes/zenith.dart';
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
  RemoteBrand(brandName: "Panasonic", infraredRemotes: [
    panasonicIRRemote1,
  ]),
  RemoteBrand(brandName: "Philco", infraredRemotes: [
    philcoIRRemote1,
  ]),
  RemoteBrand(brandName: "Philips", infraredRemotes: [
    philipsIRRemote1,
  ]),
  RemoteBrand(brandName: "Pioneer", infraredRemotes: [
    pioneerIRRemote1,
  ]),
  RemoteBrand(brandName: "Polaroid", infraredRemotes: [
    polaroidIRRemote1,
  ]),
  RemoteBrand(brandName: "Shavaki", infraredRemotes: [
    shavakiIRRemote1,
  ]),
  RemoteBrand(brandName: "DuraBand", infraredRemotes: [
    duraBrandIRRemote1,
  ]),
  RemoteBrand(brandName: "Element", infraredRemotes: [
    elementIRRemote1,
  ]),
  RemoteBrand(brandName: "Epson", infraredRemotes: [
    epsonIRRemote1,
  ]),
  RemoteBrand(brandName: "Finlux", infraredRemotes: [
    finLuxIRRemote1,
  ]),
  RemoteBrand(brandName: "Fisher", infraredRemotes: [
    fisherIRRemote1,
  ]),
  RemoteBrand(brandName: "Fujitsu", infraredRemotes: [
    fujitsuIRRemote1,
  ]),
  RemoteBrand(brandName: "Geniatech", infraredRemotes: [
    geniatechIRRemote1,
  ]),
  RemoteBrand(brandName: "Gold Star", infraredRemotes: [
    goldStarIRRemote1,
  ]),
  RemoteBrand(brandName: "Haier", infraredRemotes: [
    haierIRRemote1,
  ]),
  RemoteBrand(brandName: "Hitachi", infraredRemotes: [
    hitachiIRRemote1,
  ]),
  RemoteBrand(brandName: "HP", infraredRemotes: [
    hpIRRemote1,
  ]),
  RemoteBrand(brandName: "Humax", infraredRemotes: [
    humaxIRRemote1,
  ]),
  RemoteBrand(brandName: "Zenith", infraredRemotes: [
    zenithIRRemote1,
  ]),
];
