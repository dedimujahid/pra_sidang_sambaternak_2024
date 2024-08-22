import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sambaternak_baru_2024/app/modules/chat/views/doctor_list_view.dart';
import 'package:sambaternak_baru_2024/app/modules/upload/controllers/upload_controller.dart';
import 'package:sambaternak_baru_2024/configs/configs.dart';
import 'package:sambaternak_baru_2024/constants/constants.dart';

class ResultView extends GetView<UploadController> {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back-icon.svg',
            width: getProperWidht(44),
          ),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text(
          'Hasil Analisis',
          style: whiteTextStyle,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: getProperWidht(10)),
            child: SvgPicture.asset(
              'assets/icons/link-icon.svg',
              width: getProperWidht(44),
            ),
          ),
        ],
        backgroundColor: kPrimaryColor,
        toolbarHeight: getProperWidht(86),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(defaultPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                controller.title.value == 'Healthy'
                    ? Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/success-state.svg',
                          ),
                          SizedBox(
                            height: getProperWidht(11),
                          ),
                          Center(
                            child: Text(
                              'Kelihatannya Sapi Kamu Terindikasi Sehat',
                              textAlign: TextAlign.center,
                              style: primaryTextStyle.copyWith(
                                fontWeight: bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: getProperHeight(getProperWidht(56)),
                            margin: const EdgeInsets.symmetric(vertical: 15),
                            child: ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kSecondaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'Analisis Gambar Lain',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : const ResultContent(),
                Column(
                  children: [
                    Text(
                      'Ingin Mendiagnosis lebih lanjut?',
                      style: subtitleTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: getProperWidht(11),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: getProperHeight(getProperWidht(56)),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => const DoctorListView());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Konsultasi dengan Expert',
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResultContent extends StatelessWidget {
  const ResultContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    UploadController controller = Get.find<UploadController>();
    // Assuming controller.result is a List<Map<String, dynamic>>

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hasil Analisis Gambar',
          style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 18),
        ),
        SizedBox(
          height: getProperWidht(5),
        ),
        Text(
          'Berikut penyakit dari hasil analisis gambar. Klik penyakit untuk mengetahui lebih lanjut.',
          style: primaryTextStyle.copyWith(fontSize: 14),
        ),
        SizedBox(
          height: getProperWidht(14),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(
            getProperWidht(12),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: kSecondaryColor,
            ),
          ),
          child: Center(
            child: Container(
              width: getProperWidht(300),
              height: getProperHeight(160.0),
              padding: EdgeInsets.all(
                getProperWidht(52),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(controller.image.value!),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: kSecondaryColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: getProperWidht(14),
        ),
        Text(
          'Prediksi Penyakit',
          style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 18),
        ),
        SizedBox(
          height: getProperWidht(5),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.result.length,
          itemBuilder: (context, index) {
            var item = controller.result[index];
            return ListTile(
              title: Text(
                  'Confidence: ${item['confidence'].toStringAsFixed(2)} %'),
              subtitle: Text(
                item['label'],
                style:
                    primaryTextStyle.copyWith(fontWeight: bold, fontSize: 18),
              ),
            );
          },
        ),
      ],
    );
  }
}
