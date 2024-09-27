import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LoginScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
