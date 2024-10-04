import 'package:get/get.dart';

import '../modules/auth/forgot_password_screen/forgot_password_screen_binding.dart';
import '../modules/auth/forgot_password_screen/forgot_password_screen_view.dart';
import '../modules/auth/login_screen/login_screen_binding.dart';
import '../modules/auth/login_screen/login_screen_view.dart';
import '../modules/auth/profile_completion_screen/profile_completion_screen_binding.dart';
import '../modules/auth/profile_completion_screen/profile_completion_screen_view.dart';
import '../modules/auth/signup_screen/signup_screen_binding.dart';
import '../modules/auth/signup_screen/signup_screen_view.dart';
import '../modules/main_nav/main_nav_binding.dart';
import '../modules/main_nav/main_nav_view.dart';
import '../modules/main_screen/account_screen/account_screen_binding.dart';
import '../modules/main_screen/account_screen/account_screen_view.dart';
import '../modules/main_screen/cart_screen/cart_screen_binding.dart';
import '../modules/main_screen/cart_screen/cart_screen_view.dart';
import '../modules/main_screen/chat_screen/chat_screen_binding.dart';
import '../modules/main_screen/chat_screen/chat_screen_view.dart';
import '../modules/main_screen/favorite_screen/favorite_screen_binding.dart';
import '../modules/main_screen/favorite_screen/favorite_screen_view.dart';
import '../modules/main_screen/home/home_binding.dart';
import '../modules/main_screen/home/home_view.dart';
import '../modules/my_profile/my_profile_binding.dart';
import '../modules/my_profile/my_profile_view.dart';
import '../modules/splash_screen/splash_screen_binding.dart';
import '../modules/splash_screen/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN_NAV;

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
    GetPage(
      name: _Paths.MAIN_NAV,
      page: () => const MainNavView(),
      binding: MainNavBinding(),
    ),
    GetPage(
      name: _Paths.CART_SCREEN,
      page: () => const CartScreenView(),
      binding: CartScreenBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_SCREEN,
      page: () => const ChatScreenView(),
      binding: ChatScreenBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE_SCREEN,
      page: () => const FavoriteScreenView(),
      binding: FavoriteScreenBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_SCREEN,
      page: () => const AccountScreenView(),
      binding: AccountScreenBinding(),
    ),
    GetPage(
      name: _Paths.MY_PROFILE,
      page: () => const MyProfileView(),
      binding: MyProfileBinding(),
    ),
  ];
}
