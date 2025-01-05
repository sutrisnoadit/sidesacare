import 'package:get/get.dart';

import '../controllers/admin_surat_kehilangan_controller.dart';

class AdminSuratKehilanganBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminSuratKehilanganController>(
      () => AdminSuratKehilanganController(),
    );
  }
}
