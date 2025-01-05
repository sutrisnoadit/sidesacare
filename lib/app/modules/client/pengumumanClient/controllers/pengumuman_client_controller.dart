import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pengumuman {
  final String id;
  final String judul;
  final String deskripsi;
  final String tanggal;
  final String waktu;

  Pengumuman({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.tanggal,
    required this.waktu,
  });

  factory Pengumuman.fromJson(Map<String, dynamic> json) => Pengumuman(
        id: json['id'],
        judul: json['judul'],
        deskripsi: json['deskripsi'],
        tanggal: json['tanggal'],
        waktu: json['waktu'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'judul': judul,
        'deskripsi': deskripsi,
        'tanggal': tanggal,
        'waktu': waktu,
      };
}

class PengumumanClientController extends GetxController {
  var isLoading = true.obs;
  var pengumumanList = <Pengumuman>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPengumuman();
  }

  void fetchPengumuman() {
    try {
      isLoading(true);
      // Simulasi data
      var dummyData = [
        Pengumuman(
          id: '1',
          judul: 'Kumpul Kerja',
          deskripsi:
              'Kumpul kerja bakti pembersihan lingkungan desa akan dilaksanakan pada hari Minggu pukul 07.00 WIB. Dimohon kehadiran seluruh warga untuk berpartisipasi dalam kegiatan ini.',
          tanggal: '2024-01-05',
          waktu: '07:00',
        ),
        Pengumuman(
          id: '2',
          judul: 'Rapat Desa',
          deskripsi:
              'Rapat pembahasan program desa tahun 2024 akan dilaksanakan di Balai Desa.',
          tanggal: '2024-01-10',
          waktu: '19:30',
        ),
      ];
      pengumumanList.value = dummyData;
    } finally {
      isLoading(false);
    }
  }

  void showDetailDialog(BuildContext context, Pengumuman pengumuman) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.announcement_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        pengumuman.judul,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            pengumuman.tanggal,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Icon(
                            Icons.access_time,
                            color: Colors.white,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            pengumuman.waktu,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Content
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Deskripsi Pengumuman:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        pengumuman.deskripsi,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
