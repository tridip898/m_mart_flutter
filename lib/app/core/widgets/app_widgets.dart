import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:m_mart_flutter/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../constants/app_style.dart';
import '../constants/asset_constants.dart' as asset;
import '../constants/my_text_style.dart';
import '../constants/tr_constant.dart';
import '../utils/helper/app_helper.dart';
import 'app_button.dart';

class AppWidgets {
  Widget gapH(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget gapW(double width) {
    return SizedBox(
      width: width,
    );
  }

  Widget gapW4() {
    return const SizedBox(
      width: 4,
    );
  }

  Widget gapW8() {
    return const SizedBox(
      width: 8,
    );
  }

  Widget gapH8() {
    return const SizedBox(
      height: 8,
    );
  }

  Widget gapH16() {
    return const SizedBox(
      height: 16,
    );
  }

  Widget gapH20() {
    return const SizedBox(
      height: 20,
    );
  }

  Widget gapW16() {
    return const SizedBox(
      width: 16,
    );
  }

  Widget gapW12() {
    return const SizedBox(
      width: 12,
    );
  }

  Widget gapH12() {
    return const SizedBox(
      height: 12,
    );
  }

  Widget gapW24() {
    return const SizedBox(
      width: 24,
    );
  }

  Widget gapH24() {
    return const SizedBox(
      height: 24,
    );
  }

  Widget changeLanguage({
    bool fullName = false,
  }) {
    String locale = Get.locale?.languageCode ?? "en";
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.updateLocale(const Locale("en"));
            locale = "en";
            appHelper.saveLocale("en");
          },
          child: Container(
            height: 30,
            decoration: BoxDecoration(
              color: locale == "en" ? AppColor.primaryColor : null,
              border: Border.all(
                color: AppColor.primaryColor,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 8),
              child: Center(
                child: Text(
                  fullName ? "English" : "EN",
                  style: locale == "en"
                      ? text14Style(isWhiteColor: true)
                      : text14Style(isPrimaryColor: true),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.updateLocale(const Locale("bn"));
            locale = "bn";
            appHelper.saveLocale("bn");
          },
          child: Container(
            height: 30,
            decoration: BoxDecoration(
              color: locale == "bn" ? AppColor.primaryColor : null,
              border: Border.all(
                color: AppColor.primaryColor,
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 12),
              child: Center(
                child: Text(
                  fullName ? "বাংলা" : "বাং",
                  style: locale == "bn"
                      ? text14Style(isWhiteColor: true)
                      : text14Style(isPrimaryColor: true),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  SnackbarController getSnackBar(
      {title = "Title",
      message = " Some message",
      int waitingTime = 2,
      int animationDuration = 500,
      snackPosition = SnackPosition.TOP,
      Color backgroundColor = AppColor.primaryColor,
      double backgroundColorOpacity = .7,
      colorText = AppColor.white}) {
    return Get.snackbar(title, message,
        snackPosition: snackPosition,
        duration: Duration(seconds: waitingTime),
        animationDuration: Duration(milliseconds: animationDuration),
        backgroundColor: backgroundColor.withOpacity(backgroundColorOpacity),
        colorText: colorText);
  }

  RoundedRectangleBorder myButtonMaterialStateShape(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius));
    }
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius));
  }

  double myButtonMaterialStateElevation(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return 3;
    }
    return 3;
  }

  double myButtonMaterialStateElevationForTransparent(
      Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return 3;
    }
    return 0;
  }

  Color myButtonMaterialStateBlueColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return AppColor.textColorBlue.withOpacity(.6);
    }
    return AppColor.textColorBlue;
  }

  Color myButtonMaterialStateColorTransparent(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return AppColor.primaryColor.withOpacity(0.7);
    }
    return AppColor.primaryColor.withOpacity(0.7);
  }

  Color myButtonMaterialStateColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return AppColor.primaryColor;
    }
    return AppColor.primaryColor;
  }

  showSimpleDialog(
    String title,
    String body,
    retryClick, {
    buttonText = "Try Again",
    barrierDismissible = true,
  }) {
    if (Get.context == null) {
      return null;
    }
    /*return Get.defaultDialog(
      title: title,
      middleText: body,
      backgroundColor: Colors.white,
      titleStyle: textAppBarStyle(),
      middleTextStyle: textRegularStyle(),
      radius: borderRadius,
    );*/
    return showDialog(
      context: Get.context!,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          // style: textAppBarStyle(),
        ),
        content: Text(
          body,
          // style: textRegularStyle(),
        ),
        /*insetPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.only(
          left: mainPaddingW,
          right: mainPaddingW,
          top: mainPaddingH,
        ),
        contentPadding: EdgeInsets.only(
          left: mainPaddingW,
          right: mainPaddingW,
        ),*/
        actions: <Widget>[
          TextButton(
              child: Text(buttonText),
              onPressed: () {
                Navigator.pop(context);
                if (buttonText != "Ok") {
                  try {
                    retryClick();
                    AppHelper().showLoader();
                  } catch (e) {
                    AppHelper().hideLoader();
                  }
                }
              })
        ],
      ),
    );
  }

  myAppBar(title, {List<Widget>? action}) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back,
          color: AppColor.blackPure,
          size: 25.w,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: textAppBarStyle(fontSize: 20),
      ),
      centerTitle: true,
      actions: action ?? [],
    );
  }

  showSimpleToast(
    String? message, {
    String? title,
    bool isShort = false,
    bool isSuccess = false,
    bool isInfo = false,
    bool isError = true,
  }) {
    Get.snackbar(
      title ??
          (isSuccess
              ? "Success"
              : isInfo
                  ? "Info"
                  : "Error"),
      message ?? "",
      icon: Icon(
        (isSuccess
            ? Icons.check_circle
            : isInfo
                ? Icons.info
                : Icons.error),
        color: AppColor.white,
      ),
      shouldIconPulse: true,
      // barBlur: 20,
      // overlayBlur: 1,
      isDismissible: true,
      snackPosition: SnackPosition.TOP,
      backgroundColor: (isSuccess
          ? AppColor.successColor.withOpacity(.8)
          : isInfo
              ? AppColor.infoColor.withOpacity(.8)
              : AppColor.errorColor.withOpacity(.8)),
      margin: EdgeInsets.only(
        top: mainPaddingH,
        left: mainPaddingW,
        right: mainPaddingW,
      ),
      colorText: AppColor.white,
      duration: const Duration(seconds: 3),
    );
    /*showTopSnackBar(
        Overlay.of(Get.context ?? context),
        isSuccess
            ? CustomSnackBar.success(message: msg!)
            : isInfo
            ? CustomSnackBar.info(message: msg!)
            : isError
            ? CustomSnackBar.error(message: msg!)
            : CustomSnackBar.error(message: msg!),
        displayDuration: Duration(seconds: isShort ? 1 : 2));*/
  }

  Widget noData({color = Colors.redAccent}) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: mainPaddingH,
          horizontal: mainPaddingW,
        ),
        child: Text(
          noDataFound.tr,
          style: text20Style(
            fontWeight: FontWeight.w600,
            color: color,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
  Widget floatingActionButton({
    required String title,
    IconData icons = Icons.add,
    required Function() onTap,
  }) {
    return FloatingActionButton.extended(

      onPressed: onTap,
      label: Text(
        title,
        style: text16Style(color: AppColor.white, isWeight600: true),
      ),
      heroTag: null,
      icon: Container(
        decoration: const BoxDecoration(

          shape: BoxShape.circle,
        ),
        padding: mainPaddingSymmetric(3, 3),
        child: Icon(
          icons,
          size: 15.w,
          color: AppColor.white,
        ),
      ),
      backgroundColor: Colors.red,
    );
  }

  //Need to remove this from there
  cardTiles({leadingTitle, leadingValue, trailingTitle, trailingValue}) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    leadingTitle,
                    style: textRegularStyle(
                      isColorPrimary: true,
                    ),
                  ),
                  Text(
                    leadingValue,
                    style: textRegularStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    trailingTitle,
                    style: textRegularStyle(
                      isColorPrimary: true,
                    ),
                  ),
                  Text(
                    trailingValue,
                    style: textRegularStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        gapH(4),
      ],
    );
  }

  showAppDialog({
    headTitle = "অভিনন্দন!",
    bodyTitle = "",
    assetString = "",
    buttonText = "Try Again",
    barrierDismissible = true,
  }) {
    if (Get.context == null) {
      return null;
    }
    return showDialog(
      context: Get.context!,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        backgroundColor: AppColor.white,
        surfaceTintColor: AppColor.white,
        title: null,
        content: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                assetString,
                height: 180,
                width: 180,
              ),
              gapH24(),
              Text(
                headTitle,
                textAlign: TextAlign.center,
                style: textRegularStyle(
                  fontSize: 24,
                  isColorPrimary: true,
                ),
              ),
              gapH12(),
              Text(
                bodyTitle,
                textAlign: TextAlign.center,
                style: textRegularStyle(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }

  sloganTitle() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: lookingForJob.tr,
        style: text20Style(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 32.r),
        children: <TextSpan>[
          TextSpan(
            text: '?',
            style: text20Style(color: AppColor.black, fontSize: 32.r),
          ),
        ],
      ),
    );
  }

  //Todo Bottom Sheet will change next:
  myBottomSheet(context, child,
      {double heightRatio = 0.55, bool isDismissible = false}) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isDismissible: isDismissible,

      // scrollControlDisabledMaxHeightRatio: heightRatio,
      // constraints: BoxConstraints(
      //   minHeight: 200,
      //   maxHeight: height
      // ),
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              // padding: EdgeInsets.all(12),
              padding: const EdgeInsets.only(
                top: 12,
                left: 16,
                right: 16,
              ),
              height: Get.height * heightRatio,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
              ),
              child: child,
            ),
          ),
        );
      },
    );
  }

  appDivider(
      {color = AppColor.white,
      isColorBlack = false,
      double thickness = 1,
      double height = 20}) {
    return Divider(
      height: height,
      thickness: thickness,
      color: isColorBlack ? AppColor.black.withOpacity(0.5) : color,
    );
  }

  Future<void> downloadPdf(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch $uri";
    }
  }

  showStatusDialog({
    required headTitle,
    barrierDismissible = true,
    required VoidCallback yesTap,
    required VoidCallback noTap,
  }) {
    if (Get.context == null) {
      return null;
    }
    return showDialog(
      context: Get.context!,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        backgroundColor: AppColor.white,
        surfaceTintColor: AppColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: null,
        content: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              gapH24(),
              Text(
                headTitle,
                textAlign: TextAlign.center,
                style: textRegularStyle(
                  fontSize: 24,
                  isColorPrimary: true,
                ),
              ),
              gapH12(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                    text: yesText.tr,
                    onPressed: yesTap,
                    backgroundColor: AppColor.green,
                  ),
                  gapW8(),
                  AppButton(
                    text: noText.tr,
                    onPressed: noTap,
                    backgroundColor: AppColor.red,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  showSimpleDialogs(context, Function()? onTap) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          confirmationTr.tr,
          style: text14Style(fontSize: 16),
        ),
        content: Text(
          deleteMsgTr.tr,
          style: text12Style(
            fontSize: 14,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              noTr.tr,
              style: text12Style(
                color: AppColor.red,
              ),
            ),
          ),
          TextButton(
            onPressed: onTap,
            child: Text(
              yesTr.tr,
              style: text12Style(
                color: AppColor.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String naming(String name, String nameEn) {
    if (Get.locale?.languageCode == "bn") {
      if (name != "") {
        return name;
      } else {
        return name;
      }
    } else {
      if (nameEn != "") {
        return nameEn;
      } else {
        return name;
      }
    }
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  noInternetDialog() {
    return showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              noInternetMsg.tr,
              textAlign: TextAlign.center,
              style: text20Style(),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  'assets/lottie/no_internet.json',
                  // Replace with your Lottie animation file path
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 16),
                Text(
                  checkInternetConnectionMsg.tr,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        });
  }

  paymentDone() {
    return showDialog(
        context: Get.context!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Order Success",
              textAlign: TextAlign.center,
              style: text20Style(fontSize: 25, isWeight600: true),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  asset.paymentJson,
                  // Replace with your Lottie animation file path
                  width: 200.w,
                  height: 200.w,
                ),
                const SizedBox(height: 16),
                Text(
                  orderPrepareMsg.tr,
                  textAlign: TextAlign.center,
                  style: text16Style(isWeight400: true),
                ),
                gapH12(),
                ActionChip(
                  padding: defaultPadding,
                  backgroundColor: AppColor.plantPrimaryColor,
                  label: Text(
                    "Home",
                    style: text16Style(color: AppColor.white),
                  ),
                  onPressed: () {
                  },
                )
              ],
            ),
          );
        });
  }


  noDataFoundMsg() {
    return Center(
      child: Lottie.asset(
        asset.noDataFoundLottie,
        width: Get.width * .8,
      ),
    );
  }
  Widget circularProgressBar() {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColor.primaryColor,
      ),
    );
  }

  divider({double height = 10, Color color = AppColor.grey}) {
    return Divider(
      color: color,
      height: height,
      thickness: 0.5,
    );
  }
  simpleStatusAlertDialog({
    required headTitle,
    barrierDismissible = true,
    required VoidCallback yesTap,
    required VoidCallback noTap,
  }) {
    return showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        backgroundColor: AppColor.white,
        surfaceTintColor: AppColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: null,
        content: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                headTitle,
                textAlign: TextAlign.center,
                style: text16Style(
                  isWeight600: true,
                  isPrimaryColor: true,
                ),
              ),
              gapH30,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  dialogButton(
                    "No",
                    AppColor.red,
                    noTap,
                  ),
                  gapW20,
                  dialogButton(
                    "Yes",
                    AppColor.green,
                    yesTap,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  dialogButton(String title, Color backgroundColor, Function()? onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Ink(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        child: Text(
          title,
          style: text14Style(
            isWeight600: true,
            isWhiteColor: true,
          ),
        ),
      ),
    );
  }
  Future<bool> appExitConfirmation({
    String? msg,
    bool needOnlyBack = false,
    bool needGoHome = false,
    EdgeInsetsGeometry? actionsPadding,
    required VoidCallback yesButtonClick,
  }) async {
    bool? shouldClose = await showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        contentPadding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        content: Text(
          msg ?? "আপনি কি নিশ্চিত আপনি অ্যাপটি বন্ধ করতে চান?",
          style: text14Style(),
        ),
        actionsPadding: actionsPadding,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              "No",
              style: text16Style(
                isPrimaryColor: true,
              ),
            ),
          ),
          TextButton(
            onPressed: yesButtonClick,
            child: Text(
              "Yes",
              style: text16Style(
                isPrimaryColor: true,
              ),
            ),
          ),
        ],
      ),
    );

    if ((shouldClose ?? false)) {
      Navigator.pop(Get.context!);
    }

    return false;
  }
}
