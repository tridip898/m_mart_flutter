import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/asset_constants.dart';
import '../utils/helper/app_helper.dart';

class AppCircleNetworkImageViewer extends StatelessWidget {
  final String? imagePath, assetImage;
  final double width, assetWidth;
  final Color? assetImageColor;

  const AppCircleNetworkImageViewer(this.imagePath,
      this.width, {
        super.key,
        this.assetImage,
        this.assetImageColor,
        this.assetWidth = 50,
      });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: (width / 2),
      backgroundColor: Colors.white,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: AppHelper().validateImageURL(imagePath ?? ""),
          height: width,
          width: width,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context,
              child,
              loadingProgress,) {
            return const CircularProgressIndicator.adaptive();
          },
          errorWidget: (BuildContext context,
              String url,
              dynamic error,) {
            return SizedBox(
              height: width,
              width: width,
              child: Image.asset(
                assetImage ?? "",
                color: assetImageColor,
                height:assetWidth,
                width:assetWidth,
              ),
            );
          },
        ),
      ),
    );
  }
}
