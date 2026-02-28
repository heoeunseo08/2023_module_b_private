import 'package:flutter/material.dart';
import 'package:module_b/app_screen.dart';
import 'package:module_b/screen/video_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VideoScreen(),
    );
  }
}
