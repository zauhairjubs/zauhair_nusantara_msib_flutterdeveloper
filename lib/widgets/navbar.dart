import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/pages/add_page.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/pages/home_page.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/pages/profile_page.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/theme.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedIndex = 0;
  List pages = [const HomePage(), const AddPage(), const ProfilePage()];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        iconSize: screenHeight * 0.046,
        selectedFontSize: screenHeight * 0.018,
        elevation: 10,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.home_max_rounded), label: "Beranda"),
          BottomNavigationBarItem(
              label: "",
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: yellowColor,
                    borderRadius: BorderRadius.circular(100)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  splashColor: blueColor,
                  onTap: () => Get.to(() => const AddPage()),
                  child: const Icon(
                    Icons.add_rounded,
                    color: whiteColor,
                  ),
                ),
              )),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: "Profile")
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: blueColor,
      ),
      body: pages[selectedIndex],
    );
  }
}
