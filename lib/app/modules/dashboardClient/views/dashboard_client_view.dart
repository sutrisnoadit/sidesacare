import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:si_desa_care/app/routes/app_pages.dart';

// ignore: unused_import
import '../controllers/dashboard_client_controller.dart';
import '../../../components/menu_item.dart';

class DashboardClientView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
          'SiDesa Care',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                color: const Color(0xFF3BA1FA),
                borderRadius: BorderRadius.circular(0),
              ),
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[200],
                    child: Icon(Icons.person, size: 50, color: Colors.blue),
                  ),
                  SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Verma Aldit D.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'NIK : 3521031212850001',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Desa Sekarpuro',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Column(
                    children: [
                      SizedBox(height: 100),
                      Text(
                        '09-November-2024',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              padding: EdgeInsets.all(20),
              children: [
                MenuItem(
                  icon: Icons.email_outlined ,
                  title: 'Layanan Surat',
                  onTap: () =>
                      Get.toNamed(Routes.LAYANAN_SURAT),
                ),
                MenuItem(
                  icon: Icons.query_stats_outlined,
                  title: 'Cek Status Surat',
                  onTap: () =>
                      Get.toNamed(Routes.CEK_SURAT),
                ),
                MenuItem(
                  icon: Icons.question_answer_outlined,
                  title: 'Layanan Pengaduan',
                  onTap: () => Get.to(
                      () => PlaceholderPage(title: 'Layanan Pengaduan')),
                ),
                MenuItem(
                  icon: Icons.campaign_outlined,
                  title: 'Pengumuman',
                  onTap: () =>
                      Get.to(() => PlaceholderPage(title: 'Pengumuman')),
                ),
                MenuItem(
                  icon: Icons.bar_chart_sharp,
                  title: 'Statistik',
                  onTap: () =>
                      Get.to(() => PlaceholderPage(title: 'Statistik')),
                ),
                MenuItem(
                  icon: Icons.info ,
                  title: 'Informasi',
                  onTap: () =>
                      Get.to(() => PlaceholderPage(title: 'Informasi')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final String title;

  PlaceholderPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          '$title Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
