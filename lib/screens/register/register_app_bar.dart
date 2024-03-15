import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/color_constant.dart';
import '../../constants/style_constant.dart';
import '../../controllers/register/register_controller.dart';

class RegisterAppBar extends StatelessWidget {
  RegisterAppBar({super.key});

  final _registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145,
      child: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0XFFA8C3F8),
                Color(0XFFC9E8F9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        toolbarHeight: 100,

        // title: const ItdaRowAppBar(
        //   heroTag: 'profile_0',
        // ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(44),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TabBar(
                controller: _registerController.tabController,
                isScrollable: true,
                indicatorWeight: 2.0,
                indicatorColor: AppColor.blackText,
                labelColor: AppColor.blackText,
                unselectedLabelColor: AppColor.greyText,
                labelPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                tabs: [
                  _tabBarButton(title: '메인'),
                  _tabBarButton(title: '스탠'),
                  _tabBarButton(title: '식당'),
                  _tabBarButton(title: '방송'),
                  _tabBarButton(title: '먹방'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _tabBarButton({required String title}) {
    return SizedBox(
      width: 70.w,
      child: Center(
        child: Text(
          title,
          style: AppTextStyles.NN_subhead.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}