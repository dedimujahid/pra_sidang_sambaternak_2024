import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final currentIndex = 0.obs;
  final _auth = FirebaseAuth.instance;
  String? email;
  String? password;
  String? notif;
  bool isError = false;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;

  PageController pageController = PageController();

  void changePage(int currentIndex) {
    this.currentIndex.value = currentIndex;
  }

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  Future<void> checkLogin() async {
    isError = false;
    loginFormKey.currentState!.save();
    try {
      await _auth.signInWithEmailAndPassword(
          email: email!, password: password!);

      if (_auth.currentUser != null) {
        isError = false;
        Get.offAllNamed(Routes.HOME);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      isError = true;
      notif = e.toString();
    }
  }
}
