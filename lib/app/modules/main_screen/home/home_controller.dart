import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final searchController = TextEditingController();
  final hours = 0.obs,
      minutes = 0.obs,
      seconds = 0.obs,
      selectedIndex = (-1).obs;

  Timer? timer;

  @override
  void onInit() {
    startCountdown(2);
    super.onInit();
  }

  void startCountdown(int totalHours) {
    int totalSeconds = totalHours * 3600;

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (totalSeconds > 0) {
        totalSeconds--;
        hours.value = totalSeconds ~/ 3600;
        minutes.value = (totalSeconds % 3600) ~/ 60;
        seconds.value = totalSeconds % 60;
      } else {
        timer.cancel();
      }
    });
  }

  void stopCountdown() {
    timer?.cancel();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
