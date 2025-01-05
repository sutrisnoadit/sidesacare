import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../controllers/layanan_pengajuan_surat_admin_controller.dart';


class LayananPengajuanSuratAdminView
    extends GetView<LayananPengajuanSuratAdminController> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blue.shade400, Colors.blue.shade800],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Icon(Icons.admin_panel_settings, color: Colors.white, size: 40),
                    Text('Layanan Admin',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverHeaderDelegate(
              child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    children: ['Semua', 'Pending', 'Accepted', 'Rejected']
                        .map((filter) => Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: Obx(() => FilterChip(
                                    selected: controller.selectedFilter.value == filter,
                                    label: Text(filter),
                                    onSelected: (selected) {
                                      controller.selectedFilter.value = filter;
                                    },
                                    backgroundColor: Colors.grey.shade200,
                                    selectedColor: Colors.blue.shade100,
                                  )),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
          Obx(() => SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final letter = controller.filteredLetters[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: _buildLetterCard(letter, context),
                    );
                  },
                  childCount: controller.filteredLetters.length,
                ),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildLetterCard(Map<String, dynamic> letter, BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: BehindMotion(),
        children: [
          CustomSlidableAction(
            onPressed: (context) {
              controller.updateLetterStatus(letter['id'], 'accepted');
            },
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle_outline, size: 24),
                SizedBox(height: 4),
                Text('Terima', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
          CustomSlidableAction(
            onPressed: (context) {
              controller.updateLetterStatus(letter['id'], 'pending');
            },
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.pending_outlined, size: 24),
                SizedBox(height: 4),
                Text('Pending', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
          CustomSlidableAction(
            onPressed: (context) {
              controller.updateLetterStatus(letter['id'], 'rejected');
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.cancel_outlined, size: 24),
                SizedBox(height: 4),
                Text('Tolak', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
      child: Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () => _showLetterDetail(context, letter),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      letter['title'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _buildStatusChip(letter['status']),
                ],
              ),
              SizedBox(height: 8),
              Text(
                letter['description'],
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.access_time, size: 16, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(
                    DateTime.parse(letter['date']).toString().split(' ')[0],
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  SizedBox(width: 16),
                  Icon(Icons.folder_outlined, size: 16, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(
                    letter['type'],
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color color;
    String text;
    IconData icon;

    switch (status) {
      case 'accepted':
        color = Colors.green;
        text = 'Diterima';
        icon = Icons.check_circle;
        break;
      case 'pending':
        color = Colors.orange;
        text = 'Proses';
        icon = Icons.pending;
        break;
      case 'rejected':
        color = Colors.red;
        text = 'Ditolak';
        icon = Icons.cancel;
        break;
      default:
        color = Colors.grey;
        text = 'Unknown';
        icon = Icons.help;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          SizedBox(width: 4),
          Text(text,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _showLetterDetail(BuildContext context, Map<String, dynamic> letter) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Detail Surat',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(letter['title'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildDetailRow('Jenis Surat', letter['type']),
                    _buildDetailRow('Status', _getStatusText(letter['status'])),
                    _buildDetailRow('Tanggal', DateTime.parse(letter['date']).toString().split(' ')[0]),
                    SizedBox(height: 16),
                    Text('Deskripsi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(letter['description'],
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              controller.updateLetterStatus(letter['id'], 'accepted');
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.check),
                            label: Text('Terima'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              controller.updateLetterStatus(letter['id'], 'rejected');
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close),
                            label: Text('Tolak'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(label,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Text(value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'accepted':
        return 'Diterima';
      case 'pending':
        return 'Proses';
      case 'rejected':
        return 'Ditolak';
      default:
        return 'Unknown';
    }
  }
}

class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _SliverHeaderDelegate({required this.child});

  @override
  double get minExtent => 60.0;

  @override
  double get maxExtent => 60.0;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }

  @override
  bool shouldRebuild(_SliverHeaderDelegate oldDelegate) => false;
}
