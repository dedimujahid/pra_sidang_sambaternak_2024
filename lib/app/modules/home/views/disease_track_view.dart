import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sambaternak_baru_2024/configs/configs.dart';
import 'package:sambaternak_baru_2024/constants/constants.dart';

import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class DiseaseTrackView extends GetView<HomeController> {
  String selectedCurrency = 'Weekly';

  DiseaseTrackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: kBackgroundColor1,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  Text(
                    'Disease Track',
                    style: whiteTextStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: kBackgroundColor1,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.share),
                  ),
                ],
              ),
              SizedBox(
                height: getProperWidht(24),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    color: kBackgroundColor1,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: softShadow,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Disease Track',
                                style: primaryTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: medium,
                                ),
                              ),
                              Text(
                                'Terakhir Diperbarui 17.35, 27 Januari 2023',
                                style: subtitleTextStyle.copyWith(
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.location_on_outlined,
                            color: kPrimaryColor,
                          ),
                          Text(
                            'Malang Raya',
                            style: subtitleTextStyle.copyWith(
                              fontSize: 6,
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProperWidht(32),
                      ),
                      Container(
                        width: getProperWidht(125),
                        height: getProperWidht(125),
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: kSecondaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: kBackgroundColor1,
                            shape: BoxShape.circle,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DropdownButton<String>(
                                value: selectedCurrency,
                                items: const [
                                  DropdownMenuItem(
                                      value: 'Weekly', child: Text('Weekly')),
                                  DropdownMenuItem(
                                      value: 'Monthly', child: Text('Monthly')),
                                  DropdownMenuItem(
                                      value: 'Yearly', child: Text('Yearly')),
                                ],
                                onChanged: (value) {
                                  selectedCurrency = value!;
                                  if (kDebugMode) {
                                    print(value);
                                  }
                                },
                              )
                              //
                              // Text(
                              //   'Weekly',
                              //   style: subtitleTextStyle.copyWith(
                              //     fontSize: 18,
                              //   ),
                              // ),
                              // Icon(
                              //   Icons.arrow_drop_down_outlined,
                              //   color: kPrimaryColor,
                              // ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProperWidht(12),
                      ),
                      Text(
                        '1000 Kasus',
                        style: subtitleTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: getProperWidht(24),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pravalansi Penyakit Tertinggi',
                            style: subtitleTextStyle.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: getProperWidht(14),
                          ),
                          const RoundedCard(
                              title: '1. PMK', jumlah: '495 kasus'),
                          const RoundedCard(
                              title: '2. LSD', jumlah: '10 kasus'),
                          const RoundedCard(
                              title: '3. Berak Darah', jumlah: '195 kasus'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedCard extends StatelessWidget {
  const RoundedCard({
    required this.title,
    required this.jumlah,
    super.key,
  });

  final String title;
  final String jumlah;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: getProperWidht(10)),
      padding: EdgeInsets.symmetric(
        horizontal: getProperWidht(14),
        vertical: getProperWidht(16),
      ),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
          Text(
            jumlah,
            style: subtitleTextStyle.copyWith(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
