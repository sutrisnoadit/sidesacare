import 'package:get/get.dart';

class InformasiController extends GetxController {
  //TODO: Implement InformasiController
  // Observables for opening and closing hours
  var openingTime = "08:00".obs;
  var closingTime = "17:00".obs;

  // Method to update opening and closing times
  void updateOpeningTime(String time) {
    openingTime.value = time;
  }

  void updateClosingTime(String time) {
    closingTime.value = time;
  }
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
