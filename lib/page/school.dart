import 'package:flutter/material.dart';
import 'catatan_page.dart';
import 'jadwal_page.dart';
import 'tugas_page.dart';

class School1 extends StatelessWidget {
  const School1({super.key});

  Widget _buildButton(BuildContext context, String text, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.blue[600],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("School")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildButton(context, "Catatan", const CatatanPage()),
            _buildButton(context, "Jadwal Sekolah", const JadwalPage()),
            _buildButton(context, "Tugas Sekolah", const TugasPage()),
          ],
        ),
      ),
    );
  }
}
