import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Financial Recorder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
      ),
      home: const HomePage(),
    );
  }
}

class Cards extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const Cards({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.purple),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, 
                style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle, 
                style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
                      CircleAvatar(
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

class CttPengeluaran extends StatefulWidget {
  const CttPengeluaran({super.key});

  @override
  State<CttPengeluaran> createState() => _CttPengeluaranState();
}

class _CttPengeluaranState extends State<CttPengeluaran> {
  String selectedKategori = 'Makan';
  final TextEditingController _nominalController = TextEditingController();
  final TextEditingController _catatanController = TextEditingController();

  @override
  void dispose() {
    _nominalController.dispose();
    _catatanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(78, 190, 13, 182),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Tambah Pengeluaran', 
          style: TextStyle(color: Colors.black, fontSize: 16)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nominal', 
              style: TextStyle(color: Colors.grey, fontSize: 12)),
            TextField(
              controller: _nominalController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                fontSize: 28, 
                fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                prefixText: 'Rp ',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: '0',
                border: InputBorder.none,
              ),
            ),
            const Divider(thickness: 1),
            const SizedBox(height: 20),
            const Text('Kategori', style: TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 10),
            Row(
              children: [
                Pilih(label: 'Makan', icon: Icons.restaurant, isSelected: selectedKategori == 'Makan', onTap: () => setState(() => selectedKategori = 'Makan')),
                const SizedBox(width: 8),
                Pilih(label: 'Transport', icon: Icons.directions_bike, isSelected: selectedKategori == 'Transport', onTap: () => setState(() => selectedKategori = 'Transport')),
                const SizedBox(width: 8),
                Pilih(label: 'Kuliah', icon: Icons.school, isSelected: selectedKategori == 'Kuliah', onTap: () => setState(() => selectedKategori = 'Kuliah')),
              ],
            ),

            const SizedBox(height: 8),
            Pilih(label: 
            'Lainnya', 
            icon: Icons.more_horiz, isSelected: selectedKategori == 'Lainnya', onTap: () => setState(() => selectedKategori = 'Lainnya')),
          
            const SizedBox(height: 24),
            const Text(
              'Catatan', 
              style: TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 8),
            TextField(
              controller: _catatanController,
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8)),
                hintText: 'Masukkan keterangan...',
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(78, 190, 13, 182),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Simpan', 
                  style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

class Pilih extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const Pilih({
    super.key, 
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
          Icon(icon, size: 16, color: 
          isSelected ? Colors.white : Colors.black),
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