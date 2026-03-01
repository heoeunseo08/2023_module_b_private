import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:module_b/controller/home_controller.dart';
import 'package:module_b/screen/setting_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController controller;

  @override
  void initState() {
    super.initState();
    hdstController.loadHdst();
    controller = PageController(initialPage: 2000);
    setState(() {});
  }

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
                    onTap: () async {
                      log("백년가게ㅐ");
                      await launchUrl(
                        Uri.parse("https://www.sbiz.or.kr/hdst/"),
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
                    width: double.infinity,
                    color: Color(0xffF5F5F5),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "전국의 백년가게",
                          style: TextStyle(
                            color: Color(0xff2699FB),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 350,
                          child: hdstController.hdstList.isEmpty
                              ? Center(child: CircularProgressIndicator())
                              : PageView.builder(
                                  controller: controller,
                                  itemBuilder: (context, index) {
                                    final item =
                                        hdstController.hdstList[index %
                                            hdstController.hdstList.length];
                                    return Column(
                                      children: [
                                        Image.network(
                                          "http://madkr.tplinkdns.com/resource/img/hdst/${item.repesntFileNm}",
                                          width: 300,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          item.hdstNm,
                                          style: TextStyle(
                                            color: Color(0xff2699FB),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                        ),
                      ],
                    ),
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
