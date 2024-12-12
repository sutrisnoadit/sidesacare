import 'package:get/get.dart';

import '../controllers/layanan_surat_controller.dart';

class LayananSuratBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayananSuratController>(
      () => LayananSuratController(),
    );
  }
}
