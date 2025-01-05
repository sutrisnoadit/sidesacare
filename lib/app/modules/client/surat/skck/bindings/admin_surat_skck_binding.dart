import 'package:get/get.dart';

import '../controllers/admin_surat_skck_controller.dart';

class AdminSuratSkckBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminSuratSkckController>(
      () => AdminSuratSkckController(),
    );
  }
}
