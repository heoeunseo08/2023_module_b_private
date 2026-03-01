import 'package:flutter/material.dart';
import 'package:module_b/app_screen.dart';

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
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff2699FB),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => AppScreen()));
                },
                icon: Icon(Icons.arrow_back, color: Colors.white),
              ),
              Text(
                "설정",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: Center(child: Text("설정어ㅓㅓㅓㅓㅓㅓ")),
      ),
    );
  }
}
