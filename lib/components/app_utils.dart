import 'package:flutter/material.dart';

class AppUtil {
  static void showModalBottom({
    required BuildContext context,
    double? height,
    Widget? page,
  }) {
    Future future = showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
        ),
        builder: (BuildContext context) {
          return SizedBox(
            height: height,
            child: ClipRRect(borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)), child: page),
          );
        });
  }
}
