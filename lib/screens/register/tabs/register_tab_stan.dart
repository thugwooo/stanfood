import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stanfood/components/utils.dart';
import 'package:stanfood/constants/enum_constant.dart';
import 'package:stanfood/screens/register/tabs/components/register_input_field.dart';
import 'package:stanfood/screens/register/tabs/components/register_layout.dart';
import '../../../components/app_utils.dart';
import '../../../controllers/register/register_controller.dart';
import '../../../modules/common/image_data.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/icon_constant.dart';
import '../../../constants/style_constant.dart';
import 'components/stan_channel_select_view.dart';

class RegisterTabStan extends StatefulWidget {
  RegisterTabStan({super.key});

  @override
  State<RegisterTabStan> createState() => _RegisterTabStanState();
}

class _RegisterTabStanState extends State<RegisterTabStan> {
  final _formKey = GlobalKey<FormState>();
  final _registerController = Get.put(RegisterController());

  String _name = '';
  String _selectedJob = '직업을 선택해주세요';
  String _youtubeName = '';
  String _youtubeAddress = '';
  String bloggerName = '';
  String _blogAddress = '';
  String _snsAddress = '';

  bool _isChannelSelected = false;
  bool _isChannelTapped = false;

  @override
  void initState() {
    super.initState();
    if (_registerController.selectedChannelTypes.isNotEmpty) {
      _selectedJob = _registerController.selectedChannelTypes.map((job) => job.description()).join(', ');
      _isChannelSelected = true;
      _isChannelTapped = true;
    }
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

  @override
  Widget build(BuildContext context) {
    return RegisterLayout(
      registerOnTap: () {},
      children: [
        _nameField(),
        _channelField(context),
        _infoField(),
      ].divide(const SizedBox(height: 12)).addToStart(const SizedBox(height: 24)).addToEnd(const SizedBox(height: 42)),
    );
  }

  Widget _infoField() {
    if (_isChannelTapped && _isChannelSelected) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_registerController.selectedChannelTypes.contains(ChannelType.Youtube))
            Column(
              children: [
                RegisterInputField(title: '유튜브채널명', hintText: '유튜브 채널명을 입력해주세요', onChanged: (value) => _youtubeName = value),
                RegisterInputField(title: '유튜브주소', hintText: '유튜브 주소를 입력해주세요', onChanged: (value) => _youtubeAddress = value),
              ],
            ),
          if (_registerController.selectedChannelTypes.contains(ChannelType.TV)) SizedBox(),
          if (_registerController.selectedChannelTypes.contains(ChannelType.Blog)) SizedBox(),
          if (_registerController.selectedChannelTypes.contains(ChannelType.SNS)) RegisterInputField(title: 'SNS주소', hintText: 'SNS 주소를 입력해주세요', onChanged: (value) => _snsAddress = value),
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  Column _channelField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 44,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Text(
            '활동 채널',
            style: AppTextStyles.GS_subbody.copyWith(),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _isChannelTapped = true;
            });
            AppUtil.showModalBottom(
              context: context,
              height: Get.height * 0.95,
              page: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: () => Get.back(), icon: ImageData(icon: IconPath.collapsed)),
                  Expanded(
                    child: StanChannelSelectView(
                      onSelected: (selectedChannels) {
                        setState(() {
                          _selectedJob = selectedChannels.map((job) => job.description()).join(', ');
                        });
                        _isChannelSelected = true;
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
              border: Border.all(width: .3, color: AppColor.lightSeparatorNonThickColor),
            ),
            height: 52,
            child: Row(
              children: [
                Text(
                  _selectedJob,
                  style: AppTextStyles.SYS_subbody.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        if (!_isChannelSelected && _isChannelTapped)
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0),
            child: Text(
              '직업 필드가 비어있을 경우 입력해주시길 바랍니다.',
              style: TextStyle(color: Colors.red.shade800, fontSize: 12.0),
            ),
          ),
      ],
    );
  }

  Widget _nameField() {
    return RegisterInputField(
      title: '최애 이름',
      hintText: '이름을 입력해주세요',
      onChanged: (value) => _name = value,
    );
  }
}
