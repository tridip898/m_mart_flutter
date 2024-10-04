import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat_screen_controller.dart';

class ChatScreenView extends GetView<ChatScreenController> {
  const ChatScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ChatScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
