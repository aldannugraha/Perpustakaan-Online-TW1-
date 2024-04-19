import 'package:get/get.dart';

import '../controllers/flash_screen_controller.dart';

class FlashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlashScreenController>(
      () => FlashScreenController(),
    );
  }
}
