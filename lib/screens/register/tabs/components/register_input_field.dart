import 'package:flutter/material.dart';

import '../../../../constants/style_constant.dart';
import '../../../../modules/common/custom_form_field.dart';

class RegisterInputField extends StatelessWidget {
  RegisterInputField({super.key, required this.title, required this.hintText, required this.onChanged});
  final String title;
  final String hintText;
  final Function(String value) onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 44,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Text(
            title,
            style: AppTextStyles.GS_subbody.copyWith(),
          ),
        ),
        CustomFormField(
          validator: (value) => _validateTextField(value, regExp: RegExp(r"^[ㄱ-ㅎ가-힣0-9a-zA-Z\s+]*$"), maxLength: 64),
          hintText: hintText,
          maxLines: 1,
          onChanged: onChanged,
        ),
      ],
    );
  }

  String? _validateTextField(String? value, {RegExp? regExp, String? regExpText = '한글, 영문, 숫자만 입력 가능합니다.', int? maxLength}) {
    if (value == null || value.isEmpty) {
      return '필드가 비어있을 경우 입력해주시길 바랍니다.';
    }
    // 영문과 숫자만 허용
    if (regExp != null) {
      //ex) RegExp(r'^[a-zA-Z0-9]+$')
      if (!regExp.hasMatch(value)) {
        return regExpText;
      }
    }
    // 글자 수 제한 (maxLength가 전달된 경우에만 확인)
    if (maxLength != null) {
      if (value.length > maxLength) {
        return '${maxLength - 1}자 이하로 입력해주세요.';
      }
    }
    return null;
  }
}
