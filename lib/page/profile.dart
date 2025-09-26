import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String username;
  const Profile({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    String email = "${username.toLowerCase()}@gmail.com";
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              username,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            Text(email),
          ],
        ),
      ),
    );
  }
}
