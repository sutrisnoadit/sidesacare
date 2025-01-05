import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import '../controllers/statistik_controller.dart';

class StatistikView extends GetView<StatistikController> {
  const StatistikView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Statistik Pengaduan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF3BA1FA),
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF3BA1FA)),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => controller.loadStatistics(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 
                    AppBar().preferredSize.height - 
                    MediaQuery.of(context).padding.top,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSummaryCards(),
                  const SizedBox(height: 24),
                  _buildChartSection(),
                  const SizedBox(height: 24),
                  _buildRecentActivity(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildSummaryCards() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: [
        _buildSummaryCard(
          'Total Pengaduan',
          controller.totalPengaduan.toString(),
          Icons.message,
          Colors.blue,
        ),
        _buildSummaryCard(
          'Belum Diproses',
          controller.belumDiproses.toString(),
          Icons.pending_actions,
          Colors.orange,
        ),
        _buildSummaryCard(
          'Sedang Diproses',
          controller.sedangDiproses.toString(),
          Icons.sync,
          Colors.green,
        ),
        _buildSummaryCard(
          'Selesai',
          controller.selesai.toString(),
          Icons.check_circle,
          Colors.purple,
        ),
      ],
    );
  }

  Widget _buildSummaryCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: color),
            const SizedBox(height: 2),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 11,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChartSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Statistik Bulanan',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1.7,
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
                              if (value.toInt() < 0 || value.toInt() >= months.length) {
                                return const Text('');
                              }
                              return Text(months[value.toInt()]);
                            },
                            reservedSize: 30,
                          ),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: controller.monthlyData.map((point) {
                            return FlSpot(point.month.toDouble(), point.count.toDouble());
                          }).toList(),
                          isCurved: true,
                          color: const Color(0xFF3BA1FA),
                          barWidth: 3,
                          dotData: FlDotData(show: true),
                          belowBarData: BarAreaData(
                            show: true,
                            color: const Color(0xFF3BA1FA).withOpacity(0.1),
                          ),
                        ),
                      ],
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildLegendItem('Total Pengaduan', const Color(0xFF3BA1FA)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(label),
      ],
    );
  }

  Widget _buildRecentActivity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Aktivitas Terbaru',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: controller.recentActivities.map((activity) {
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xFF3BA1FA).withOpacity(0.1),
                      child: Icon(
                        _getActivityIcon(activity.type),
                        color: const Color(0xFF3BA1FA),
                        size: 20,
                      ),
                    ),
                    title: Text(activity.description),
                    subtitle: Text(
                      activity.time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  if (activity != controller.recentActivities.last)
                    const Divider(height: 1),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  IconData _getActivityIcon(String type) {
    switch (type) {
      case 'new':
        return Icons.add_circle;
      case 'update':
        return Icons.update;
      case 'resolved':
        return Icons.check_circle;
      default:
        return Icons.info;
    }
  }
}