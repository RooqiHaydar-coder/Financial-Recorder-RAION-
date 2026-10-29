import 'package:flutter/material.dart';
import 'package:saldopengeluaran/pages/pengeluaran.dart';
import 'package:saldopengeluaran/widgets/kartu.dart';
import 'package:saldopengeluaran/widgets/kategori.dart';
import 'package:saldopengeluaran/widgets/riwayat.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Profil
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
                        children: const [
                          Text('Selamat pagi,',
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                          Text('Rooqi', 
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                  color: const Color.fromARGB(255, 144, 63, 181),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                    color: const Color.fromARGB(255, 144, 63, 181).withValues(alpha: 0.4), 
                    blurRadius: 15, 
                    spreadRadius: 2,
                    offset: const Offset(0, 8), 
                  ),
                ],
              ) ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sisa saldo', 
                      style: TextStyle(color: Colors.white70, fontSize: 14)),
                    const SizedBox(height: 8),
                    const Text(
                      'Rp 250.000',
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  KategoriItem(icon: Icons.restaurant, label: 'Makan', color: Colors.orange),
                  KategoriItem(icon: Icons.directions_bike, label: 'Transport', color: Colors.blue),
                  KategoriItem(icon: Icons.school, label: 'Kuliah', color: Colors.purple),
                  KategoriItem(icon: Icons.more_horiz, label: 'Lainnya', color: Colors.grey),
                ],
              ),
              const SizedBox(height: 24),

              const Text('Highlight', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 12),
              const Cards(icon: Icons.trending_down, title: 'Pengeluaran Hari Ini', subtitle: 'Rp.47.000 tercatat'),
              const SizedBox(height: 8),
              const Cards(icon: Icons.account_balance_wallet, title: 'Total TopUp', subtitle: 'Rp.200.000'),
              const SizedBox(height: 8),
              const Cards(icon: Icons.savings, title: 'Target Tabungan Bulan Ini', subtitle: 'Rp.300.000'),
              const SizedBox(height: 24),

              const Text(
                'Riwayat', 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 12),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  Riwayat(icon: Icons.restaurant, title: 'Gacoan', time: '12:30', amount: '-Rp15.000', color: Colors.orange),
                  Riwayat(icon: Icons.directions_bike, title: 'Gojek', time: '07:00', amount: '-Rp12.000', color: Colors.blue),
                  Riwayat(icon: Icons.school, title: 'Print tugas', time: '10:45', amount: '-Rp3.000', color: Colors.purple),
                  Riwayat(icon: Icons.local_cafe, title: 'Es teh', time: '12:15', amount: '-Rp5.000', color: Colors.brown),
                  Riwayat(icon: Icons.directions_bike, title: 'Gojek', time: '18:00', amount: '-Rp12.000', color: Colors.blue),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}