import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageData extends StatelessWidget {
  final String icon;
  final double? width;
  final Color? color;
  const ImageData({
    super.key,
    required this.icon,
    this.width = 20.0,
    this.color,
    // this.color = const Color(0XFF292D32),
  });

  @override
  Widget build(BuildContext context) {
    return color == null
        ? SvgPicture.asset(
            icon,
            width: width!,
          )
        : SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(color!, BlendMode.srcIn),
            width: width!,
          );
  }
}
