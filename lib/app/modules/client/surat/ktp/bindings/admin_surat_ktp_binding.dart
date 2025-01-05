import 'package:get/get.dart';

import '../controllers/admin_surat_ktp_controller.dart';

class AdminSuratKtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminSuratKtpController>(
      () => AdminSuratKtpController(),
    );
  }
}
