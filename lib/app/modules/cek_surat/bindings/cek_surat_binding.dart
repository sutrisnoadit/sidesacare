import 'package:get/get.dart';

import '../controllers/cek_surat_controller.dart';

class CekSuratBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CekSuratController>(
      () => CekSuratController(),
    );
  }
}
