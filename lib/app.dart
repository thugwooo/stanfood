import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stanfood/controllers/app_controller.dart';
import 'package:stanfood/screens/home/home_view.dart';
import 'package:stanfood/screens/maps/maps_view.dart';
import 'package:stanfood/screens/register/register_view.dart';

import 'constants/color_constant.dart';

class App extends GetView<AppController> {
  App({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: IndexedStack(
            index: controller.pageIndex.value,
            children: [
              HomeView(),
              MapsView(),
              RegisterView(),
            ],
          ),
          bottomNavigationBar: WillPopScope(
            onWillPop: controller.willPopupFunction,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: controller.backgroundColor.value,
              selectedItemColor: AppColor.primary,
              unselectedItemColor: controller.unSelectedIconColor.value,
              selectedFontSize: 10.0,
              unselectedFontSize: 10.0,
              selectedLabelStyle: TextStyle(color: AppColor.primary2),
              unselectedLabelStyle: TextStyle(color: controller.unSelectedIconColor.value),
              currentIndex: controller.pageIndex.value,
              onTap: (int index) {
                controller.changePage(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: Icon(Icons.home),
                  ),
                  label: '홈',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: Icon(Icons.map),
                  ),
                  label: '지도',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: Icon(Icons.add_circle),
                  ),
                  label: '등록',
                ),
              ],
            ),
          ),
        ));
  }
}
