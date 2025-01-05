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
class PengaduanController extends GetxController {
   final formKey = GlobalKey<FormState>();
  final judulController = TextEditingController();
  final deskripsiController = TextEditingController();
  final kategoriList = ['Infrastruktur', 'Pelayanan', 'Administrasi', 'Lainnya'].obs;
  final selectedKategori = 'Infrastruktur'.obs;
  
  var isLoading = false.obs;
  var pengaduanList = <Pengaduan>[].obs;
  var isEditing = false.obs;
  var editingId = ''.obs;

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

  void deletePengaduan(String id) {
    Get.dialog(
      AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Apakah Anda yakin ingin menghapus pengaduan ini?'),
        actions: [
          TextButton(
            child: const Text('Batal'),
            onPressed: () => Get.back(),
          ),
          TextButton(
            child: const Text('Hapus'),
            onPressed: () {
              pengaduanList.removeWhere((pengaduan) => pengaduan.id == id);
              Get.back();
              Get.snackbar(
                'Sukses',
                'Pengaduan berhasil dihapus',
                backgroundColor: Colors.green,
                colorText: Colors.white,
                snackPosition: SnackPosition.BOTTOM,
              );
            },
          ),
        ],
      ),
    );
  }

  void startEdit(Pengaduan pengaduan) {
    isEditing(true);
    editingId.value = pengaduan.id;
    judulController.text = pengaduan.judul;
    deskripsiController.text = pengaduan.deskripsi;
    selectedKategori.value = pengaduan.kategori;
    
    // Scroll to form
    // You might want to use a ScrollController to implement this
  }

  void cancelEdit() {
    isEditing(false);
    editingId.value = '';
    clearForm();
  }

  Future<void> submitPengaduan() async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading(true);
        
        if (isEditing.value) {
          // Update existing pengaduan
          final index = pengaduanList.indexWhere((p) => p.id == editingId.value);
          if (index != -1) {
            final updatedPengaduan = Pengaduan(
              id: editingId.value,
              judul: judulController.text,
              deskripsi: deskripsiController.text,
              kategori: selectedKategori.value,
              status: pengaduanList[index].status,
              tanggal: pengaduanList[index].tanggal,
              balasan: pengaduanList[index].balasan,
            );
            
            pengaduanList[index] = updatedPengaduan;
            
            clearForm();
            isEditing(false);
            editingId.value = '';
            
            Get.snackbar(
              'Sukses',
              'Pengaduan berhasil diperbarui',
              backgroundColor: Colors.green,
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        } else {
          // Create new pengaduan
          final newPengaduan = Pengaduan(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            judul: judulController.text,
            deskripsi: deskripsiController.text,
            kategori: selectedKategori.value,
            status: 'Menunggu',
            tanggal: DateTime.now().toString().split(' ')[0],
          );
          
          pengaduanList.insert(0, newPengaduan);
          clearForm();
          
          Get.snackbar(
            'Sukses',
            'Pengaduan berhasil dikirim',
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } catch (e) {
        Get.snackbar(
          'Error',
          'Gagal ${isEditing.value ? "memperbarui" : "mengirim"} pengaduan',
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