import 'dart:convert';

import 'package:http/http.dart';
import 'package:module_b/app_controller.dart';
import 'package:module_b/model/hdst_model.dart';

final String url = "http://madkr.tplinkdns.com/api";

final HdstController hdstController = HdstController();
class HdstController {
  List<HdstModel> hdstList = [];

  Future<void> loadHdst() async {
    final response = await get(Uri.parse("$url/home"));

    hdstList = (jsonDecode(response.body)['data1']['hdstList'] as List<dynamic>)
        .map((e) => HdstModel.fromJson(e))
        .toList();
    appController.update();

    print('${response.body}');
  }
}

