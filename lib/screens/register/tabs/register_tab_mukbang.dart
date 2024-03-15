import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_searchable_dropdown/flutter_searchable_dropdown.dart';
import 'package:stanfood/components/utils.dart';

import '../../../constants/style_constant.dart';

class RegisterTabMukbang extends StatelessWidget {
  const RegisterTabMukbang({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('최애 등록', style: AppTextStyles.NN_body),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('이름'),
            Expanded(
              child: SearchableDropdown.single(
                items: ["Item 1", "Item 2", "Item 3"].map((item) {
                  return DropdownMenuItem(
                    child: Text(item),
                    value: item,
                  );
                }).toList(),
                hint: "Select one",
                searchHint: "Select one",
                onChanged: (value) {
                  // Do something with the selected value
                },
                isExpanded: true,
              ),
            ),
          ].divide(SizedBox(width: 10.w)),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('채널'),
            Expanded(
              child: SearchableDropdown.single(
                items: ["Item 1", "Item 2", "Item 3"].map((item) {
                  return DropdownMenuItem(
                    child: Text(item),
                    value: item,
                  );
                }).toList(),
                hint: "Select one",
                searchHint: "Select one",
                onChanged: (value) {
                  // Do something with the selected value
                },
                isExpanded: true,
              ),
            ),
          ].divide(SizedBox(width: 10.w)),
        ),
      ],
    );
  }
}
