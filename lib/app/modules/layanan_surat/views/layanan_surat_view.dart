import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/layanan_surat_controller.dart';

class LayananSuratView extends GetView<LayananSuratController> {
  const LayananSuratView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LayananSuratView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LayananSuratView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
