import 'package:flutter/material.dart';
import 'package:mainproject/conf/theme.dart';
import 'package:mainproject/main.dart';
import 'package:mainproject/pages/income.dart';
import 'package:mainproject/pages/menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 100), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ฉ่ำชา @กุดป่อง"),
        foregroundColor: textLight,
      ),
      body: PageView(
        controller: pageController,
        children: const [
          Menu(),
          Income(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded), label: "เมนู"),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on_outlined), label: "บัญชี"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: selectedItemColor,
        unselectedItemColor: unselectedItemColor,
        onTap: onTapped,
      ),
    );
  }
}
