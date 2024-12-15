import 'package:flutter/material.dart';
class SuratCard extends StatelessWidget {
  final String title;
  final String status;
  final Color color;

  const SuratCard({
    Key? key,
    required this.title,
    required this.status,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: const Icon(
          Icons.description,
          color: Colors.blue,
          size: 36,
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            status,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}