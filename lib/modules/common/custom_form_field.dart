import 'package:flutter/material.dart';

import '../../constants/color_constant.dart';
import '../../constants/style_constant.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('CustomFormField')),
      body: const CustomFormField(),
    ),
  ));
}

// COMP_마이페이지 탭_나의 프로필 수정 스크린_커스텀 텍스트폼필드_UI
class CustomFormField extends StatefulWidget {
  final String? initialValue;
  final String? hintText;
  final String? helperText;
  final IconData? icon;
  final String? prefixText;
  final String? suffixText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final int? maxLength;
  final int? maxLines;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomFormField({
    Key? key,
    this.initialValue,
    this.hintText,
    this.helperText,
    this.icon,
    this.prefixText,
    this.suffixText,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.maxLength,
    this.maxLines,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomFormField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        style: AppTextStyles.SYS_subhead.copyWith(fontWeight: FontWeight.w400),
        onChanged: widget.onChanged,
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines,
        initialValue: widget.initialValue,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          filled: true,
          fillColor: Colors.white,
          helperText: widget.helperText,
          hintText: widget.hintText,
          icon: widget.icon != null ? Icon(widget.icon) : null,
          prefixText: widget.prefixText,
          suffixText: widget.suffixText,
          suffixIcon: widget.suffixIcon,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.lightSeparatorNonThickColor,
              width: .3,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.lightSeparatorNonThickColor,
              width: .5,
            ),
          ),
          border: OutlineInputBorder(borderSide: BorderSide(width: .3, color: AppColor.lightSeparatorNonThickColor)),
        ),
      ),
    );
  }
}
