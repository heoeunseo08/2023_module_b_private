import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:module_b/screen/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            ?_buildAppBar(),
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      log("백년가게ㅐ");
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SettingScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      color: Color(0xffF0F8FE),
                      alignment: Alignment.center,
                      child: Text(
                        "2023 년 백년가게 신청",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff2699FB),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Color(0xffF1F9FF),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    child: Column(children: []),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverAppBar? _buildAppBar() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      backgroundColor: Color(0xff2699FB),
      expandedHeight: 150,
      elevation: 0,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final max = constraints.maxHeight;
          final min = kToolbarHeight;
          double percent = (max - min) / (150 - min);
          percent = percent.clamp(0.0, 1.0);

          return Container(
            alignment: Alignment.center,
            child: Image.asset("assets/logo.png", height: 70 + (100 * percent)),
          );
        },
      ),
    );
  }
}
