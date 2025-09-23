import 'package:flutter/material.dart';

class JadwalPage extends StatelessWidget {
  const JadwalPage({super.key});

  final Map<String, List<String>> jadwal = const {
    "Senin": ["Matematika", "Bahasa Indonesia", "IPA"],
    "Selasa": ["IPS", "Bahasa Inggris", "PJOK"],
    "Rabu": ["Agama", "Seni Budaya", "Matematika"],
    "Kamis": ["Fisika", "Kimia", "Biologi"],
    "Jumat": ["Prakarya", "Pendidikan Pancasila", "Sejarah"],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Jadwal Sekolah")),
      body: ListView(
        children: jadwal.entries.map((entry) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(entry.key),
              subtitle: Text(entry.value.join(", ")),
            ),
          );
        }).toList(),
      ),
    );
  }
}
