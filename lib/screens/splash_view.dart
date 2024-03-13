import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stanfood/controllers/screen_controller.dart';
import '../components/style.dart';
import '../constants/color_constant.dart';
import '../routes/app_routes.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});
  final screen_controller = Get.put(Screen_Controller());
  final animated_time = 1500;
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 100)).then((value) {
      screen_controller.set_splash();
    });

    return Scaffold(
      body: Obx(
        () => InkWell(
          child: Stack(
            children: [
              Container(
                color: AppColor().primary2,
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: animated_time),
                left: -145.w,
                top: screen_controller.splash.value ? 456.h : height,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: animated_time),
                  width: 720.w,
                  height: 720.h,
                  decoration: BoxDecoration(
                    color: AppColor().primary,
                    borderRadius: BorderRadius.circular(360.w),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: animated_time),
                left: screen_controller.splash.value ? 46.w : width / 2,
                top: 400.h,
                child: Transform.rotate(
                  angle: -6 * pi / 180,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: animated_time),
                    width: screen_controller.splash.value ? 330.w : 0.w,
                    // width: 330.w,
                    child: Image.asset(
                      'assets/icons/Logo.png',
                      width: 330.w,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 83.w,
                top: 909.h,
                child: Text(
                  'Copyright (C) 2023. STANFood. All Right Reserved',
                  style: TextStyle(
                    fontSize: 11.sp,
                  ),
                ),
              ),
            ],
          ),
          onTap: () {
            Get.toNamed(Routes.app);
          },
        ),
      ),
    );
  }
}
