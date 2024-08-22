import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sambaternak_baru_2024/configs/configs.dart';
import 'package:sambaternak_baru_2024/constants/constants.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/logosambat.png'),
              SizedBox(
                height: getProperHeight(70),
              ),
              const CircularProgressIndicator(
                color: kBackgroundColor1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
