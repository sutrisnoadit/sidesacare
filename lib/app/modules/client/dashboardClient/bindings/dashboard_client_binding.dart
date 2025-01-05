import 'package:get/get.dart';

import '../controllers/dashboard_client_controller.dart';

class DashboardClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardClientController>(
      () => DashboardClientController(),
    );
  }
}
