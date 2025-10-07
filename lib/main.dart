import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voltran_ai_web/app.dart';
import 'package:voltran_ai_web/services/api_service/api_service.dart';
import 'package:voltran_ai_web/services/translation_service/translation_service.dart';

Future<void> initalizeServices() async {
  Get.put(
    ApiService(
      requestTimeout: 10.seconds,
    ),
    permanent: true,
  );
  await Get.put(TranslationService()).init();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //TODO Environment
  await initalizeServices();

  runApp(
    GestureDetector(
      onTap: () {
        FocusScope.of(Get.context!).unfocus();
      },
      child: VoltranAiWebApp(),
    ),
  );
}
