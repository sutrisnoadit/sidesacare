import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_desa_care/app/routes/app_pages.dart';
import '../controllers/admin_dashboard_controller.dart';

class AdminDashboardView extends GetView<AdminDashboardController> {
  const AdminDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    
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
            icon: const Icon(Icons.logout_outlined, color: Color(0xFF3BA1FA)),
            onPressed: (){
              
            }
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildAdminHeader(screenSize),
            _buildQuickStats(),
            _buildMenuGrid(screenSize),
            _buildRecentActivities(),
          ],
        ),
      ),
    );
  }

  Widget _buildAdminHeader(Size screenSize) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF3BA1FA), Color(0xFF0D47A1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -50,
            top: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    color: Colors.white,
                  ),
                  child: const Icon(Icons.admin_panel_settings, size: 40, color: Color(0xFF3BA1FA)),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Admin',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.white, size: 16),
                          const SizedBox(width: 4),
                          const Text(
                            'Desa Sekarpuro',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStats() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          _buildStatCard('Total User', '12', Icons.person),
          const SizedBox(width: 16),
          _buildStatCard('Total Pengaduan', '8', Icons.message),
          const SizedBox(width: 16),
          _buildStatCard('Pengumuman', '5', Icons.campaign),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: const Color(0xFF3BA1FA), size: 24),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuGrid(Size screenSize) {
    final isTablet = screenSize.width > 600;
    final crossAxisCount = isTablet ? 3 : 2;

    final menuItems = [
      MenuData(Icons.question_answer_outlined, 'Laporan Pengaduan', () => Get.toNamed(Routes.PENGADUANAADMIN)),
      MenuData(Icons.campaign_outlined, 'Pengumuman', () => Get.toNamed(Routes.ADMIN_PENGUMUMAN)),
      MenuData(Icons.bar_chart_sharp, 'Statistik', () => Get.toNamed(Routes.STATISTIK)),
      MenuData(Icons.newspaper, 'Buat Berita', () => Get.to(() => PlaceholderPage(title: 'Informasi'))),
      MenuData(Icons.info, 'Informasi', () =>  Get.toNamed(Routes.INFORMASI)),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.1,
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return _buildMenuItem(menuItems[index]);
        },
      ),
    );
  }

  Widget _buildMenuItem(MenuData menuData) {
    return InkWell(
      onTap: menuData.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF3BA1FA).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(menuData.icon, size: 32, color: const Color(0xFF3BA1FA)),
            ),
            const SizedBox(height: 12),
            Text(
              menuData.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivities() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Aktivitas Terkini',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF3BA1FA).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.history, color: Color(0xFF3BA1FA)),
                  ),
                  title: Text('Aktivitas ${index + 1}'),
                  subtitle: Text('Detail aktivitas ${index + 1}'),
                  trailing: const Text('1 jam yang lalu'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class MenuData {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  MenuData(this.icon, this.title, this.onTap);
}

class PlaceholderPage extends StatelessWidget {
  final String title;

  const PlaceholderPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF3BA1FA),
      ),
      body: Center(
        child: Text(
          '$title Page',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}