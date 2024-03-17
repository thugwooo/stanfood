import 'package:stanfood/constants/enum_constant.dart';

class Broadcast {
  final BroadcastType type;
  final String icon;
  Broadcast({required this.type, required this.icon});

  factory Broadcast.fromJson(Map<String, dynamic> json) {
    return Broadcast(
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
