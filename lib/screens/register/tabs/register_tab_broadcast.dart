import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stanfood/constants/enum_constant.dart';
import 'package:stanfood/screens/register/tabs/components/broadcast_select_view.dart';
import 'package:stanfood/screens/register/tabs/components/register_input_field.dart';
import 'package:stanfood/screens/register/tabs/components/register_layout.dart';

import '../../../components/app_utils.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/icon_constant.dart';
import '../../../constants/style_constant.dart';
import '../../../controllers/register/register_controller.dart';
import '../../../modules/common/image_data.dart';

class RegisterTabBroadcast extends StatefulWidget {
  const RegisterTabBroadcast({super.key});

  @override
  State<RegisterTabBroadcast> createState() => _RegisterTabBroadcastState();
}

class _RegisterTabBroadcastState extends State<RegisterTabBroadcast> {
  final _registerController = Get.put(RegisterController());
  String _selectedBroadcast = '방송을 선택해주세요';

  String _tvChannelName = '';
  String _youtubeLink = '';

  bool _isBroadcastSelected = false;
  bool _isBroadcastTapped = false;
  @override
  Widget build(BuildContext context) {
    return RegisterLayout(
      registerOnTap: () {},
      children: [
        _nameField(),
        _channelField(),
      ],
    );
  }

  Widget _channelField() {
    if (_isBroadcastTapped && _isBroadcastSelected) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_registerController.broadcastType.contains(BroadcastType.TV))
            RegisterInputField(
              title: 'TV 채널명',
              hintText: 'TV 채널명을 입력해주세요',
              onChanged: (value) => _tvChannelName = value,
            ),
          if (_registerController.broadcastType.contains(BroadcastType.Youtube)) RegisterInputField(title: '유튜브 링크', hintText: '유튜브 링크를 입력해주세요', onChanged: (value) => _youtubeLink = value)
        ],
      );
    } else {
      return SizedBox();
    }
  }

  Widget _nameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 44,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Text(
            '방송',
            style: AppTextStyles.GS_subbody.copyWith(),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _isBroadcastTapped = true;
            });
            AppUtil.showModalBottom(
              context: context,
              height: Get.height * 0.95,
              page: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: () => Get.back(), icon: ImageData(icon: IconPath.collapsed)),
                  Expanded(
                    child: BroadcastSelectView(
                      onSelected: (selectedBroadcast) {
                        setState(() {
                          _selectedBroadcast = selectedBroadcast.map((broadcast) => broadcast.description()).join(', ');
                        });
                        _isBroadcastSelected = true;
                      },
                    ),
                  ),
                ],
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 3, color: AppColor.lightSeparatorNonThickColor),
            ),
            height: 52,
            child: Row(
              children: [
                Text(
                  _selectedBroadcast,
                  style: AppTextStyles.SYS_subbody.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        if (!_isBroadcastSelected && _isBroadcastTapped)
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0),
            child: Text(
              '방송 필드가 비어있을 경우 입력해주시길 바랍니다.',
              style: TextStyle(color: Colors.red.shade800, fontSize: 12.0),
            ),
          ),
      ],
    );
  }
}
