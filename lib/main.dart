import 'package:firebase_core/firebase_core.dart'
    show Firebase, FirebaseOptions;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sambaternak_baru_2024/themes/themes.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyAdjoZBTmQmG_qDpBKdq3QWCXrpr8UyjkQ',
          appId: "1:1087977237588:android:daf85d9161d0d92927d1c1",
          messagingSenderId: '1087977237588',
          projectId: "sambaternak-firebase"));

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      title: "SambaTernak",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
