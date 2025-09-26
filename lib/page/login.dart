import 'package:flutter/material.dart';
import 'package:project_mysiswa/page/home.dart';
import 'package:project_mysiswa/page/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController passwordControl = TextEditingController();
  final TextEditingController usernameControl = TextEditingController();
  bool _obscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(26.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🔹 Icon/logo di atas
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blue.shade100,
                child: Icon(Icons.school, size: 50, color: Colors.blue),
              ),
              SizedBox(height: 30),

              // 🔹 Input Username
              TextField(
                controller: usernameControl,
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 20),

              // 🔹 Input Password
              TextField(
                controller: passwordControl,
                obscureText: _obscured,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscured = !_obscured;
                      });
                    },
                    icon: Icon(
                      _obscured ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),

              // 🔹 Tombol Login
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    String username = usernameControl.text;
                    String password = passwordControl.text;

                    if (username == "Wildan" && password == "12345") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(username: username),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Username atau Password salah")),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.all(18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // 🔹 Register link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Belum punya akun?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
