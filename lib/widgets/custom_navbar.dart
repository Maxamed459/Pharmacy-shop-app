import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/controllers/home_controller.dart';

class CustomNavbar extends StatelessWidget {
  final HomeController controller;
  const CustomNavbar({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: (i) {
          controller.updatedSelectedindex(i);
        },
        backgroundColor: Colors.grey.shade50,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey.shade600,
        elevation: 0,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart), label: 'cart'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
      );
    });
  }
}
