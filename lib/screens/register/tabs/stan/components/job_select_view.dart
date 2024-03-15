import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:stanfood/constants/icon_constant.dart';

import '../../../../../modules/common/image_data.dart';
import '../../../../../constants/color_constant.dart';
import '../../../../../constants/style_constant.dart';
import '../../../../../modules/common/custom_button.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('JobSelectCityPage'),
      ),
      body: JobSelectView(
        onJobSelected: (val) {},
      ),
    ),
  ));
}

class Job {
  final String name;
  final String icon;
  Job({required this.name, required this.icon});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      name: json['name'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'icon': icon,
    };
  }
}

class JobSelectView extends StatefulWidget {
  final void Function(String selectedJob) onJobSelected;
  final bool? isToastHidden;

  const JobSelectView({
    Key? key,
    required this.onJobSelected,
    this.isToastHidden,
  }) : super(key: key);

  @override
  _JobPageState createState() => _JobPageState();
}

class _JobPageState extends State<JobSelectView> {
  @override
  void initState() {
    super.initState();
  }

  String _selectedJob = '';

  List<Job> jobList = [
    Job(name: '유튜버', icon: IconPath.youtuber),
    Job(name: '인플루언서', icon: IconPath.influencer),
    Job(name: '연예인', icon: IconPath.entertainer),
    Job(name: '블로거', icon: IconPath.blogger),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.only(
            top: 8,
            right: 16,
            bottom: 8,
            left: 16,
          ),
          elevation: 20,
          child: CustomButton(
            onTap: () {
              widget.onJobSelected(_selectedJob);
              Fluttertoast.showToast(
                msg: "직업이 선택되었습니다.",
                backgroundColor: AppColor.blackText.withOpacity(0.5),
                textColor: AppColor.whiteText,
                toastLength: Toast.LENGTH_SHORT,
              );
              Get.back();
            },
            text: '확인',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(),
              _buildJobGrid(),
            ],
          ),
        ));
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '직업 선택',
            style: AppTextStyles.NN_title3.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Stan의 직업을 선택해주세요.',
            style: AppTextStyles.SYS_subbody.copyWith(
              color: AppColor.lightLabelSecondaryColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: jobList.map((e) => e.name).toSet().toList().length,
      // itemCount: _countries.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            _buildJobText(jobList[index]),
          ],
        );
      },
    );
  }

  Widget _buildJobText(Job job) {
    return Row(
      children: [
        ImageData(
          icon: IconPath.collapsed,
          width: 42.w,
        ),
        Text(
          job.name,
          style: AppTextStyles.NN_callout.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildJobGrid() {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: jobList.length,
        // itemCount: _cities[country]!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          final job = jobList[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedJob = job.name;
              });
            },
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      image: DecorationImage(
                        image: AssetImage(
                          job.icon,
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 13),
                          child: Text(
                            job.name,
                            style: AppTextStyles.NN_callout.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColor.whiteText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: job.name == _selectedJob
                          ? LinearGradient(
                              colors: AppGradients.gradientHealthy.colors.map((e) => e.withOpacity(.9)).toList(),
                            )
                          : const LinearGradient(colors: [
                              Colors.transparent,
                              Colors.transparent,
                            ]),
                    ),
                    child: job.name == _selectedJob
                        ? Stack(
                            children: [
                              Center(
                                child: ImageData(
                                  icon: IconPath.check,
                                  width: 64,
                                ),
                              ),
                              Positioned.fill(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 16, left: 13),
                                      child: Text(
                                        job.name,
                                        style: AppTextStyles.NN_callout.copyWith(fontWeight: FontWeight.w700, color: AppColor.blackText),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        : Container(),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
