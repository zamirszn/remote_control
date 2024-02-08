// TvRemote samsungRemote = TvRemote(remoteName: 'Samsung', power:"", one: '', mute: '', two: '', three: '', four: '', five: '', six: '', seven: '', eight: '', nine: '', zero: '', enter: '', channelPlus: '', channelMinus: '', volumePlus: '', volumnMinus: '', menu: '', up: '', down: '', left: '', right: '', exit: '',);

class IrTvRemote {
  String? remoteName;
  String? power;
  String? one;
  String? two;
  String? three;
  String? four;
  String? five;
  String? six;
  String? seven;
  String? eight;
  String? nine;
  String? zero;
  String? enter;
  String? channelPlus;
  String? channelMinus;
  String? volumePlus;
  String? volumnMinus;
  String? menu;
  String? up;
  String? down;
  String? left;
  String? right;
  String? mute;
  String? exit;
  String? home;
  String? info;

  IrTvRemote({
    required this.remoteName,
    required this.power,
    required this.one,
    required this.two,
    required this.three,
    required this.four,
    required this.five,
    required this.six,
    required this.seven,
    required this.eight,
    required this.nine,
    required this.zero,
    required this.enter,
    required this.channelPlus,
    required this.channelMinus,
    required this.volumePlus,
    required this.volumnMinus,
    required this.menu,
    required this.up,
    required this.down,
    required this.left,
    required this.right,
    required this.mute,
    required this.exit,
    required this.home,
    required this.info,
  });
}

class MyTvRemote {
  const MyTvRemote({
    required this.remoteName,
    required this.remoteNickName,
    required this.remoteImage,
  });
  final String remoteName;
  final String remoteNickName;
  final String remoteImage;
}

class SmartTvRemote {}
