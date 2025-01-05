import 'package:flutter/material.dart';

class CardMaster extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon;  
  const CardMaster({
    Key? key,
    required this.title,
    required this.onTap,
    this.icon = Icons.description,   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        ),
        child: ListTile(
          leading: Icon(
            icon,  
            color: Colors.blue,
            size: 36,
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
