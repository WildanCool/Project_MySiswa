import 'package:flutter/material.dart';

class CatatanPage extends StatefulWidget {
  const CatatanPage({super.key});

  @override
  State<CatatanPage> createState() => _CatatanPageState();
}

class _CatatanPageState extends State<CatatanPage> {
  List<Map<String, String>> notes = [];

  void _addNoteDialog() {
    final titleController = TextEditingController();
    final descController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title:  Text(
            "Tambah Catatan",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: "Judul Catatan",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
               SizedBox(height: 12),
              TextField(
                controller: descController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: "Deskripsi",
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
              child:  Text("Batal", style: TextStyle(color: Colors.red)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    descController.text.isNotEmpty) {
                  setState(() {
                    notes.add({
                      "title": titleController.text,
                      "desc": descController.text,
                    });
                  });
                  Navigator.pop(context);
                }
              },
              child:  Text(
                "Simpan",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Catatan"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: notes.isEmpty
          ?  Center(
              child: Text(
                "Belum ada catatan",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  margin:  EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    leading:  Icon(Icons.note, color: Colors.blue),
                    title: Text(
                      notes[index]['title']!,
                      style:  TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(notes[index]['desc']!),
                    trailing: IconButton(
                      icon:  Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteNote(index),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: _addNoteDialog,
        child:  Icon(Icons.add),
      ),
    );
  }
}
