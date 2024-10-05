import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/app_default/app_app_bar.dart';
import 'chat_screen_controller.dart';

class ChatScreenView extends GetView<ChatScreenController> {
  const ChatScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "Chat",
        titleColor: AppColor.black,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
