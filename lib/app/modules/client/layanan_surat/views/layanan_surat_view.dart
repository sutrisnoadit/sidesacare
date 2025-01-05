import 'package:flutter/material.dart';
import 'package:si_desa_care/app/routes/app_pages.dart';
import '../../../../components/card_master.dart';
import 'package:get/get.dart';
import '../controllers/layanan_surat_controller.dart';

class LayananSuratView extends GetView<LayananSuratController> {
  const LayananSuratView({super.key});

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
            padding: const EdgeInsets.all(16),
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFF60B9F1),
                  child: Icon(Icons.email_outlined, size: 50, color: Colors.white),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Layanan Pengajuan Surat',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 1.5,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView(
              children: [
                CardMaster(
                  title: 'Surat Pengantar SKCK',
                  icon: Icons.security,  
                  onTap: () {
                    Get.toNamed(Routes.ADMIN_SURAT_SKCK);
                  },
                ),
                CardMaster(
                  title: 'Surat Permohonan KTP',
                  icon: Icons.contact_mail, 
                  onTap: () {
                    Get.toNamed(Routes.ADMIN_SURAT_KTP);
                  },
                ),
                CardMaster(
                  title: 'Surat Keterangan/Pengantar',
                  icon: Icons.description, 
                  onTap: () {
                    Get.toNamed(Routes.ADMIN_SURAT_PENGANTAR);
                  },
                ),
                CardMaster(
                  title: 'Surat Keterangan Usaha',
                  icon: Icons.business_center,  
                  onTap: () {
                    Get.toNamed(Routes.ADMIN_SURAT_USAHA);
                  },
                ),
                CardMaster(
                  title: 'Surat Keterangan Domisili',
                  icon: Icons.home_work,  
                  onTap: () {
                    Get.toNamed(Routes.ADMIN_SURAT_DOMISILI);
                  },
                ),
                CardMaster(
                  title: 'Surat Pengantar Ijin Keramaian',
                  icon: Icons.campaign_outlined, 
                  onTap: () {
                    Get.toNamed(Routes.ADMIN_SURAT_IJIN_KERAMAIAN);
                  },
                ),
                CardMaster(
                  title: 'Surat Keterangan Kehilangan',
                  icon: Icons.find_replace,  
                  onTap: () {
                    Get.toNamed(Routes.ADMIN_SURAT_KEHILANGAN);
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