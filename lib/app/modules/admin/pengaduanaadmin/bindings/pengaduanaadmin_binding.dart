import 'package:get/get.dart';

import '../controllers/pengaduanaadmin_controller.dart';

class PengaduanaadminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengaduanaadminController>(
      () => PengaduanaadminController(),
    );
  }
}
