import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pengaduan {
  final String id;
  final String judul;
  final String deskripsi;
  final String kategori;
  final String status;
  final String tanggal;
  final String? balasan;

  Pengaduan({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.kategori,
    required this.status,
    required this.tanggal,
    this.balasan,
  });

  factory Pengaduan.fromJson(Map<String, dynamic> json) => Pengaduan(
    id: json['id'],
    judul: json['judul'],
    deskripsi: json['deskripsi'],
    kategori: json['kategori'],
    status: json['status'],
    tanggal: json['tanggal'],
    balasan: json['balasan'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'judul': judul,
    'deskripsi': deskripsi,
    'kategori': kategori,
    'status': status,
    'tanggal': tanggal,
    'balasan': balasan,
  };
}
class LayananSuratController extends GetxController {
   final formKey = GlobalKey<FormState>();
  final judulController = TextEditingController();
  final deskripsiController = TextEditingController();
  final kategoriList = ['Infrastruktur', 'Pelayanan', 'Administrasi', 'Lainnya'].obs;
  final selectedKategori = 'Infrastruktur'.obs;
  
  var isLoading = false.obs;
  var pengaduanList = <Pengaduan>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPengaduan();
  }

  @override
  void onClose() {
    judulController.dispose();
    deskripsiController.dispose();
    super.onClose();
  }

  void fetchPengaduan() {
    try {
      isLoading(true);
      // Simulasi data
      var dummyData = [
        Pengaduan(
          id: '1',
          judul: 'Jalan Rusak',
          deskripsi: 'Jalan di RT 02 rusak parah dan perlu perbaikan segera',
          kategori: 'Infrastruktur',
          status: 'Diproses',
          tanggal: '2024-01-05',
          balasan: 'Akan segera ditindaklanjuti oleh tim teknis',
        ),
        Pengaduan(
          id: '2',
          judul: 'Layanan KTP',
          deskripsi: 'Pelayanan pembuatan KTP lambat',
          kategori: 'Pelayanan',
          status: 'Selesai',
          tanggal: '2024-01-03',
          balasan: 'Sudah diperbaiki sistem antriannya',
        ),
      ];
      pengaduanList.assignAll(dummyData);
    } finally {
      isLoading(false);
    }
  }

  Future<void> submitPengaduan() async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading(true);
        
        // Simulasi pengiriman data
        final newPengaduan = Pengaduan(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          judul: judulController.text,
          deskripsi: deskripsiController.text,
          kategori: selectedKategori.value,
          status: 'Menunggu',
          tanggal: DateTime.now().toString().split(' ')[0],
        );
        
        // Simulasi delay network
        await Future.delayed(const Duration(seconds: 1));
        
        pengaduanList.insert(0, newPengaduan);
        clearForm();
        Get.snackbar(
          'Sukses',
          'Pengaduan berhasil dikirim',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      } catch (e) {
        Get.snackbar(
          'Error',
          'Gagal mengirim pengaduan',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      } finally {
        isLoading(false);
      }
    }
  }

  void clearForm() {
    judulController.clear();
    deskripsiController.clear();
    selectedKategori.value = 'Infrastruktur';
  }

  void showDetailPengaduan(Pengaduan pengaduan) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Detail Pengaduan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Get.back(),
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(height: 10),
                _buildDetailItem('Status', pengaduan.status),
                _buildDetailItem('Kategori', pengaduan.kategori),
                _buildDetailItem('Tanggal', pengaduan.tanggal),
                _buildDetailItem('Judul', pengaduan.judul),
                _buildDetailItem('Deskripsi', pengaduan.deskripsi),
                if (pengaduan.balasan != null)
                  _buildDetailItem('Balasan', pengaduan.balasan!),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}