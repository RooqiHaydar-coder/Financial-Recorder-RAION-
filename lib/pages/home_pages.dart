import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saldopengeluaran/pages/pengeluaran.dart';
import 'package:saldopengeluaran/providers/keuangan_provider.dart';
import 'package:saldopengeluaran/widgets/kartu.dart';
import 'package:saldopengeluaran/widgets/kategori.dart';
import 'package:saldopengeluaran/widgets/riwayat.dart';
import 'package:saldopengeluaran/formats/mata_uang.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sisaSaldo = ref.watch(remainingBalanceProvider);
    final riwayatList = ref.watch(pengeluaranProvider);
    final totalPengeluaran = ref.watch(totalPengeluaranProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/profiles.jpg'),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Selamat pagi,', style: TextStyle(color: Colors.grey, fontSize: 12)),
                          Text('Rooqi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_outlined),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.blueAccent, Colors.purpleAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Sisa Saldo', style: TextStyle(color: Colors.white70, fontSize: 14)),
                    const SizedBox(height: 8),
                    Text( MataUang.convertToIdr(sisaSaldo, 0), style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF3F51B5),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CttPengeluaran()),
                          );
                        },
                        child: const Text('+ Catat Pengeluaran'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text('Kategori', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 12),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  KategoriItem(icon: Icons.restaurant, label: 'Makan/Minum', color: Colors.orange),
                  KategoriItem(icon: Icons.directions_bike, label: 'Transportasi', color: Colors.blue),
                  KategoriItem(icon: Icons.school, label: 'Kuliah', color: Colors.purple),
                  KategoriItem(icon: Icons.more_horiz, label: 'Lainnya', color: Colors.grey),
                ],
              ),
              const SizedBox(height: 24),
              const Text('Catatan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 12),
                   GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2.6,
                    children: [
                      Cards(
                        icon: Icons.trending_down,
                        title: 'Pengeluaran Hari Ini',
                        subtitle: '${MataUang.convertToIdr(totalPengeluaran, 0)} tercatat',
                      ),
                      const Cards(
                        icon: Icons.account_balance_wallet,
                        title: 'Total TopUp',
                        subtitle: 'Rp.200.000',
                      ),
                    ],
                  ),
                const SizedBox(height: 10),
                const Cards(
                    icon: Icons.savings,
                    title: 'Target Tabungan Bulan Ini',
                    subtitle: 'Rp.300.000',
                  ),
                const SizedBox(height: 24),
                const Text('Riwayat', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 12),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: riwayatList.length,
                itemBuilder: (context, index) {
                  final item = riwayatList[index];
                  return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart, // Geser ke kiri untuk hapus
                  background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.red,
                  child: const Icon(Icons.delete, color: Colors.white),
                  ),

                  onDismissed: (direction) {
                    ref.read(pengeluaranProvider.notifier).deleteTransaction(index);
                  },
                  child: RiwayatWidget(
                    icon: item.icon,
                    title: item.title,
                    time: item.time,
                    amount: item.amount,
                    color: item.color,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}
}