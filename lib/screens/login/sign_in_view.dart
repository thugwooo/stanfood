import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stanfood/constants/color_constant.dart';
import 'package:stanfood/controllers/screen_controller.dart';

import '../../components/style.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});
  final screen_controller = Get.put(Screen_Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: AppColor.primary2),
          Positioned(
            left: -145.w,
            top: 315.h,
            child: Container(
              width: 720.w,
              height: 720.h,
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(360.w),
              ),
            ),
          ),
          _login_form(),
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
    );
  }

  Column _login_form() {
    return Column(
      children: [
        SizedBox(height: 80.h),
        _login_header(),
        SizedBox(height: 40.h),
        _login_container(),
        SizedBox(height: 10.h),
      ],
    );
  }

  Container _login_container() {
    return Container(
      width: 365.w,
      height: 343.h,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
      child: Column(
        children: [
          SizedBox(height: 25.h),
          _custom_textform_field(hint_text: '아이디를 입력하십시오.', icon: Icons.person),
          SizedBox(height: 25.h),
          _custom_textform_field(hint_text: '비밀번호를 입력하십시오.', icon: Icons.key),
          SizedBox(height: 25.h),
          Container(
            child: Row(
              children: [
                SizedBox(width: 25.w),
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 20.w,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 10.w),
                    Text('자동 로그인'),
                  ],
                ),
                SizedBox(width: 25.w),
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 20.w,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 10.w),
                    Text('아이디 저장'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            width: 316.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('아이디 찾기'),
                Text(' / '),
                Text('비밀번호 찾기'),
                Text(' / '),
                Text('회원가입'),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            width: 316.w,
            height: 58.h,
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: Center(
                child: Text(
              '로그인',
              style: TextStyle(fontSize: 24.sp),
            )),
          )
        ],
      ),
    );
  }

  Column _login_header() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.arrow_back_ios),
              Text('로그인', style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w500)),
              Icon(Icons.arrow_back_ios, color: AppColor.primary2),
            ],
          ),
        ),
        SizedBox(height: 25.h),
        Image.asset('assets/icons/Logo.png', width: 376.w),
      ],
    );
  }

  Widget _custom_textform_field({hint_text, icon}) {
    return Container(
      width: 316.w,
      height: 58.h,
      decoration: _login_deco(),
      child: Row(
        children: [
          SizedBox(width: 20.w),
          Icon(icon, size: 26.w),
          SizedBox(width: 10.w),
          Container(width: 1.w, height: 28.h, color: Colors.grey),
          SizedBox(width: 10.w),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                // helperText: '아이디를 입력하십시오.',
                hintText: hint_text,
                hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Icon(Icons.cancel, color: Colors.grey),
          SizedBox(width: 10.w),
        ],
      ),
    );
  }

  BoxDecoration _login_deco() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8.w),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(163, 159, 159, 1),
          blurRadius: 5.0.w,
          offset: Offset(0, 3.h),
        )
      ],
    );
  }
}
