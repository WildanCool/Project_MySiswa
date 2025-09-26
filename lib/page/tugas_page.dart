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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            "Tambah Tugas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: matpelController,
                decoration: InputDecoration(
                  labelText: "Mata Pelajaran",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: tugasController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: "Deskripsi Tugas",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Batal", style: TextStyle(color: Colors.red)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
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
              child: Text("Simpan", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  void _deleteTugas(int index) {
    setState(() {
      tugas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas Sekolah"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: tugas.isEmpty
          ? Center(
              child: Text(
                "Belum ada tugas",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: tugas.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: Icon(Icons.book, color: Colors.blue),
                    title: Text(
                      tugas[index]['mapel']!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(tugas[index]['desc']!),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteTugas(index),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: _addTugasDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
