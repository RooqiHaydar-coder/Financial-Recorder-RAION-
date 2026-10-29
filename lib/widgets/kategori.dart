import 'package:flutter/material.dart';

class KategoriItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const KategoriItem({
    super.key, 
    required this.icon, 
    required this.label, 
    required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25, 
          backgroundColor: color.withValues(alpha: 0.2), 
          child: Icon(icon, color: color)),
        const SizedBox(height: 6),
        Text(
          label, 
          style: const TextStyle(
            fontSize: 12)),
      ],
    );
  }
}
