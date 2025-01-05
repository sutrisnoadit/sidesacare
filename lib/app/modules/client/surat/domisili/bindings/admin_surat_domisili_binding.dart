import 'package:get/get.dart';

import '../controllers/admin_surat_domisili_controller.dart';

class AdminSuratDomisiliBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminSuratDomisiliController>(
      () => AdminSuratDomisiliController(),
    );
  }
}
