import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:app_builder/app_builder.dart';

import 'app/core/binding/initial_binding.dart';
import 'app/core/constants/app_colors.dart';
import 'app/core/constants/app_constants.dart';
import 'app/core/constants/app_style.dart';
import 'app/routes/app_pages.dart';
late StreamSubscription<InternetConnectionStatus> listener;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  // FCMHelper().initLocalNotification();
  // LicenseRegistry.addLicense(() async* {
  //   final license = await rootBundle.loadString('google_fonts/OFL.txt');
  //   yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  // });

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );

  await AppBuilder().init(
    primaryColor: AppColor.primaryColor,
    baseURL: "",
    doNeedScreenUtil: true,
    isErrorMessageBangla: false,
    font: GoogleFonts.titilliumWeb,
    editTextBorderColor: AppColor.borderGrayColor,
    dropdownBorderColor: AppColor.borderGrayColor,
    buttonRadius: 50,
    buttonColor: AppColor.primaryColor,
    buttonElevation: 0.0,
  );

  bool showOnline = false;
  listener = InternetConnectionChecker().onStatusChange.listen((status) {
    switch (status) {
      case InternetConnectionStatus.connected:
        if (showOnline) {
          Get.back();
          appWidgets.showSimpleToast(
            "Back Online",
            title: "Connection Status",
            isSuccess: true,
          );
        }
        break;
      case InternetConnectionStatus.disconnected:
        showOnline = true;
        appWidgets.noInternetDialog();
        break;
    }
  });
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: "M Mart",
          initialRoute: AppPages.INITIAL,
          initialBinding: InitialBinding(),
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          builder: EasyLoading.init(),
          defaultTransition: transition,
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            useMaterial3: false,
            primarySwatch: AppColor.colorPrimarySwatch,
            primaryColor: AppColor.primaryColor,
            colorScheme: ColorScheme.fromSwatch(
                primarySwatch: AppColor.colorPrimarySwatch)
                .copyWith(background: AppColor.white),
            appBarTheme: AppBarTheme(
              color: AppColor.white,
              // backgroundColor: AppColor.white,
              centerTitle: true,
              titleTextStyle: textRegularStyle(
                fontSize: 20,
                color: AppColor.white,
              ),
              iconTheme: const IconThemeData(
                color: AppColor.white,
              ),
            ),
          ),
        );
      },
    ),
  );
}
