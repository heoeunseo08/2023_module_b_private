import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff2699FB),
          title: Center(
            child: Text(
              "설정",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          actions: const [
            SizedBox(width: 48), // 🔥 leading 영역과 동일한 너비
          ],
        ),
        backgroundColor: Colors.white,
        body: Center(child: Text("설정어ㅓㅓㅓㅓㅓㅓ"),),
      ),
    );
  }
}
