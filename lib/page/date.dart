import 'package:flutter/material.dart';

class Date extends StatelessWidget {
  const Date({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kalender Akademik"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCard("Kaldik Semester Ganjil 2025"),
            const SizedBox(height: 16),
            _buildCard("Kaldik Semester Genap 2026"),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String text) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade400, Colors.blue.shade700],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            offset: const Offset(0, 6),
            blurRadius: 12,
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
