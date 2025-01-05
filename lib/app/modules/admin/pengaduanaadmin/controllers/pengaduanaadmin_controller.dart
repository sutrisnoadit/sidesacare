import 'package:get/get.dart';
import 'package:flutter/material.dart';
 
class Pengaduan {
  final String id;
  final String userId;
  final String userName;
  final String judul;
  final String deskripsi;
  final String kategori;
  final String status;
  final String tanggal;
  final String? balasan;

  Pengaduan({
    required this.id,
    required this.userId,
    required this.userName,
    required this.judul,
    required this.deskripsi,
    required this.kategori,
    required this.status,
    required this.tanggal,
    this.balasan,
  });

  factory Pengaduan.fromJson(Map<String, dynamic> json) => Pengaduan(
    id: json['id'],
    userId: json['userId'],
    userName: json['userName'],
    judul: json['judul'],
    deskripsi: json['deskripsi'],
    kategori: json['kategori'],
    status: json['status'],
    tanggal: json['tanggal'],
    balasan: json['balasan'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'userName': userName,
    'judul': judul,
    'deskripsi': deskripsi,
    'kategori': kategori,
    'status': status,
    'tanggal': tanggal,
    'balasan': balasan,
  };

  Pengaduan copyWith({
    String? status,
    String? balasan,
  }) {
    return Pengaduan(
      id: id,
      userId: userId,
      userName: userName,
      judul: judul,
      deskripsi: deskripsi,
      kategori: kategori,
      status: status ?? this.status,
      tanggal: tanggal,
      balasan: balasan ?? this.balasan,
    );
  }
}

class PengaduanaadminController extends GetxController {
  var isLoading = false.obs;
  var pengaduanList = <Pengaduan>[].obs;
  var selectedFilter = 'Semua'.obs;
  final balasanController = TextEditingController();
  
  final filterOptions = [
    'Semua',
    'Menunggu',
    'Diproses',
    'Selesai',
    'Ditolak'
  ];

  @override
  void onInit() {
    super.onInit();
    fetchPengaduan();
  }

  @override
  void onClose() {
    balasanController.dispose();
    super.onClose();
  }

  void fetchPengaduan() {
    try {
      isLoading(true);
      // Simulasi data
      var dummyData = [
        Pengaduan(
          id: '1',
          userId: 'user1',
          userName: 'John Doe',
          judul: 'Jalan Rusak',
          deskripsi: 'Jalan di RT 02 rusak parah',
          kategori: 'Infrastruktur',
          status: 'Menunggu',
          tanggal: '2024-01-05',
        ),
        Pengaduan(
          id: '2',
          userId: 'user2',
          userName: 'Jane Smith',
          judul: 'Lampu Jalan Mati',
          deskripsi: 'Lampu jalan di gang depan pasar mati',
          kategori: 'Infrastruktur',
          status: 'Diproses',
          tanggal: '2024-01-04',
          balasan: 'Sedang dalam pengecekan',
        ),
      ];
      pengaduanList.assignAll(dummyData);
    } finally {
      isLoading(false);
    }
  }

  List<Pengaduan> get filteredPengaduan {
    if (selectedFilter.value == 'Semua') {
      return pengaduanList;
    }
    return pengaduanList.where((p) => p.status == selectedFilter.value).toList();
  }

  void updateStatus(String id, String newStatus) {
    final index = pengaduanList.indexWhere((p) => p.id == id);
    if (index != -1) {
      pengaduanList[index] = pengaduanList[index].copyWith(status: newStatus);
      Get.back();
      Get.snackbar(
        'Sukses',
        'Status pengaduan berhasil diperbarui',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void submitBalasan(String id) {
    if (balasanController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Balasan tidak boleh kosong',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final index = pengaduanList.indexWhere((p) => p.id == id);
    if (index != -1) {
      pengaduanList[index] = pengaduanList[index].copyWith(
        balasan: balasanController.text,
        status: 'Diproses',
      );
      balasanController.clear();
      Get.back();
      Get.snackbar(
        'Sukses',
        'Balasan berhasil dikirim',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

