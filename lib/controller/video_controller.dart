import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:module_b/app_controller.dart';
import 'package:module_b/screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

final VideoIntroController videoController = VideoIntroController();

class VideoIntroController {
  late VideoPlayerController controller;

  Future<void> init() async {
    controller = VideoPlayerController.networkUrl(
      Uri.parse("http://madkr.tplinkdns.com/video/streaming/100.mp4"),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    await controller.initialize();
    await controller.setLooping(false);
    await controller.setVolume(1);
  }

  void play() async => await controller.play();

  void stop() async => await controller.pause();

  Future<void> videoPlayStop() async => controller.value.isPlaying
      ? await controller.pause()
      : await controller.play();

  void dispose() {
    controller.dispose();
  }

  static const isAppOpenKey = "IS_FIRST_APP_OPEN";

  late bool isOpen;

  Future<void> loadAppOpen() async {
    final shard = await SharedPreferences.getInstance();
    isOpen = shard.getBool(isAppOpenKey) ?? true;
    appController.update();
  }

  Future<void> toHome(
    VideoPlayerController videoController,
    BuildContext context,
  ) async {
    await videoController.pause();
    videoController.dispose();

    final shared = await SharedPreferences.getInstance();

    // 👇 여기서 저장해야 한다
    await shared.setBool(isAppOpenKey, false);

    isOpen = false;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }
}
