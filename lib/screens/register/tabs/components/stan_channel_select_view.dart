import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:stanfood/constants/icon_constant.dart';
import '../../../../constants/enum_constant.dart';
import '../../../../controllers/register/register_controller.dart';
import '../../../../data/models/channel_model.dart';
import '../../../../modules/common/image_data.dart';
import '../../../../constants/color_constant.dart';
import '../../../../constants/style_constant.dart';
import '../../../../modules/common/custom_button.dart';

class StanChannelSelectView extends StatelessWidget {
  final void Function(List<ChannelType> channelType) onSelected;
  final bool? isToastHidden;

  StanChannelSelectView({
    Key? key,
    required this.onSelected,
    this.isToastHidden,
  }) : super(key: key);

  final _registerController = Get.put(RegisterController());

  final List<Channel> channelList = [
    Channel(type: ChannelType.TV, icon: IconPath.tv),
    Channel(type: ChannelType.Youtube, icon: IconPath.youtube),
    Channel(type: ChannelType.SNS, icon: IconPath.sns),
    Channel(type: ChannelType.Blog, icon: IconPath.blog),
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
              onSelected(_registerController.selectedChannelTypes);
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
            '최대의 직업을 선택해주세요.',
            style: AppTextStyles.SYS_subbody.copyWith(
              color: AppColor.lightLabelSecondaryColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJobGrid() {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: channelList.length,
        // itemCount: _cities[country]!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          final channel = channelList[index];
          return GestureDetector(
            onTap: () {
              _registerController.selectMultipleChannelTypes(channel.type);
            },
            child: Obx(
              () => Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        image: DecorationImage(
                          image: AssetImage(
                            channel.icon,
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
                              channel.type.description(),
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
                        gradient: _registerController.selectedChannelTypes.contains(channel.type)
                            ? LinearGradient(
                                colors: AppGradients.gradientHealthy.colors.map((e) => e.withOpacity(.9)).toList(),
                              )
                            : const LinearGradient(colors: [
                                Colors.transparent,
                                Colors.transparent,
                              ]),
                      ),
                      child: _registerController.selectedChannelTypes.contains(channel.type)
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
                                          channel.type.description(),
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
            ),
          );
        });
  }
}
