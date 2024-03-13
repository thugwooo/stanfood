import 'package:get/get.dart';

class Screen_Controller extends GetxController {
  RxBool splash = false.obs;

  void set_splash() {
    splash(!splash.value);
  }
}
