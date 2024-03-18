import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/enum_constant.dart';

class RegisterController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxList<ChannelType> selectedChannelTypes = <ChannelType>[].obs;
  Rx<ChannelType> selectedChannelType = ChannelType.TV.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 5, vsync: this, initialIndex: 0);
  }

  void selectMultipleChannelTypes(ChannelType type) {
    if (selectedChannelTypes.contains(type)) {
      selectedChannelTypes.remove(type);
    } else {
      selectedChannelTypes.add(type);
    }
  }

  void selectSingleChannelType(ChannelType type) {
    selectedChannelType.value = type;
  }
}
