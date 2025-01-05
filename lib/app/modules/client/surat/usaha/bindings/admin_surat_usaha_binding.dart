import 'package:get/get.dart';

import '../controllers/admin_surat_usaha_controller.dart';

class AdminSuratUsahaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminSuratUsahaController>(
      () => AdminSuratUsahaController(),
    );
  }
}
