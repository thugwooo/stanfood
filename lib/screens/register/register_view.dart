import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stanfood/screens/register/register_app_bar.dart';
import 'package:stanfood/screens/register/tabs/register_tab_channel.dart';
import 'package:stanfood/screens/register/tabs/register_tab_main.dart';
import 'package:stanfood/screens/register/tabs/register_tab_mukbang.dart';
import 'package:stanfood/screens/register/tabs/register_tab_restaurant.dart';
import 'package:stanfood/screens/register/tabs/register_tab_stan.dart';

import '../../controllers/register/register_controller.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  final _registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RegisterAppBar(),
        Expanded(
          child: TabBarView(
            controller: _registerController.tabController,
            children: [
              RegisterTabMain(),
              RegisterTabStan(),
              RegisterTabRestaurant(),
              RegisterTabChannel(),
              RegisterTabMukbang(),
            ],
          ),
        )
      ],
    );
  }
}
