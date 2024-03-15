import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stanfood/routes/app_pages.dart';
import 'constants/color_constant.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'NotoSansKR',
            appBarTheme: AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
                color: AppColor.blackText,
              ),
              titleTextStyle: TextStyle(color: AppColor.blackText),
            ),
          ),
          title: 'stanfood',
          getPages: AppPages.routes,
          initialRoute: AppPages.initial,
        );
      },
    );
  }
}
