import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stanfood/constants/enum_constant.dart';

class RegisterController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  Rx<JobType> jobType = JobType.Youtuber.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 5, vsync: this, initialIndex: 0);
  }
}
