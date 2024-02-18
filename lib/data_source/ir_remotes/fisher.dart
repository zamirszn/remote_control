import 'package:remote_control/model/remote_model.dart';

InfraredRemote fisherIRRemote1 = InfraredRemote(
  channelMinus:
      "0000 006D 0022 0002 0156 00AB 0015 0015 0016 0015 0016 0015 0016 003F 0016 003F 0016 003F 0016 0015 0015 0015 0016 003F 0016 003F 0016 003F 0016 0015 0016 0015 0015 0015 0016 003F 0016 003F 0016 003F 0016 003F 0016 0015 0016 003F 0016 0015 0015 0015 0016 0015 0016 0015 0016 0015 0015 0015 0016 003F 0016 0015 0016 003F 0016 003F 0016 003F 0016 003F 0016 05F7 0155 0055 0015 0E44",
  channelPlus:
      "0000 006D 0022 0002 0156 00AB 0016 0015 0015 0015 0016 0015 0016 003F 0016 003F 0016 003F 0016 0015 0015 0015 0016 003F 0016 003F 0016 003F 0016 0015 0016 0015 0016 0015 0015 0040 0015 0040 0015 0015 0016 003F 0016 0015 0016 003F 0016 0015 0015 0015 0016 0015 0016 0015 0015 0040 0015 0015 0016 003F 0016 0015 0016 003F 0016 003F 0016 003F 0016 003F 0016 05F7 0156 0055 0015 05F7",
  down:
      "0000 006D 0022 0002 0156 00AB 0016 0015 0015 0016 0015 0015 0016 003F 0016 003F 0016 003F 0016 0015 0016 0015 0015 0040 0015 0040 0015 0040 0015 0015 0016 0015 0016 0015 0015 0040 0015 0040 0015 0040 0015 0040 0015 0040 0015 0040 0015 0015 0016 0015 0016 003F 0016 0015 0015 0015 0016 0015 0016 0015 0016 0015 0015 0040 0015 0040 0015 0015 0016 003F 0016 05F8 0156 0055 0015 0E48",
  enter:
      "0000 006D 0022 0002 0156 00AB 0016 0015 0016 0015 0015 0015 0016 003F 0016 003F 0016 003F 0016 0015 0016 0015 0015 0040 0015 0040 0015 0040 0015 0015 0016 0015 0016 0015 0015 0040 0015 0040 0015 0015 0016 0015 0016 003F 0016 0015 0015 0040 0015 0016 0015 0040 0015 0015 0016 003F 0016 003F 0016 0015 0016 003F 0016 0015 0015 0040 0015 0015 0016 003F 0016 05F8 0156 0055 0015 0E47",
  left:
      "0000 006D 0022 0002 0156 00AB 0016 0015 0016 0015 0015 0015 0016 003F 0016 003F 0016 003F 0016 0015 0016 0015 0015 0040 0015 0040 0015 0040 0015 0015 0016 0015 0016 0015 0015 0040 0015 0040 0015 0040 0015 0040 0015 0040 0015 0040 0015 0040 0015 0015 0016 0015 0016 0015 0015 0016 0015 0015 0016 0015 0016 0015 0015 0015 0016 003F 0016 003F 0016 003F 0016 05F8 0156 0055 0015 0E47",
  right:
      "0000 006D 0022 0002 0156 00AB 0016 0015 0016 0015 0015 0015 0016 003F 0016 003F 0016 003F 0016 0015 0016 0015 0015 0040 0015 0040 0015 0040 0015 0015 0016 0015 0016 0015 0015 0040 0015 0040 0015 0015 0016 003F 0016 003F 0016 003F 0016 003F 0016 0015 0016 0015 0015 0015 0016 003F 0016 0015 0016 0015 0016 0015 0015 0015 0016 003F 0016 003F 0016 003F 0016 05F8 0156 0055 0015 0E48",
  up: "0000 006D 0022 0002 0156 00AB 0016 0015 0015 0015 0016 0015 0016 003F 0016 003F 0016 003F 0016 0015 0016 0015 0015 0040 0015 0040 0015 0040 0015 0015 0016 0015 0016 0015 0015 0040 0015 0040 0015 0015 0016 003F 0016 003F 0016 003F 0016 0015 0016 0015 0015 0040 0015 0015 0016 003F 0016 0015 0016 0015 0015 0016 0015 0040 0015 0040 0015 0015 0016 003F 0016 05F8 0156 0055 0015 0E48",
  zero:
      "0000 006D 0022 0002 0157 00AC 0015 0015 0016 0015 0016 0015 0015 0040 0015 0041 0015 0040 0015 0016 0015 0015 0016 003F 0016 003F 0016 003F 0016 0015 0016 0015 0015 0015 0016 003F 0016 003F 0016 0015 0016 0015 0015 0015 0016 0015 0016 0015 0015 0016 0015 0015 0016 0015 0016 003F 0016 003F 0016 0040 0016 003F 0016 003F 0016 003F 0016 003F 0016 003F 0016 05F9 0156 0055 0016 05F9",
  one:
      "0000 006D 0022 0002 0155 00AB 0016 0015 0016 0015 0015 0015 0016 003F 0016 003F 0016 003F 0016 0015 0016 0015 0015 0040 0015 0040 0015 0040 0015 0015 0016 0015 0016 0015 0016 003F 0016 003F 0016 003F 0016 0015 0015 0015 0016 0015 0016 0015 0015 0015 0016 0015 0016 0015 0015 0015 0016 003F 0016 003F 0016 003F 0016 003F 0016 003F 0016 003F 0016 003F 0016 05F7 0156 0055 0016 05F7",
  two:
      "0000 006D 0022 0002 0156 00AB 0016 0015 0016 0015 0015 0016 0015 0040 0015 0040 0015 003F 0016 0015 0016 0015 0016 003F 0016 003F 0016 003F 0016 0015 0015 0015 0016 0015 0016 003F 0016 003F 0016 0015 0015 0040 0015 0015 0016 0015 0016 0015 0015 0015 0016 0015 0016 0015 0016 003F 0016 0015 0015 0040 0015 0040 0015 0040 0015 0040 0015 0040 0015 0040 0015 05F9 0157 0055 0016 05F9",
  three:
      "0000 006D 0022 0002 0156 00AC 0015 0015 0016 0015 0016 0015 0015 0040 0015 0040 0015 0040 0015 0015 0016 0015 0016 003F 0016 003F 0016 003F 0016 0015 0015 0015 0016 0015 0016 003F 0016 003F 0016 003F 0016 003F 0016 0015 0015 0015 0016 0015 0016 0015 0016 0015 0015 0015 0016 0015 0016 0015 0015 0040 0015 0040 0015 0040 0015 0040 0015 0040 0015 0040 0015 05FA 0156 0055 0016 05FA",
  four:
      "0000 006D 0022 0002 0155 00AB 0016 0015 0016 0015 0015 0015 0016 003F 0016 003F 0016 003F 0016 0015 0016 0015 0015 0040 0015 0040 0015 0040 0015 0015 0016 0015 0016 0015 0015 0040 0015 0040 0015 0015 0016 0015 0016 003F 0016 0015 0016 0015 0015 0015 0016 0015 0016 0015 0015 0040 0015 0040 0015 0015 0016 003F 0016 003F 0016 003F 0016 003F 0016 003F 0016 05F6 0156 0055 0015 05F6",
  five:
      "0000 006D 0022 0002 0155 00AB 0016 0015 0015 0016 0015 0015 0016 003F 0016 003F 0016 003F 0016 0015 0016 0015 0015 0040 0015 0040 0015 0040 0015 0015 0016 0015 0016 0015 0015 0040 0015 0040 0015 0040 0015 0015 0016 003F 0016 0015 0016 0015 0015 0015 0016 0015 0016 0015 0016 0015 0015 0040 0015 0015 0016 003F 0016 003F 0016 003F 0016 003F 0016 003F 0016 05F6 0156 0055 0015 05F6",
  six:
      "0000 006D 0022 0002 0156 00AB 0016 0015 0015 0015 0016 0015 0016 003F 0016 003F 0016 003F 0016 0015 0015 0015 0016 003F 0016 003F 0016 003F 0016 0015 0016 0015 0016 0015 0015 0040 0015 0040 0015 0015 0016 003F 0016 003F 0016 0015 0016 0015 0015 0015 0016 0015 0016 0015 0015 0040 0015 0015 0016 0015 0016 003F 0016 003F 0016 003F 0016 003F 0016 003F 0016 05F6 0156 0055 0015 05F6",
  seven:
      "0000 006D 0022 0002 0156 00AB 0015 0015 0016 0015 0016 0015 0016 003F 0016 003F 0016 003F 0016 0015 0015 0015 0016 003F 0016 003F 0016 003F 0016 0015 0016 0015 0015 0015 0016 003F 0016 003F 0016 003F 0016 003F 0016 003F 0016 0015 0016 0015 0015 0015 0016 0015 0016 0015 0015 0016 0015 0015 0016 0015 0016 003F 0016 003F 0016 003F 0016 003F 0016 003F 0016 05F7 0155 0055 0016 05F7",
  eight:
      "0000 006D 0022 0002 0156 00AB 0016 0015 0015 0015 0016 0015 0016 003F 0016 003F 0016 003F 0016 0015 0015 0015 0016 003F 0016 003F 0016 003F 0016 0015 0016 0015 0015 0015 0016 003F 0016 003F 0016 0015 0016 0015 0016 0015 0015 0040 0015 0015 0016 0015 0016 0015 0015 0015 0016 003F 0016 003F 0016 003F 0016 0015 0016 003F 0016 003F 0016 003F 0016 003F 0016 05F6 0155 0055 0016 05F6",
  nine:
      "0000 006D 0022 0002 0157 00AB 0015 0015 0016 0015 0016 0015 0015 0040 0015 0040 0015 0040 0015 0015 0016 0015 0016 003F 0016 003F 0016 003F 0016 0015 0015 0015 0016 0015 0016 003F 0016 003F 0016 003F 0016 0015 0016 0015 0015 0040 0015 0015 0016 0015 0016 0015 0015 0015 0016 0015 0016 003F 0016 003F 0016 0015 0015 0040 0015 0040 0015 0040 0015 0040 0015 05FB 0156 0055 0016 05FB",
  exit:
      "0000 006D 0022 0002 0156 00AB 0016 0015 0015 0015 0016 0015 0016 003F 0016 003F 0016 003F 0016 0015 0016 0015 0015 0040 0015 0040 0015 0040 0015 0015 0016 0015 0016 0015 0015 0040 0015 0040 0015 0040 0015 0040 0015 0015 0016 0015 0016 003F 0016 0015 0015 0040 0015 0015 0016 0015 0016 0015 0015 0040 0015 0040 0015 0016 0015 0040 0015 0015 0016 003F 0016 05F8 0156 0055 0015 0E47",
  info:
      "0000 006D 0022 0002 0156 00AB 0016 0015 0016 0015 0016 0015 0015 0040 0015 0040 0015 0040 0015 0015 0016 0015 0016 003F 0016 003F 0016 003F 0016 0015 0015 0015 0016 0015 0016 003F 0016 003F 0016 0015 0015 0015 0016 003F 0016 003F 0016 0015 0016 0015 0016 0015 0015 0015 0016 003F 0016 003F 0016 0015 0016 0015 0015 0040 0015 0040 0015 0040 0015 0040 0015 05FA 0156 0055 0016 0E45",
  menu:
      "0000 006D 0022 0002 0157 00AB 0015 0015 0016 0015 0016 0015 0015 0040 0015 0040 0015 0040 0015 0015 0016 0015 0016 003F 0016 003F 0016 003F 0016 0015 0015 0016 0015 0015 0016 003F 0016 003F 0016 003F 0016 003F 0016 003F 0016 0015 0016 003F 0016 0015 0015 0015 0016 0015 0016 0015 0015 0015 0016 0015 0016 003F 0016 0015 0015 0040 0015 0040 0015 0040 0015 05FA 0156 0055 0015 0E48",
  mute:
      "0000 006E 0022 0002 0155 00AA 0015 0016 0015 0015 0016 0015 0016 003F 0016 003F 0016 003F 0016 0015 0015 0015 0016 003F 0016 003F 0016 003F 0016 0015 0016 0015 0015 0015 0016 003F 0016 003F 0016 0015 0016 0015 0015 0016 0015 0040 0015 003F 0016 0015 0016 0015 0016 0015 0015 0040 0015 0040 0015 0040 0015 0015 0016 0015 0016 003F 0016 003F 0016 003F 0016 05F1 0154 0055 0015 0E38",
  power:
      "0000 006D 0022 0002 0157 00AB 0015 0016 0015 0015 0016 0015 0016 003F 0016 003F 0016 003F 0016 0015 0015 0015 0016 003F 0016 003F 0016 003F 0016 0015 0016 0015 0015 0015 0016 003F 0016 003F 0016 0015 0016 003F 0016 0015 0015 0015 0016 003F 0016 0015 0016 0015 0016 0015 0015 0040 0015 0015 0016 003F 0016 003F 0016 0015 0016 003F 0016 003F 0016 003F 0016 05F8 0156 0055 0016 05F8",
  volumeMinus:
      "0000 006D 0022 0002 0157 00AB 0015 0015 0016 0015 0016 0015 0015 0040 0015 0040 0015 0040 0015 0015 0016 0015 0016 003F 0016 003F 0016 003F 0016 0015 0015 0015 0016 0015 0016 003F 0016 003F 0016 003F 0016 003F 0016 003F 0016 003F 0016 0015 0015 0016 0015 0015 0016 0015 0016 0015 0015 0015 0016 0015 0016 0015 0015 0040 0015 0040 0015 0040 0015 0040 0015 05FB 0156 0055 0016 05FB",
  volumePlus:
      "0000 006D 0022 0002 0157 00AB 0015 0015 0016 0015 0016 0015 0015 0040 0015 0040 0015 0040 0015 0015 0016 0015 0016 003F 0016 003F 0016 003F 0016 0015 0016 0015 0015 0015 0016 003F 0016 003F 0016 0015 0016 003F 0016 003F 0016 003F 0016 0015 0015 0015 0016 0015 0016 0015 0015 0040 0015 0015 0016 0015 0016 0015 0016 003F 0016 003F 0015 0040 0015 0040 0015 05F9 0156 0055 0016 05F9",
  home: null,
);
