import '../../constants/enum_constant.dart';

class Channel {
  final ChannelType type;
  final String icon;
  Channel({required this.type, required this.icon});

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      type: json['type'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'icon': icon,
    };
  }
}
