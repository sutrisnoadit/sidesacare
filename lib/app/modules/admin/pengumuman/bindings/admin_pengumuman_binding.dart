import 'package:get/get.dart';

import '../controllers/admin_pengumuman_controller.dart';

class AdminPengumumanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminPengumumanController>(
      () => AdminPengumumanController(),
    );
  }
}
