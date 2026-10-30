import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../models/pengeluaran_model.dart';


class PengeluaranNotifier extends Notifier<List<DompetModel>> {
  @override
  List<DompetModel> build() {
    return [
      DompetModel(icon: Icons.restaurant, title: 'Gacoan', time: '12:30', amount: 15000, color: Colors.orange),
      DompetModel(icon: Icons.directions_bike, title: 'Gojek', time: '07:00', amount: 12000, color: Colors.blue),
      DompetModel(icon: Icons.school, title: 'Print tugas', time: '10:45', amount: 3000, color: Colors.purple),
      DompetModel(icon: Icons.restaurant, title: 'Es teh', time: '12:15', amount: 5000, color: Colors.orange),
      DompetModel(icon: Icons.directions_bike, title: 'Gojek', time: '18:00', amount: 12000, color: Colors.blue),
    ];
  }

  void addTransaction(String title, int amount, String category) {
    IconData icon;
    Color color;
    switch (category) {
      case 'Transportasi':
        icon = Icons.directions_bike;
        color = Colors.blue;
        break;
      case 'Kuliah':
        icon = Icons.school;
        color = Colors.purple;
        break;
      case 'Makanan':
      default:
        icon = Icons.restaurant;
        color = Colors.orange;
        break;
    }

    final newTransaction = DompetModel(
      icon: icon,
      title: title.isEmpty ? category : title,
      time: 'Baru saja',
      amount: amount,
      color: color,
    );

    state = [newTransaction, ...state];

  }

  void deleteTransaction(int index) {
  state = [
    for (int i = 0; i < state.length; i++)
      if (i != index) state[i]
  ];

}

}
final pengeluaranProvider = NotifierProvider<PengeluaranNotifier, List<DompetModel>>(PengeluaranNotifier.new);
final initialBalanceProvider = StateProvider<int>((ref) => 300000);
final remainingBalanceProvider = Provider<int>((ref) {
  final initialBalance = ref.watch(initialBalanceProvider);
  final transactions = ref.watch(pengeluaranProvider);
  int totalExpense = transactions.fold(0, (sum, item) => sum + item.amount);
  return initialBalance - totalExpense;
});

final totalPengeluaranProvider = Provider<int>((ref) {
  final transactions = ref.watch(pengeluaranProvider);
  int total = transactions.fold(0, (sum, item) => sum + item.amount);
  return total;
});