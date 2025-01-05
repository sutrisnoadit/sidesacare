import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  final suratPengantarController = TextEditingController();
  final fotokopiController = TextEditingController();
  final pasFotoController = TextEditingController();
}

class AdminSuratIjinKeramaianView extends StatelessWidget {
  final controller = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

     appBar: AppBar(
        elevation: 0,
        title: const Text(
          'SiDesa Care',
          style: TextStyle(
            color: Color(0xFF3BA1FA),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Color(0xFF3BA1FA)),
            onPressed: () {},
          ),
        ],
      ),
      
     
      body: SingleChildScrollView(
       
        child: Column(
          children: [
            // Blue header section
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(Icons.description, color: Colors.blue),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Buat Surat Pengantar Ijinn Keramaian', 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Isi form dengan lengkap',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Form content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Custom TextFields
                  _buildTextField(
                    controller: controller.suratPengantarController,
                    label: 'Surat Pengantar Dari RT/RW',
                    icon: Icons.article,
                  ),
                  SizedBox(height: 16),
                  _buildTextField(
                    controller: controller.fotokopiController,
                    label: 'Fotokopi KTP dan KK',
                    icon: Icons.copy,
                  ),
                  SizedBox(height: 16),
                
                
                  
                  // Submit button
                  Container(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle submit
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Icon(Icons.send, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,  
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: label,
          prefixIcon: Container(
            padding: EdgeInsets.all(12),
            child: Icon(icon, color: Colors.blue),
          ),
          hintStyle: TextStyle(color: Colors.grey[400]),
        ),
      ),
    );
  }
}