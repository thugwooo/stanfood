import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:stanfood/constants/color_constant.dart';

enum Page { HOME, MARKET, SEARCH, INBOX, MYPAGE }

class AppController extends GetxController {
  AppController get to => Get.find();
  RxInt pageIndex = 0.obs;
  List<int> pageHistory = [0];

  Rx<Color> backgroundColor = (AppColor.whiteText).obs;

  Rx<Color> unSelectedIconColor = (AppColor.blackText).obs;
  Rx<Color> unSelectedTextColor = (AppColor.blackText).obs;

  DateTime? backbuttonpressedTime;

  void resetPageIndex(int index) {
    pageIndex(index);
  }

  Future<bool> willPopupFunction() async {
    if (pageHistory.length == 1) {
      DateTime currentTime = DateTime.now();

      bool backButton = backbuttonpressedTime == null || currentTime.difference(backbuttonpressedTime!) > const Duration(seconds: 1);

      if (backButton) {
        backbuttonpressedTime = currentTime;
        Fluttertoast.showToast(
          msg: "뒤로 버튼을 한번 더 누르시면 종료 됩니다.",
          backgroundColor: AppColor.blackText.withOpacity(0.5),
          textColor: AppColor.whiteText,
          toastLength: Toast.LENGTH_SHORT,
        );
        return false;
      }
      return true;
    } else {
      changePage(0);
      pageHistory = [0];
      return false;
    }
  }

  void setWhiteTheme() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark, systemNavigationBarColor: AppColor.whiteText),
    );
    backgroundColor(AppColor.whiteText);

    unSelectedIconColor(AppColor.blackText);
    unSelectedTextColor(AppColor.blackText);
  }

  void setDartTheme() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light, systemNavigationBarColor: AppColor.blackText),
    );
    backgroundColor(AppColor.blackText);

    unSelectedIconColor(AppColor.whiteText);
    unSelectedTextColor(AppColor.whiteText);
  }

  void changePage(index) {
    var page = Page.values[index];

    switch (page) {
      case Page.HOME:
        setWhiteTheme();
        break;
      case Page.MARKET:
        setWhiteTheme();
        break;
      case Page.SEARCH:
        setWhiteTheme();
        break;
      case Page.INBOX:
        setDartTheme();
        break;
      case Page.MYPAGE:
        setWhiteTheme();
        break;
    }
    changePageIndex(index);
  }

  void changePageIndex(int index) {
    pageIndex(index);
    pageHistory.add(index);
  }

  Color getSelectedMenuColor(int index) => pageIndex.value == index ? AppColor().primary : unSelectedIconColor.value;
}
