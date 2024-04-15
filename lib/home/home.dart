import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../controllers/bottomController.dart';

class MyHomePage extends StatelessWidget {
  final BottomNavController bottomNavController =
      Get.put(BottomNavController());

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (bottomNavController.currentIndex.value == 0) {
          return const Center(
            child: Text('Home Page'),
          );
        } else if (bottomNavController.currentIndex.value == 1) {
          return const Center(
            child: Text('History'),
          );
        } else if (bottomNavController.currentIndex.value == 2) {
          return const Center(
            child: Text('Payments'),
          );
        } else if (bottomNavController.currentIndex.value == 3) {
          return const Center(
            child: Text('Settings'),
          );
        } else {
          return const Center(
            child: Text('Home Page'),
          );
        }
      }),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
              onTabChange: (value) {
                bottomNavController.currentIndex.value = value;
                bottomNavController.changePage(value);
              },
              color: Colors.white,
              activeColor: Colors.white,
              backgroundColor: Colors.black,
              tabBackgroundColor: const Color.fromARGB(75, 158, 158, 158),
              padding: const EdgeInsets.all(16),
              gap: 10,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.history,
                  text: 'History',
                ),
                GButton(
                  icon: Icons.payments,
                  text: 'Payments',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                ),
              ]),
        ),
      ),
    );
  }
}
