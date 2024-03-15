import 'package:flutter/material.dart';

class AppColor {
  static Color get primary => Color.fromRGBO(254, 205, 73, 1);
  static Color get primary2 => Color.fromRGBO(254, 241, 207, 1);

  static Color get whiteText => const Color(0XFFFFFFFF);
  static Color get blackText => const Color(0XFF292D32);
  static Color get greyText => const Color(0X993C3C43);

  static const lightSeparatorNonThickColor = Color(0xFFD6D7D9);
  static const darkSeparatorNonThickColor = Color(0xFF363638);

  static const lightSubIconColor = Color(0xFF09CCBA);
  static const darkSubIconColor = Color(0xFF09CCBA);

  static final lightLabelSecondaryColor = const Color(0xFF3C3C43).withOpacity(.6);
  static final darkLabelSecondaryColor = const Color(0xFFEBEBF5).withOpacity(.6);

  static Color get subIconColor {
    return ThemeData.dark().brightness == Brightness.dark ? darkSubIconColor : lightSubIconColor;
  }
}

class AppGradients {
  static const Gradient gradientHealthy = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0XFF96DEDA), Color(0XFF50C9C3)],
  );
}
