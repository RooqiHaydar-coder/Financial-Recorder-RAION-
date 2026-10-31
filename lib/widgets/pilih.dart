import 'package:flutter/material.dart';

class Pilih extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const Pilih({super.key, 
  required this.label, 
  required this.icon, 
  required this.isSelected, 
  required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: isSelected ? Colors.white : Colors.black),
          const SizedBox(width: 6),
          Text(label),
        ],
      ),
      selected: isSelected,
      selectedColor: const Color.fromARGB(78, 190, 13, 182),
      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
      backgroundColor: Colors.white,
      onSelected: (selected) => onTap(),
    );
  }
}
