import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LayananPengajuanSuratAdminController extends GetxController {
   var letters = [
    {
      'id': '1',
      'title': 'Surat Pengantar SKCK',
      'status': 'accepted',
      'type': 'SKCK',
      'date': DateTime.now().subtract(Duration(days: 1)).toString(),
      'description': 'Pengajuan surat pengantar SKCK untuk keperluan pendaftaran kerja'
    },
    {
      'id': '2',
      'title': 'Surat Permohonan KTP',
      'status': 'pending',
      'type': 'KTP',
      'date': DateTime.now().subtract(Duration(days: 2)).toString(),
      'description': 'Permohonan pembuatan KTP baru karena hilang'
    },
    {
      'id': '3',
      'title': 'Surat Keterangan Usaha',
      'status': 'rejected',
      'type': 'SKU',
      'date': DateTime.now().subtract(Duration(days: 3)).toString(),
      'description': 'Pengajuan surat keterangan usaha untuk warung kelontong'
    },
  ].obs;

  var selectedFilter = 'Semua'.obs;

  List<Map<String, dynamic>> get filteredLetters {
    if (selectedFilter.value == 'Semua') return letters;
    return letters.where((letter) => letter['status'] == selectedFilter.value.toLowerCase()).toList();
  }

  void updateLetterStatus(String id, String status) {
    final index = letters.indexWhere((letter) => letter['id'] == id);
    if (index != -1) {
      letters[index]['status'] = status;
      letters.refresh();
      
      Get.snackbar(
        'Status Updated',
        'Surat telah $status',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: _getStatusColor(status).withOpacity(0.9),
        colorText: Colors.white,
        duration: Duration(seconds: 2),
      );
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'accepted':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
