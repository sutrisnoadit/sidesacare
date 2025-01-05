import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:si_desa_care/app/modules/admin/pengumuman/views/buat_pengumuman_view.dart';
import 'package:si_desa_care/app/modules/admin/pengumuman/views/list_pengumuman_view.dart';
import '../../../../components/card_master.dart';
import '../controllers/admin_pengumuman_controller.dart';


class AdminPengumumanView extends GetView<AdminPengumumanController> {
  const AdminPengumumanView({super.key});
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
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF3BA1FA), Color(0xFF60B9F1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: const Icon(Icons.campaign_outlined,
                        size: 50, color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Text(
                      'Pengumuman',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    
        const SizedBox(height: 30), 
          Expanded(
            child: ListView(
              children: [
                CardMaster(
                  title: 'Buat Pengumuman',
                  icon: Icons.add_box,
                  onTap: () {
                    Get.to(() => const BuatPengumumanView() );
      
                  },
                ),
                CardMaster(
                  title: 'Pengumuman Sebelumnya',
                  icon: Icons.list_alt,
                  onTap: () {
                   Get.to(() => const ListPengumumanView() );
                  },
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  
  }
}
