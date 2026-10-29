import 'package:flutter/material.dart';
import 'package:saldopengeluaran/widgets/pilih.dart';


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
