import 'package:get/get.dart';

import '../controllers/signinpage_controller.dart';

class SigninpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SigninpageController>(
      () => SigninpageController(),
    );
  }
}
