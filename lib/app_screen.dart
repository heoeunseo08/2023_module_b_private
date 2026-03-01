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

  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff2699FB),
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(color: Colors.white, fontSize: 14),
        unselectedItemColor: Color(0xffB3DBFD),
        unselectedLabelStyle: TextStyle(color: Color(0xffB3DBFD), fontSize: 14),
        currentIndex: currentIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "홈"),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: "백년가게",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "검색"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "좋아요",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: "설정"),
        ],
      ),
    );
  }
}
