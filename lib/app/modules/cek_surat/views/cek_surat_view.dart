import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cek_surat_controller.dart';
import '../../../components/card_surat.dart';
class CekSuratView extends GetView<CekSuratController> {
  const CekSuratView({super.key});

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
                    child: Icon(Icons.query_stats_outlined, size: 50, color: Colors.white
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cek Status Surat',
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
              )),
     
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(12.0),
            width: MediaQuery.of(context).size.width * 0.95,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              )
            ),
            
            
            alignment: Alignment.center,
            child: const Text(
              'Surat Yang Telah Diajukan',
              style: TextStyle(
                color: Colors.blue,

                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
   
          Expanded(
            child: ListView(
              children: const [
                SuratCard(
                  title: 'Surat Pengantar SKCK',
                  status: 'Berhasil',
                  color: Colors.green,
                ),
                SuratCard(
                  title: 'Surat Permohonan KTP',
                  status: 'Proses',
                  color: Colors.teal,
                ),
                SuratCard(
                  title: 'Surat Keterangan Usaha',
                  status: 'Ditolak',
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
 

