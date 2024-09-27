import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'profile_completion_screen_controller.dart';

class ProfileCompletionScreenView
    extends GetView<ProfileCompletionScreenController> {
  const ProfileCompletionScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileCompletionScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileCompletionScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
