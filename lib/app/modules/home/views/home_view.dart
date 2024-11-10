import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../components/onboarding_page.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(
        pages: [
          OnboardingPageModel(
            title: 'Cepat dan kapan saja',
            description:
                'Membuat permohonan surat kapan saja, tanpa perlu antri di kantor desa.',
            image: 'assets/image0.png',
            bgColor: Colors.indigo,
          ),
          OnboardingPageModel(
            title: 'Lapor Keluhan',
            description:
                'Mengirimkan laporan keluhan secara langsung tentang berbagai masalah di desa ',
            image: 'assets/image1.png',
            bgColor: const Color(0xff1eb090),
          ),
          OnboardingPageModel(
            title: 'Melihat keluhan warga lain',
            description:
                'Mendiskusikan solusi bersama dengan warga lain untuk mencari cara terbaik menangani masalah yang ada',
            image: 'assets/image2.png',
            bgColor: const Color(0xfffeae4f),
          ),
          OnboardingPageModel(
            title: 'Dapatkan Notifikasi Darurat Secara Langsung!',
            description:
                'Jika ada situasi mendesak Anda akan segera menerima pemberitahuan.',
            image: 'assets/image3.png',
            bgColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}
