import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'signup_screen_controller.dart';

class SignupScreenView extends GetView<SignupScreenController> {
  const SignupScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignupScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SignupScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
