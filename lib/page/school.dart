import 'package:flutter/material.dart';
import 'catatan_page.dart';
import 'jadwal_page.dart';
import 'tugas_page.dart';

class School1 extends StatelessWidget {
  const School1({super.key});

  Widget _buildButton(BuildContext context, String text, Widget page) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "School",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildButton(context, "Catatan", const CatatanPage()),
            const SizedBox(height: 16),
            _buildButton(context, "Jadwal Sekolah", const JadwalPage()),
            const SizedBox(height: 16),
            _buildButton(context, "Tugas Sekolah", const TugasPage()),
          ],
        ),
      ),
    );
  }
}
