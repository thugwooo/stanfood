import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stanfood/constants/enum_constant.dart';

class RegisterController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxList<JobType> jobType = <JobType>[].obs;
  RxList<BroadcastType> broadcastType = <BroadcastType>[].obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 5, vsync: this, initialIndex: 0);
  }

  void selectJobType(JobType type) {
    if (jobType.contains(type)) {
      jobType.remove(type);
    } else {
      jobType.add(type);
    }
  }

  void selectBroadcastType(BroadcastType type) {
    if (broadcastType.contains(type)) {
      broadcastType.remove(type);
    } else {
      broadcastType.add(type);
    }
  }
}
