import 'package:get/get.dart';

import '../controllers/pengumuman_client_controller.dart';

class PengumumanClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengumumanClientController>(
      () => PengumumanClientController(),
    );
  }
}
