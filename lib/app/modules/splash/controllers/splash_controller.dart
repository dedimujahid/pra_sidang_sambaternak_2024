import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sambaternak_baru_2024/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 2), goToNewPage);
  }

  void goToNewPage() {
    if (FirebaseAuth.instance.currentUser != null) {
      Get.toNamed(Routes.HOME);
    } else {
      Get.toNamed(Routes.ONBOARDING);
    }
  }
}
