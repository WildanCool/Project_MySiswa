import 'package:flutter/material.dart';

class TugasPage extends StatefulWidget {
  const TugasPage({super.key});

  @override
  State<TugasPage> createState() => _TugasPageState();
}

class _TugasPageState extends State<TugasPage> {
  List<Map<String, String>> tugas = [];

  void _addTugasDialog() {
    final matpelController = TextEditingController();
    final tugasController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Tambah Tugas"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: matpelController,
                decoration: const InputDecoration(labelText: "Mata Pelajaran"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: tugasController,
                decoration: const InputDecoration(labelText: "Deskripsi Tugas"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                if (matpelController.text.isNotEmpty &&
                    tugasController.text.isNotEmpty) {
                  setState(() {
                    tugas.add({
                      "mapel": matpelController.text,
                      "desc": tugasController.text,
                    });
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tugas Sekolah")),
      body: tugas.isEmpty
          ? const Center(child: Text("Belum ada tugas"))
          : ListView.builder(
              itemCount: tugas.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(tugas[index]['mapel']!),
                    subtitle: Text(tugas[index]['desc']!),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTugasDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
