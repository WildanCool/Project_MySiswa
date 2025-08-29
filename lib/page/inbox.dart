import 'package:flutter/material.dart';

class Inbox extends StatelessWidget {
  const Inbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text("Inbox", style: TextStyle(color: Colors.green)),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.notifications_off, size: 50, color: Colors.grey),
            SizedBox(height: 10),
            Text("Tidak Ada Notifikasi"),
          ],
        ),
      ),
    );
  }
}
