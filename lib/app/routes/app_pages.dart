import 'package:get/get.dart';

import '../modules/auth/forgot_password_screen/forgot_password_screen_binding.dart';
import '../modules/auth/forgot_password_screen/forgot_password_screen_view.dart';
import '../modules/auth/login_screen/login_screen_binding.dart';
import '../modules/auth/login_screen/login_screen_view.dart';
import '../modules/auth/profile_completion_screen/profile_completion_screen_binding.dart';
import '../modules/auth/profile_completion_screen/profile_completion_screen_view.dart';
import '../modules/auth/signup_screen/signup_screen_binding.dart';
import '../modules/auth/signup_screen/signup_screen_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/splash_screen/splash_screen_binding.dart';
import '../modules/splash_screen/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => const LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP_SCREEN,
      page: () => const SignupScreenView(),
      binding: SignupScreenBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD_SCREEN,
      page: () => const ForgotPasswordScreenView(),
      binding: ForgotPasswordScreenBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_COMPLETION_SCREEN,
      page: () => const ProfileCompletionScreenView(),
      binding: ProfileCompletionScreenBinding(),
    ),
  ];
}
