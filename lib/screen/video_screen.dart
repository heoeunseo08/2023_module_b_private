import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:module_b/controller/video_controller.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    videoController.init().then((value) {
      videoController.controller.addListener(videoListener);
      videoController.play();
      setState(() {});
    });
  }

  void videoListener() {
    final controller = videoController.controller;
    final duration = controller.value.duration;
    final position = controller.value.position;

    if (!isPlaying && position == duration) {
      log("홈으로");
      videoController.toHome(controller, context);
    }
  }

  @override
  void dispose() {
    videoController.controller.removeListener(videoListener);
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = videoController.controller;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: !controller.value.isInitialized
            ? Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Image.asset("assets/logo.png", width: 180),
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Stack(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: videoController.videoPlayStop,
                          child: AspectRatio(
                            aspectRatio: controller.value.aspectRatio,
                            child: VideoPlayer(controller),
                          ),
                        ),

                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: _videoSeek(),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    color: Color(0xffF0F8FE),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    child: GestureDetector(
                      onTap: () {
                        log("홈으로");
                        videoController.toHome(controller, context);
                      },
                      child: Container(
                        color: Color(0xff2699FB),
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "홈으로",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _videoSeek() {
    return ValueListenableBuilder<VideoPlayerValue>(
      valueListenable: videoController.controller,
      builder: (context, value, child) {
        final dur = value.duration;
        final pos = value.position;

        double seek = dur.inMilliseconds == 0
            ? 0.0
            : pos.inMilliseconds / dur.inMilliseconds;

        return Slider(
          activeColor: Colors.red,
          value: seek.clamp(0.0, 1.0),
          padding: EdgeInsets.zero,
          min: 0,
          max: 1,
          onChanged: (value) {
            videoController.controller.seekTo(dur * value);
          },
        );
      },
    );
  }
}
