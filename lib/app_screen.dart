import 'package:flutter/material.dart';
import 'package:module_b/screen/heart_screen.dart';
import 'package:module_b/screen/home_screen.dart';
import 'package:module_b/screen/search_screen.dart';
import 'package:module_b/screen/setting_screen.dart';
import 'package:module_b/screen/store_screen.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    StoreScreen(),
    SearchScreen(),
    HeartScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "홈")],
        items: [BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "백년가게")],
        items: [BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "검색")],
        items: [BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "좋아요")],
        items: [BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "설정")],
      ),
    );
  }
}
