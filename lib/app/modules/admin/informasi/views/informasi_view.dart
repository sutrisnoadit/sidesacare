import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/informasi_controller.dart';

class InformasiView extends GetView<InformasiController> {
  const InformasiView({super.key});
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Atur Jam Layanan Desa",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header Section
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text(
                      "Jam Operasional Layanan Desa",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Pastikan jadwal layanan desa sudah sesuai!",
                      style: TextStyle(fontSize: 14, color: Colors.blue[700]),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Jam Buka
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jam Buka",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        ),
                      ),
                      SizedBox(height: 10),
                      Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Saat ini: ${controller.openingTime.value}",
                                style: TextStyle(fontSize: 16),
                              ),
                              Icon(Icons.watch_later, color: Colors.blue),
                            ],
                          )),
                      SizedBox(height: 10),
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            TimeOfDay? time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (time != null) {
                              controller.updateOpeningTime(
                                  time.format(context));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: Icon(Icons.edit,color: Colors.white,),
                          label: Text("Atur Jam Buka",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Jam Tutup
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jam Tutup",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        ),
                      ),
                      SizedBox(height: 10),
                      Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Saat ini: ${controller.closingTime.value}",
                                style: TextStyle(fontSize: 16),
                              ),
                              Icon(Icons.watch_later, color: Colors.blue),
                            ],
                          )),
                      SizedBox(height: 10),
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            TimeOfDay? time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (time != null) {
                              controller.updateClosingTime(
                                  time.format(context));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: Icon(Icons.edit,color: Colors.white),
                          label: Text("Atur Jam Tutup",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 40),

              // Save Button
              ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    "Jam Operasional Tersimpan",
                    "Jam buka: ${controller.openingTime.value}, Jam tutup: ${controller.closingTime.value}",
                    backgroundColor: Colors.blue[100],
                    colorText: Colors.blue[800],
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  "Simpan",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
