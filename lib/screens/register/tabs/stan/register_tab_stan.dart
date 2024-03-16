import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stanfood/components/utils.dart';
import 'package:stanfood/constants/enum_constant.dart';
import '../../../../components/app_utils.dart';
import '../../../../controllers/register/register_controller.dart';
import '../../../../modules/common/custom_button.dart';
import '../../../../modules/common/custom_form_field.dart';
import '../../../../modules/common/image_data.dart';
import '../../../../constants/color_constant.dart';
import '../../../../constants/icon_constant.dart';
import '../../../../constants/style_constant.dart';
import 'components/job_select_view.dart';

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

  bool _isJobSelected = false;
  bool _isJobTapped = false;

  @override
  void initState() {
    super.initState();
    if (_registerController.jobType.isNotEmpty) {
      _selectedJob = _registerController.jobType.map((job) => job.description()).join(', ');
      _isJobSelected = true;
      _isJobTapped = true;
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 20,
          child: CustomButton(
            onTap: () {
              // TODO; 등록하기 버튼 클릭 시 로직 추가
              // _name;
              // _registerController.jobType;
              // _channel;
            },
            text: '등록하기',
          ),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _nameField(),
                  _jobField(context),
                  _infoField(),
                ].divide(const SizedBox(height: 12)).addToStart(const SizedBox(height: 24)).addToEnd(const SizedBox(height: 42))),
          ),
        ),
      ),
    );
  }

  Widget _infoField() {
    if (_isJobTapped && _isJobSelected) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (_registerController.jobType.contains(JobType.Youtuber))
          Column(
            children: [
              _customField(title: '유튜브채널명', hintText: '유튜브 채널명을 입력해주세요', channel: _youtubeName),
              _customField(title: '유튜브주소', hintText: '유튜브 주소를 입력해주세요', channel: _youtubeAddress),
            ],
          ),
        if (_registerController.jobType.contains(JobType.Entertainer)) SizedBox(),
        if (_registerController.jobType.contains(JobType.Blogger))
          Column(
            children: [
              _customField(title: '블로그명', hintText: '블로그명을 입력해주세요', channel: _blogAddress),
              _customField(title: '블로그주소', hintText: '블로그 주소를 입력해주세요', channel: _blogAddress),
            ],
          ),
        if (_registerController.jobType.contains(JobType.Influencer)) _customField(title: 'SNS주소', hintText: 'SNS 주소를 입력해주세요', channel: _snsAddress),
      ]);
    } else {
      return const SizedBox();
    }
  }

  Widget _customField({required String title, required String hintText, required String channel}) {
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
          onChanged: (value) {
            channel = value;
          },
        ),
      ],
    );
  }

  Column _jobField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 44,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Text(
            '직업',
            style: AppTextStyles.GS_subbody.copyWith(),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _isJobTapped = true;
            });
            AppUtil.showModalBottom(
              context: context,
              height: Get.height * 0.95,
              page: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: () => Get.back(), icon: ImageData(icon: IconPath.collapsed)),
                  Expanded(
                    child: JobSelectView(
                      isToastHidden: true,
                      onJobSelected: (selectedJobs) {
                        setState(() {
                          _selectedJob = selectedJobs.map((job) => job.description()).join(', ');
                        });
                        _isJobSelected = true;
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
        if (!_isJobSelected && _isJobTapped)
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
    return _customField(title: '최애 이름', hintText: '이름을 입력해주세요', channel: _name);
  }
}
