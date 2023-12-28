import 'package:flutter/material.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/pages/home_page.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/pages/profile_page.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedIndex = 0;
  List pages = [const HomePage(), const ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 34,
        selectedFontSize: 10,
        elevation: 10,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: const Color(0xFF1570EF),
      ),
      body: pages[selectedIndex],
    );
  }
}
