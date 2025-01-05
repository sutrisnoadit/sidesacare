import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pengaduanaadmin_controller.dart';
import 'package:intl/intl.dart';

class PengaduanaadminView extends GetView<PengaduanaadminController> {
  const PengaduanaadminView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SiDesa Care',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF3BA1FA).withOpacity(0.1),
              Colors.white,
            ],
          ),
        ),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF3BA1FA)),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.pengaduanList.length,
            itemBuilder: (context, index) {
              final pengaduan = controller.pengaduanList[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: InkWell(
                  onTap: () => _showDetailDialog(context, pengaduan),
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                pengaduan.judul,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            _buildStatusChip(pengaduan.status),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Icon(Icons.person_outline, size: 16, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(
                              pengaduan.userName,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(width: 16),
                            const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(
                              pengaduan.tanggal,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        if (pengaduan.balasan != null) ...[
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.reply, size: 16, color: Colors.grey),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    pengaduan.balasan!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton.icon(
                              onPressed: () => _showBalasDialog(context, pengaduan),
                              icon: const Icon(Icons.reply),
                              label: const Text('Balas'),
                            ),
                            const SizedBox(width: 8),
                            TextButton.icon(
                              onPressed: () => _showStatusDialog(context, pengaduan),
                              icon: const Icon(Icons.update),
                              label: const Text('Update Status'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color chipColor;
    IconData iconData;
    
    switch (status.toLowerCase()) {
      case 'menunggu':
        chipColor = Colors.orange;
        iconData = Icons.hourglass_empty;
        break;
      case 'diproses':
        chipColor = Colors.blue;
        iconData = Icons.sync;
        break;
      case 'selesai':
        chipColor = Colors.green;
        iconData = Icons.check_circle;
        break;
      case 'ditolak':
        chipColor = Colors.red;
        iconData = Icons.cancel;
        break;
      default:
        chipColor = Colors.grey;
        iconData = Icons.info;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: chipColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: chipColor, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData, size: 16, color: chipColor),
          const SizedBox(width: 4),
          Text(
            status,
            style: TextStyle(
              color: chipColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _showBalasDialog(BuildContext context, Pengaduan pengaduan) {
    controller.balasanController.clear();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text('Balas Pengaduan'),
        content: TextField(
          controller: controller.balasanController,
          decoration: InputDecoration(
            hintText: 'Tulis balasan...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: Colors.grey[100],
          ),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () => controller.submitBalasan(pengaduan.id),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3BA1FA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Kirim'),
          ),
        ],
      ),
    );
  }

  void _showStatusDialog(BuildContext context, Pengaduan pengaduan) {
    final statuses = [
      {'status': 'Menunggu', 'icon': Icons.hourglass_empty, 'color': Colors.orange},
      {'status': 'Diproses', 'icon': Icons.sync, 'color': Colors.blue},
      {'status': 'Selesai', 'icon': Icons.check_circle, 'color': Colors.green},
      {'status': 'Ditolak', 'icon': Icons.cancel, 'color': Colors.red},
    ];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text('Update Status'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: statuses.map((status) => ListTile(
            leading: Icon(
              status['icon'] as IconData,
              color: status['color'] as Color,
            ),
            title: Text(status['status'] as String),
            tileColor: pengaduan.status == status['status']
              ? (status['color'] as Color).withOpacity(0.1)
              : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            onTap: () => controller.updateStatus(
              pengaduan.id,
              status['status'] as String,
            ),
          )).toList(),
        ),
      ),
    );
  }

  void _showDetailDialog(BuildContext context, Pengaduan pengaduan) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          pengaduan.judul,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow(Icons.person, 'Pengirim', pengaduan.userName),
              _buildDetailRow(Icons.category, 'Kategori', pengaduan.kategori),
              _buildDetailRow(Icons.flag, 'Status', pengaduan.status),
              _buildDetailRow(Icons.calendar_today, 'Tanggal', pengaduan.tanggal),
              const SizedBox(height: 16),
              const Text(
                'Deskripsi:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(pengaduan.deskripsi),
              ),
              if (pengaduan.balasan != null) ...[
                const SizedBox(height: 16),
                const Text(
                  'Balasan:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(pengaduan.balasan!),
                ),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey),
          const SizedBox(width: 8),
          Text(
            '$label:',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 4),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}