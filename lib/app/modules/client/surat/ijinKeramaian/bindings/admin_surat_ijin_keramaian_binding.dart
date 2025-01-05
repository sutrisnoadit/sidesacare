import 'package:get/get.dart';

import '../controllers/admin_surat_ijin_keramaian_controller.dart';

class AdminSuratIjinKeramaianBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminSuratIjinKeramaianController>(
      () => AdminSuratIjinKeramaianController(),
    );
  }
}
