import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminPengumumanController extends GetxController {
  var nameController = TextEditingController();
  var subjectController = TextEditingController();
  var messageController = TextEditingController();
  var pengumumanList = <Map<String, dynamic>>[].obs;
  
  Future<void> createPengumuman() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore.collection('pengumuman').add({
        'judul': nameController.text,
        'lokasi': subjectController.text,
        'detail_pngumuman': messageController.text,
        'date': FieldValue.serverTimestamp(),
      });
      Get.snackbar(
        'Success',
        'Pengumuman berhasil dikirim!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.greenAccent,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  void fetchPengumumanData() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('pengumuman').get();
    pengumumanList.value = snapshot.docs.map((doc) {
      return {
        'id': doc.id,
        'title': doc['judul'],
        'location': doc['lokasi'],
        'detail': doc['detail_pngumuman'],
      };
    }).toList();
  }

  void updatePengumuman(Map<String, dynamic> item, String title,
      String location, String detail) async {
    final docId = item['id'];
    await FirebaseFirestore.instance
        .collection('pengumuman')
        .doc(docId)
        .update({
      'judul': title,
      'lokasi': location,
      'detail_pngumuman': detail,
    });

    fetchPengumumanData();
  }

  void deletePengumuman(Map<String, dynamic> item) async {
    final docId = item['id'];
    await FirebaseFirestore.instance
        .collection('pengumuman')
        .doc(docId)
        .delete();
  fetchPengumumanData(); 
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchPengumumanData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
