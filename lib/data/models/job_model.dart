import 'package:stanfood/constants/enum_constant.dart';

class Job {
  final JobType type;
  final String icon;
  Job({required this.type, required this.icon});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
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
