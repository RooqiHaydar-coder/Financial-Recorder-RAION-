import 'package:flutter/material.dart';

class DompetModel {
  final IconData icon;
  final String title;
  final String time;
  final int amount;
  final Color color;

  DompetModel({
    required this.icon,
    required this.title,
    required this.time,
    required this.amount,
    required this.color,
  });
}