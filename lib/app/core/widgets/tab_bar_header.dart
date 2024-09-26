import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';

class TabBarHeader extends StatelessWidget {
  final Function(int)? onTap;
  final List<String> tabTitles;
  final int selectedIndex;

  const TabBarHeader({
    super.key,
    this.onTap,
    required this.tabTitles,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.05,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: AppColor.grey.withOpacity(0.6),
          )),
      child: TabBar(
        onTap: onTap,
        labelColor: AppColor.appBarTextColor,
        unselectedLabelColor: Colors.grey,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: AppColor.plantPrimaryColor,
        ),
        tabs: List<Widget>.generate(tabTitles.length, (index) {
          return Tab(
            child: Text(
              tabTitles[index],
              style: TextStyle(
                color: index == selectedIndex ? AppColor.white : Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }),
      ),
    );
  }
}
