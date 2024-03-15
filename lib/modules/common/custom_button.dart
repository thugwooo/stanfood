import 'package:flutter/material.dart';

import '../../constants/color_constant.dart';
import '../../constants/style_constant.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("ItdaButton"),
      ),
      body: const CustomButton(),
    ),
  ));
}

enum CustomButtonStyle { gradient, border, grey }

class CustomButton extends StatelessWidget {
  final String text;
  final double? width;
  final double height;
  final Color? color;
  final Color? borderColor;
  final Gradient gradient;
  final BorderRadius? borderRadius;
  final Border? border;
  final VoidCallback? onTap;
  final CustomButtonStyle style;
  const CustomButton({
    Key? key,
    this.text = '',
    this.width,
    this.height = 48,
    this.color,
    this.borderColor,
    this.gradient = AppGradients.gradientHealthy,
    this.borderRadius,
    this.border,
    this.onTap,
    this.style = CustomButtonStyle.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: style == CustomButtonStyle.gradient
          ? BoxDecoration(
              color: color,
              gradient: gradient,
              borderRadius: borderRadius ?? BorderRadius.circular(8),
              border: border,
            )
          : BoxDecoration(
              color: color,
              // gradient: gradient,
              borderRadius: borderRadius ?? BorderRadius.circular(8),
              border: border,
            ),
      child: ElevatedButton(
        style: style == CustomButtonStyle.gradient
            ? ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), backgroundColor: Colors.transparent, elevation: 0)
            : ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(side: BorderSide(color: borderColor ?? AppColor.subIconColor), borderRadius: BorderRadius.circular(8)),
                backgroundColor: Colors.transparent,
                elevation: 0),
        onPressed: onTap ?? () {},
        child: Text(
          text,
          style: AppTextStyles.SYS_subhead.copyWith(fontWeight: FontWeight.w400, color: style == CustomButtonStyle.border ? AppColor.subIconColor : AppColor.whiteText),
        ),
      ),
    );
  }
}
