import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_mart_flutter/app/core/widgets/app_default/app_app_bar.dart';

import '../../../core/constants/app_colors.dart';
import 'cart_screen_controller.dart';

class CartScreenView extends GetView<CartScreenController> {
  const CartScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "Cart",
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
