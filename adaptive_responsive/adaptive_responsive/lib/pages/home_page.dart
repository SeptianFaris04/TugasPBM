import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _kegiatan = [
    {'nama': 'Rapat BEM', 'tanggal': '2025-05-08', 'selesai': false},
    {'nama': 'Presentasi Proyek', 'tanggal': '2025-05-09', 'selesai': false},
    {'nama': 'Kuliah Umum', 'tanggal': '2025-05-10', 'selesai': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Kegiatan')),
      body: ListView.builder(
        itemCount: _kegiatan.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_kegiatan[index]['nama']),
            subtitle: Text('Tanggal: ${_kegiatan[index]['tanggal']}'),
            trailing: Checkbox(
              value: _kegiatan[index]['selesai'],
              onChanged: (val) {
                setState(() {
                  _kegiatan[index]['selesai'] = val!;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
