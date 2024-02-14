class BaseRemote {
  String brand;
  BaseRemote({required this.brand});
}

class InfraredRemote extends BaseRemote {
  String? power;
  String? one;
  String? mute;
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
  String? volumeMinus;
  String? up;
  String? down;
  String? left;
  String? right;
  String? exit;
  String? home;
  String? info;
  String? menu;

  InfraredRemote({
    required this.power,
    required this.one,
    required this.mute,
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
    required this.volumeMinus,
    required this.up,
    required this.down,
    required this.left,
    required this.right,
    required this.exit,
    required this.home,
    required this.info,
    required super.brand,
    required this.menu,
  });

  factory InfraredRemote.fromJson(Map<String, dynamic> json) {
    return InfraredRemote(
      power: json['power'],
      one: json['one'],
      mute: json['mute'],
      two: json['two'],
      three: json['three'],
      four: json['four'],
      five: json['five'],
      six: json['six'],
      seven: json['seven'],
      eight: json['eight'],
      nine: json['nine'],
      zero: json['zero'],
      enter: json['enter'],
      channelPlus: json['channelPlus'],
      channelMinus: json['channelMinus'],
      volumePlus: json['volumePlus'],
      volumeMinus: json['volumeMinus'],
      up: json['up'],
      down: json['down'],
      left: json['left'],
      right: json['right'],
      exit: json['exit'],
      home: json['home'],
      info: json['info'],
      brand: json['brand'],
      menu: json['menu'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'power': power,
      'one': one,
      'mute': mute,
      'two': two,
      'three': three,
      'four': four,
      'five': five,
      'six': six,
      'seven': seven,
      'eight': eight,
      'nine': nine,
      'zero': zero,
      'enter': enter,
      'channelPlus': channelPlus,
      'channelMinus': channelMinus,
      'volumePlus': volumePlus,
      'volumeMinus': volumeMinus,
      'up': up,
      'down': down,
      'left': left,
      'right': right,
      'exit': exit,
      'home': home,
      'info': info,
      'menu': menu,
    };
  }
}

class WifiRemote extends BaseRemote {
  String customName;
  String someWifiProperty;

  WifiRemote({
    required super.brand,
    required this.customName,
    required this.someWifiProperty,
  });

  factory WifiRemote.fromJson(Map<String, dynamic> json) {
    return WifiRemote(
      brand: json['brand'],
      customName: json['customName'],
      someWifiProperty: json['someWifiProperty'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brand': brand,
      'customName': customName,
      'someWifiProperty': someWifiProperty,
    };
  }
}
