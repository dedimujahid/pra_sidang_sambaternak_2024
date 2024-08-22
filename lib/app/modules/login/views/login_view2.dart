import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sambaternak_baru_2024/app/modules/login/controllers/login_controller.dart';
import 'package:sambaternak_baru_2024/app/modules/register/component/input.dart';
import 'package:sambaternak_baru_2024/app/routes/app_pages.dart';
import 'package:sambaternak_baru_2024/themes/theme.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../../constants/constants.dart';

class LoginView2 extends GetView<LoginController> {
  const LoginView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/latarlogin.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          SafeArea(
            child: Form(
              key: controller.loginFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 56,
                      left: 24.0,
                      right: 24.0,
                      bottom: 32,
                    ),
                    child: Card(
                      elevation: 5,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.63,
                            color: const Color.fromRGBO(244, 245, 247, 1),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 24.0, bottom: 24.0),
                                      child: Center(
                                        child: Image.asset(
                                            'assets/images/sambaternak.png'),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Input(
                                            placeholder: "Email",
                                            prefixIcon: const Icon(
                                              Icons.email,
                                            ),
                                            onSaved: (value) {
                                              controller.email = value;
                                            },
                                            validator: (value) {
                                              return controller
                                                  .validateEmail(value);
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Input(
                                            placeholder: "Password",
                                            prefixIcon: const Icon(
                                              Icons.lock,
                                            ),
                                            onSaved: (value) {
                                              controller.password = value;
                                            },
                                            validator: (value) {
                                              return controller
                                                  .validatePassword(value);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: Center(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: ArgonColors.white,
                                            // shape: RoundedRectangleBorder(
                                            //   borderRadius:
                                            //       BorderRadius.circular(4.0),
                                            // ),
                                            foregroundColor: kPrimaryColor,
                                          ),
                                          onPressed: () async {
                                            await controller.checkLogin();

                                            if (controller.isError == true) {
                                              // ignore: use_build_context_synchronously
                                              QuickAlert.show(
                                                // ignore: use_build_context_synchronously
                                                context: context,
                                                type: QuickAlertType.error,
                                                text: controller.notif,
                                              );
                                            }
                                          },
                                          // shape: RoundedRectangleBorder(
                                          //   borderRadius:
                                          //       BorderRadius.circular(4.0),
                                          // ),
                                          child: const Padding(
                                            padding: EdgeInsets.only(
                                              left: 16.0,
                                              right: 16.0,
                                              top: 12,
                                              bottom: 12,
                                            ),
                                            child: Text(
                                              "LOGIN",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 0, bottom: 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text("Belum Memiliki Akun?,",
                                              style: TextStyle(
                                                  color: ArgonColors.muted,
                                                  fontWeight: FontWeight.w200)),
                                          GestureDetector(
                                            onTap: () {
                                              Get.toNamed(Routes.REGISTER);
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 5),
                                              child: const Text(
                                                "Sign Up",
                                                style: TextStyle(
                                                    color: kPrimaryColor),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 0, bottom: 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text("Atau, login sebagai ",
                                              style: TextStyle(
                                                  color: ArgonColors.muted,
                                                  fontWeight: FontWeight.w200)),
                                          GestureDetector(
                                            onTap: () {
                                              Get.offAllNamed(Routes.HOME);
                                            },
                                            child: const Text(
                                              "Tamu",
                                              style: TextStyle(
                                                  color: kSecondaryColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            decoration: const BoxDecoration(
                              color: ArgonColors.white,
                              border: Border(
                                bottom: BorderSide(
                                    width: 0.5, color: ArgonColors.muted),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      "Sign up with",
                                      style: TextStyle(
                                          color: ArgonColors.text,
                                          fontSize: 14.0),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        // width: 0,
                                        height: 36,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  ArgonColors.white,
                                              foregroundColor: kPrimaryColor),
                                          onPressed: () {},
                                          // shape: RoundedRectangleBorder(
                                          //     borderRadius:
                                          //         BorderRadius.circular(4)),
                                          child: const Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 10,
                                                top: 10,
                                                left: 14,
                                                right: 14),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Icon(Icons.facebook, size: 13),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "FACEBOOK",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        // width: 0,
                                        height: 36,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  ArgonColors.white,
                                              foregroundColor: kPrimaryColor),
                                          onPressed: () {},
                                          // shape: RoundedRectangleBorder(
                                          //     borderRadius:
                                          //         BorderRadius.circular(4)),
                                          child: const Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 10,
                                                top: 10,
                                                left: 8,
                                                right: 8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Icon(Icons.mail, size: 13),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "GMAIL",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 13),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Divider()
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
