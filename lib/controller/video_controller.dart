import 'package:video_player/video_player.dart';

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

  void dispose(){
    controller.dispose();
  }
}
