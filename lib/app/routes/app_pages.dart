import 'package:get/get.dart';
import 'package:sambaternak_baru_2024/app/modules/bottom_nav_bar/bindings/bottom_nav_bar_binding.dart';
import 'package:sambaternak_baru_2024/app/modules/bottom_nav_bar/views/bottom_nav_bar_view.dart';
import 'package:sambaternak_baru_2024/app/modules/chat/bindings/chat_binding.dart';
import 'package:sambaternak_baru_2024/app/modules/chat/views/chat_view.dart';
import 'package:sambaternak_baru_2024/app/modules/home/bindings/home_binding.dart';
import 'package:sambaternak_baru_2024/app/modules/home/views/home_view.dart';
import 'package:sambaternak_baru_2024/app/modules/login/bindings/login_binding.dart';
import 'package:sambaternak_baru_2024/app/modules/login/views/login_view2.dart';
import 'package:sambaternak_baru_2024/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:sambaternak_baru_2024/app/modules/onboarding/views/onboarding_view.dart';
import 'package:sambaternak_baru_2024/app/modules/profile/views/profile.dart';
import 'package:sambaternak_baru_2024/app/modules/register/bindings/register_binding.dart';
import 'package:sambaternak_baru_2024/app/modules/register/views/register_view2.dart';
import 'package:sambaternak_baru_2024/app/modules/splash/bindings/splash_binding.dart';
import 'package:sambaternak_baru_2024/app/modules/splash/views/splash_view.dart';
import 'package:sambaternak_baru_2024/app/modules/upload/bindings/upload_binding.dart';
import 'package:sambaternak_baru_2024/app/modules/upload/views/upload_view.dart';

import '../modules/market_place/bindings/market_binding.dart';
import '../modules/market_place/views/market_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView2(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView2(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAV_BAR,
      page: () => const BottomNavBarView(),
      binding: BottomNavBarBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD,
      page: () => const UploadView(),
      binding: UploadBinding(),
    ),
    GetPage(
      name: _Paths.MARKET,
      page: () => const MarketView(),
      binding: MarketBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => Profile(),
    )
  ];
}
