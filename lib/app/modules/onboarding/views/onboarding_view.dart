import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sambaternak_baru_2024/app/modules/onboarding/views/components/left_button.dart';
import 'package:sambaternak_baru_2024/app/modules/onboarding/views/components/page_onboarding.dart';
import 'package:sambaternak_baru_2024/app/modules/onboarding/views/components/right_button.dart';
import 'package:sambaternak_baru_2024/configs/configs.dart';
import 'package:sambaternak_baru_2024/constants/constants.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // * part of one Page view dynamic

            Expanded(
              flex: 10,
              child: PageView(
                controller: controller.pageController,
                onPageChanged: (index) => controller.changePage(index),
                children: [
                  PageOnboarding(
                    alignment: Alignment.topLeft,
                    width: getProperWidht(220),
                    image: 'onboard-sapi',
                    title: 'IMAGE PROCESSING',
                    desc:
                        'Mengindetifikasi Masalah Pada Ternak Melalui Gambar Penyakit',
                  ),
                  PageOnboarding(
                    alignment: Alignment.topCenter,
                    width: getProperWidht(300),
                    image: 'onboard-2',
                    title: 'CONSULTATION',
                    desc:
                        'Layanan Konsultasi Untuk Membantu Peternak Mengatasi Masalah Ternak Yang Dihadapi',
                  ),
                  PageOnboarding(
                    alignment: Alignment.topRight,
                    width: getProperWidht(220),
                    image: 'onboard-obat',
                    title: 'E-COMMERCE',
                    desc: 'Menyediakan Kebutuhan Bagi Para Peternak',
                  ),
                ],
              ),
            ),

            // * Part of two dot builder and button left and right
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Obx(
                    () => DotsIndicator(
                      dotsCount: 3,
                      position: controller.currentIndex.value.toDouble(),
                      decorator: DotsDecorator(
                        activeColor: kPrimaryColor,
                        size: const Size.square(9.0),
                        activeSize: const Size(18.0, 9.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProperWidht(28),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LeftButton(),
                      RightButton(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
