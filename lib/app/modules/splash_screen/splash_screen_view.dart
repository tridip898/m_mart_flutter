import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soft_builder/constraints/my_text_style.dart';

import 'splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  controller.appName,
                  style: text20Style(fontSize: 32, isWeight400: true),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
