import 'package:flutter/cupertino.dart';

final appController = AppController();

class AppController {
  final updateCount = ValueNotifier(0);

  void update() => updateCount.value++;

  void dispose() => updateCount.dispose();
}
