import 'package:flutter/material.dart';
import 'package:project_mysiswa/page/date.dart';
import 'package:project_mysiswa/page/inbox.dart';
import 'package:project_mysiswa/page/profile.dart';
import 'package:project_mysiswa/page/school.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Beranda", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Inbox()),
              );
            },
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Assalamu'alaikum ${widget.username}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Center(
                      child: Text(
                        "Semoga harimu menyenangkan 🌸",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            
            Text(
              "Menu Utama",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              shrinkWrap: true,
              // physics:  NeverScrollableScrollPhysics(),
              children: [
                _buildMenuCard(context, Icons.school, "Sekolah", School1()),
                _buildMenuCard(
                  context,
                  Icons.calendar_month,
                  "Kalender",
                  Date(),
                ),
                _buildMenuCard(
                  context,
                  Icons.person,
                  "Profil",
                  Profile(username: "User123"),
                ),
                _buildMenuCard(context, Icons.note, "Inbox", Inbox()),
              ],
            ),
          ],
        ),
      ),

     
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: Icon(Icons.camera_alt, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

 
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.home, color: Colors.white),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => School1()),
                );
              },
              icon: Icon(Icons.school, color: Colors.white),
            ),
            SizedBox(width: 30),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Date()),
                );
              },
              icon: Icon(Icons.calendar_month, color: Colors.white),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(username: widget.username),
                  ),
                );
              },
              icon: Icon(Icons.person, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildMenuCard(
    BuildContext context,
    IconData icon,
    String label,
    Widget page,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
