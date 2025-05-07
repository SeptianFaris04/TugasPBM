import 'package:flutter/material.dart';

class JadwalPage extends StatelessWidget {
  const JadwalPage({super.key});

  final List<Map<String, String>> jadwal = const [
    {'hari': 'Senin', 'mataKuliah': 'Matematika - 08:00'},
    {'hari': 'Selasa', 'mataKuliah': 'Fisika - 10:00'},
    {'hari': 'Rabu', 'mataKuliah': 'Kimia - 13:00'},
    {'hari': 'Kamis', 'mataKuliah': 'Biologi - 09:00'},
    {'hari': 'Jumat', 'mataKuliah': 'Bahasa Inggris - 11:00'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jadwal Kuliah')),
      body: ListView(
        children:
            jadwal.map((item) {
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(item['hari']!),
                  subtitle: Text(item['mataKuliah']!),
                ),
              );
            }).toList(),
      ),
    );
  }
}
