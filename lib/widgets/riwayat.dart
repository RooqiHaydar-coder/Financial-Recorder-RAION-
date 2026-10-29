import 'package:flutter/material.dart';

class Riwayat extends StatelessWidget {
  final IconData icon;
  final String title;
  final String time;
  final String amount;
  final Color color;

  const Riwayat({
    super.key, 
    required this.icon, 
    required this.title, 
    required this.time, 
    required this.amount, 
    required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          CircleAvatar(radius: 20, 
          backgroundColor: color.withValues(alpha: 0.2), 
          child: Icon(icon, color: color, size: 20)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: 
                const TextStyle(
                  fontWeight: FontWeight.bold)),
                Text(time, style: 
                const TextStyle(
                  color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Text(amount, style: 
          const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black87)),
        ],
      ),
    );
  }
}
