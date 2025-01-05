import 'package:get/get.dart';

class StatistikController extends GetxController {
    final isLoading = true.obs;
  final totalPengaduan = 0.obs;
  final belumDiproses = 0.obs;
  final sedangDiproses = 0.obs;
  final selesai = 0.obs;
  final monthlyData = <MonthlyData>[].obs;
  final recentActivities = <Activity>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadStatistics();
  }

  Future<void> loadStatistics() async {
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      // Sample data
      totalPengaduan.value = 125;
      belumDiproses.value = 45;
      sedangDiproses.value = 30;
      selesai.value = 50;

      monthlyData.value = [
        MonthlyData(0, 20),
        MonthlyData(1, 35),
        MonthlyData(2, 25),
        MonthlyData(3, 40),
        MonthlyData(4, 30),
        MonthlyData(5, 45),
      ];

      recentActivities.value = [
        Activity(
          type: 'new',
          description: 'Pengaduan baru dari John Doe',
          time: '5 menit yang lalu',
        ),
        Activity(
          type: 'update',
          description: 'Status pengaduan diupdate ke "Diproses"',
          time: '1 jam yang lalu',
        ),
        Activity(
          type: 'resolved',
          description: 'Pengaduan #123 telah diselesaikan',
          time: '2 jam yang lalu',
        ),
      ];

      isLoading.value = false;
    } catch (e) {
      print('Error loading statistics: $e');
      isLoading.value = false;
    }
  }
}

class MonthlyData {
  final int month;
  final int count;

  MonthlyData(this.month, this.count);
}

class Activity {
  final String type;
  final String description;
  final String time;

  Activity({
    required this.type,
    required this.description,
    required this.time,
  });
}