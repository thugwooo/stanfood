import 'package:flutter/material.dart';
import '../../../../constants/color_constant.dart';
import '../../../../modules/common/custom_button.dart';

class RegisterLayout extends StatelessWidget {
  RegisterLayout({
    super.key,
    required this.registerOnTap,
    required this.children,
  });

  final void Function() registerOnTap;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          bottomNavigationBar: BottomAppBar(
            child: CustomButton(
              onTap: registerOnTap,
              text: '등록하기',
              color: AppColor.primary,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: children,
            ),
          ),
        ));
  }
}
