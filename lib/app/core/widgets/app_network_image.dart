import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/helper/app_helper.dart'; // Import if you're using screen utilities

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final String? noImage;
  final Color assetImageColor;
  final double assetWidth, height, width;

  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.noImage,
    this.assetImageColor = Colors.transparent,
    this.assetWidth = 100.0,
    this.height = 100.0,
    this.width = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: CachedNetworkImage(
        imageUrl: AppHelper().validateImageURL(imageUrl),
        width: width.w,
        height: height.w,
        fit: BoxFit.contain,
        progressIndicatorBuilder: (
          context,
          child,
          loadingProgress,
        ) {
          return const Center(child: CircularProgressIndicator.adaptive());
        },
        errorWidget: (
          BuildContext context,
          String url,
          dynamic error,
        ) {
          return SizedBox(
            height: 100.w, // Adjust the height as per your requirement
            width: 100.w, // Adjust the width as per your requirement
            child: Image.asset(
              noImage ?? "", // Provide a default image if specified
              color: assetImageColor,
              height: assetWidth,
              width: assetWidth,
            ),
          );
        },
      ),
    );
  }
}
