import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  final currentIndex = 0.obs;

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController namaLengkapController;
  late TextEditingController usernameController;
  String? email;
  String? password;
  String? notif;
  bool? isError;

  PageController pageController = PageController();

  void changePage(int currentIndex) {
    this.currentIndex.value = currentIndex;
  }

  var namaLengkap = '';
  var username = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    namaLengkapController = TextEditingController();
    usernameController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    namaLengkapController.dispose();
    usernameController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Email Tidak Valid";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password harus 6 characters";
    }
    return null;
  }

  String? validatenamaLengkap(String value) {
    if (value.isEmpty) {
      return "Nama tidak valid";
    }
    return null;
  }

  String? validateusername(String value) {
    if (value.isEmpty) {
      return "Username tidak valid";
    }
    return null;
  }

  Future<void> checkRegister() async {
    isError = false;
    registerFormKey.currentState!.save();
    try {
      // UserCredential userCredential = await FirebaseAuth.instance
      //     .createUserWithEmailAndPassword(email: email!, password: password!);

      // Setelah berhasil registrasi, arahkan pengguna ke halaman beranda (HOME).
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      // Tangani kesalahan yang mungkin terjadi saat registrasi.
      isError = true;
      notif = e.toString();
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
