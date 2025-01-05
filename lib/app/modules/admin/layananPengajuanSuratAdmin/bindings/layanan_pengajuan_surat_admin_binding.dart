import 'package:get/get.dart';

import '../controllers/layanan_pengajuan_surat_admin_controller.dart';

class LayananPengajuanSuratAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayananPengajuanSuratAdminController>(
      () => LayananPengajuanSuratAdminController(),
    );
  }
}
