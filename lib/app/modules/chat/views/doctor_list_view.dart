import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sambaternak_baru_2024/app/modules/chat/views/detail_chat_view.dart';
import 'package:sambaternak_baru_2024/configs/configs.dart';
import 'package:sambaternak_baru_2024/constants/constants.dart';

import '../controllers/chat_controller.dart';

class DoctorListView extends GetView<ChatController> {
  const DoctorListView({super.key});
  @override
  Widget build(BuildContext context) {
    ChatController controller = Get.put(ChatController());

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: defaultPadding),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: controller.listDay
                      .map(
                        (e) => DayChip(listDay: e),
                      )
                      .toList(),
                ),
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(defaultPadding),
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(DetailChatView());
                      },
                      child: Container(
                        padding: EdgeInsets.all(getProperWidht(18)),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: kPrimaryLightColor,
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                'assets/images/doctor-sample.jpg',
                              ),
                            ),
                            SizedBox(
                              width: getProperWidht(18),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '09:30',
                                  style: subtitleTextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Dr. Aris',
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: medium,
                                  ),
                                ),
                                Text(
                                  'Ahli Ternak Ruminansia',
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              height: getProperWidht(10),
                              width: getProperWidht(10),
                              decoration: const BoxDecoration(
                                color: kSuccess,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DayChip extends StatelessWidget {
  const DayChip({
    super.key,
    required this.listDay,
  });

  final Map<String, dynamic> listDay;

  @override
  Widget build(BuildContext context) {
    ChatController controller = Get.find();
    return GestureDetector(
      onTap: () => controller.changeIndex(listDay['id']),
      child: Obx(() => Container(
            margin: EdgeInsets.only(
              right: getProperWidht(10),
              left: listDay['id'] == 1 ? getProperWidht(10) : 0,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: getProperWidht(24),
              vertical: getProperWidht(6),
            ),
            decoration: controller.currentIndex.value == listDay['id']
                ? controller.selectDecoration
                : controller.unselectDecoration,
            child: Text(
              listDay['title'],
              style: primaryTextStyle.copyWith(
                color: controller.currentIndex.value == listDay['id']
                    ? kBackgroundColor1
                    : kPrimaryColor,
                fontWeight: medium,
                fontSize: 18,
              ),
            ),
          )),
    );
  }
}
