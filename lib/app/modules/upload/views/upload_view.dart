import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sambaternak_baru_2024/configs/configs.dart';
import 'package:sambaternak_baru_2024/constants/constants.dart';

import '../../../../utils/utils.dart';
import '../controllers/upload_controller.dart';
import '../views/result_view.dart';

class UploadView extends GetView<UploadController> {
  const UploadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Gambar'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: getProperWidht(250),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kBackgroundColor1,
                  boxShadow: softShadow,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: kBackgroundColor1,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/images/cow.png',
                            width: getProperWidht(400),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: getProperWidht(24),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Panduan Pengambilan Gambar',
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: semiBold,
                                  ),
                                ),
                                Text(
                                  '\u2022 Sebelum Mengambil Gambar Sebaiknya Posisikan Di Area Yang Terkena Penyakit Terlebih Dahulu',
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 11,
                                  ),
                                ),
                                Text(
                                  '\u2022 Sebaiknya Mengambil Gambar di tempat dengan pencahayaan yang baik',
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                'Upload Gambar',
                style:
                    primaryTextStyle.copyWith(fontWeight: bold, fontSize: 24),
              ),
              Obx(
                () => Container(
                  margin: EdgeInsets.symmetric(vertical: getProperWidht(10)),
                  padding: EdgeInsets.all(getProperWidht(14)),
                  width: getProperWidht(264),
                  height: getProperWidht(140),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE4E9F1),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: controller.isPick.value
                      ? const OutputImage()
                      : const InputImage(),
                ),
              ),
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  height: getProperHeight(getProperWidht(50)),
                  child: ElevatedButton(
                    onPressed: () async {
                      controller.onLoading();
                      DialogsLottie().dialoglottie;
                      await controller.imageClassification();
                      Future.delayed(const Duration(seconds: 3), () {
                        Navigator.of(context).pop();
                        controller.onLoading();
                        Get.to(const ResultView());
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: !controller.isLoading.value
                        ? Text(
                            'Cek Penyakit Ternak',
                            style: whiteTextStyle.copyWith(
                              fontWeight: bold,
                              fontSize: 18,
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                              color: kBackgroundColor1,
                            ),
                          ),
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

class OutputImage extends StatelessWidget {
  const OutputImage({super.key});

  @override
  Widget build(BuildContext context) {
    UploadController controller = Get.find();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          image: FileImage(controller.image.value!),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          onPressed: () => controller.removeImage(),
          icon: const Icon(
            Icons.cancel_outlined,
            color: kAlert,
          ),
        ),
      ),
    );
  }
}

class InputImage extends StatelessWidget {
  const InputImage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UploadController>();
    final ImagePicker picker = ImagePicker();

    XFile? image;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            image = await picker.pickImage(source: ImageSource.camera);
            File fileImage = File(image!.path);
            controller.getImage(fileImage);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(getProperWidht(10)),
                decoration: BoxDecoration(
                  color: kBackgroundColor1,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: softShadow,
                ),
                child: Image.asset('assets/icons/camera-icon.png'),
              ),
              Text(
                'Kamera',
                style: primaryTextStyle,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () async {
            image = await picker.pickImage(source: ImageSource.gallery);
            File fileImage = File(image!.path);
            controller.getImage(fileImage);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(getProperWidht(10)),
                decoration: BoxDecoration(
                  color: kBackgroundColor1,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: softShadow,
                ),
                child: Image.asset(
                  'assets/icons/gallery-icon.png',
                  width: getProperWidht(40),
                ),
              ),
              Text(
                'Gallery',
                style: primaryTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
