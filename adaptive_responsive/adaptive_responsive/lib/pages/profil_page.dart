import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  final void Function(bool) onThemeToggle;

  const ProfilPage({super.key, required this.onThemeToggle});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Akun')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Nama: Andi Mahasiswa'),
            const Text('NIM: 12345678'),
            const Text('Email: andi@example.com'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Mode Gelap'),
                Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      isDarkMode = value;
                      widget.onThemeToggle(isDarkMode);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
