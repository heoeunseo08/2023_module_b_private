
import 'package:flutter/material.dart';
import 'package:module_b/app_screen.dart';
import 'package:module_b/controller/video_controller.dart';
import 'package:module_b/screen/video_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await videoController.loadAppOpen();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: videoController.isOpen ? VideoScreen() : AppScreen(),
    );
  }
}
