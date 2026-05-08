import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:project_mysiswa/page/login.dart';

class Profile extends StatefulWidget {
  final String username;
  const Profile({super.key, required this.username});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  XFile? gambar;

  Future<void> pilihGambar() async {
    final ImagePicker picker = ImagePicker();
    final XFile? picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        gambar = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String email = "${widget.username.toLowerCase()}@gmail.com";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: const Color.fromARGB(255, 23, 23, 23),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    title: Text(
                      "Tombol Keluar",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    content: Text(
                      "Apakah Anda Ingin Keluar?",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                            (route) => false,
                          );
                        },
                        child: Text(
                          "Yes",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "No",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.login_rounded),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 👉 GestureDetector agar foto bisa diklik
            GestureDetector(
              onTap: pilihGambar,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey.shade300,
                backgroundImage: gambar == null
                    ? null
                    : (kIsWeb
                        ? NetworkImage(gambar!.path)
                        : FileImage(File(gambar!.path)) as ImageProvider),
                child: gambar == null
                    ? const Icon(Icons.person,
                        size: 60, color: Colors.white)
                    : null,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.username,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(email),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: pilihGambar,
              child: const Text("Ganti Foto"),
            ),
          ],
        ),
      ),
    );
  }
}
