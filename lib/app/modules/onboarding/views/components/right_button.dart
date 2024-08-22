import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sambaternak_baru_2024/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:sambaternak_baru_2024/configs/configs.dart';
import 'package:sambaternak_baru_2024/constants/constants.dart';

class RightButton extends StatelessWidget {
  const RightButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    OnboardingController controller = Get.find();
    return GestureDetector(
      onTap: () => controller.rightTap(),
      child: Obx(
        () => Container(
          width: getProperWidht(100),
          padding: EdgeInsets.symmetric(
            vertical: getProperWidht(14),
          ),
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(14),
              topLeft: Radius.circular(14),
            ),
          ),
          child: Center(
            child: Text(
              controller.currentIndex.value != 2 ? 'NEXT' : 'START',
              style: whiteTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
