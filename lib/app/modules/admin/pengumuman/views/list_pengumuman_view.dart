import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../controllers/admin_pengumuman_controller.dart';

class ListPengumumanView extends StatelessWidget {
  const ListPengumumanView({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminPengumumanController controller =
        Get.put(AdminPengumumanController());
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'SiDesa Care',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
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
                  child: const Icon(Icons.list_outlined,
                      size: 50, color: Colors.white),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Text(
                    'List Pengumuman',
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
            child: Obx(
              () {
                final pengumumanList = controller.pengumumanList;

                return ListView.builder(
                  itemCount: pengumumanList.length,
                  itemBuilder: (context, index) {
                    final item = pengumumanList[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Slidable(
                        key: ValueKey(item['title']),
                        endActionPane: ActionPane(
                          motion: const DrawerMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                _showEditDialog(context, controller, item);
                              },
                              backgroundColor: Colors.blueAccent,
                              foregroundColor: Colors.white,
                              icon: Icons.edit,
                              label: 'Edit',
                            ),
                            SlidableAction(
                              onPressed: (context) {
                                _showDeleteConfirmation(
                                    context, controller, item);
                              },
                              backgroundColor: Colors.redAccent,
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                          ],
                        ),
                        child: Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                colors: [Colors.white, Colors.blue.shade50],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 20),
                              title: Text(
                                item['title'] ?? '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              subtitle: Text(item['location'] ?? '',
                                  style: TextStyle(color: Colors.grey[600])),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.blue.shade700,
                              ),
                              leading: const CircleAvatar(
                                backgroundColor: Colors.blueAccent,
                                child:  Icon(Icons.announcement,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Show Edit Dialog
  void _showEditDialog(BuildContext context,
      AdminPengumumanController controller, Map<String, dynamic> item) {
    TextEditingController titleController =
        TextEditingController(text: item['title']);
    TextEditingController locationController =
        TextEditingController(text: item['location']);
    TextEditingController detailController =
        TextEditingController(text: item['detail']);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Pengumuman'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: locationController,
                decoration: const InputDecoration(labelText: 'Location'),
              ),
              TextField(
                controller: detailController,
                decoration: const InputDecoration(labelText: 'Detail'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                controller.updatePengumuman(item, titleController.text,
                    locationController.text, detailController.text);
                Get.snackbar('Saved', 'Pengumuman updated successfully!');
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmation(BuildContext context,
      AdminPengumumanController controller, Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Pengumuman'),
          content: Text('Are you sure you want to delete "${item['title']}"?'),
          actions: [
            TextButton(
              onPressed: () {
                controller.deletePengumuman(item);
                Get.snackbar(
                    'Deleted', 'Pengumuman "${item['title']}" deleted!');
                Navigator.pop(context);
              },
              child: const Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
