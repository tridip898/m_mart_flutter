import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/app_default/app_app_bar.dart';
import 'favorite_screen_controller.dart';

class FavoriteScreenView extends GetView<FavoriteScreenController> {
  const FavoriteScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "Favorite",
        titleColor: AppColor.black,
      ),
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
