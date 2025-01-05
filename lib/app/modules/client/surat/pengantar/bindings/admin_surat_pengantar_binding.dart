import 'package:get/get.dart';

import '../controllers/admin_surat_pengantar_controller.dart';

class AdminSuratPengantarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminSuratPengantarController>(
      () => AdminSuratPengantarController(),
    );
  }
}
