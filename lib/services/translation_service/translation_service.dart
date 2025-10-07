import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TranslationService extends GetxService {
  static TranslationService get to => Get.find<TranslationService>();
  final supportedLocales = [const Locale('tr', 'TR')];
  final fallbackLocale = const Locale('tr', 'TR');
  late final _currentLocale = (Get.locale ?? fallbackLocale).obs;
  Locale get currentLocale => _currentLocale.value;

  Future<void> init() async {
    final translation = await _loadTranslation(currentLocale);
    Get.addTranslations({currentLocale.languageCode: translation});
    await Get.updateLocale(currentLocale);
  }

  Future<void> changeTranslation(Locale locale) async {
    final translation = await _loadTranslation(locale);
    if (translation.isNotEmpty) {
      Get.clearTranslations();
      Get.addTranslations({locale.languageCode: translation});
      await Get.updateLocale(locale);
      _currentLocale.value = locale;
    } else {
      throw Exception('Failed to load translations for $locale');
    }
  }

  Future<Map<String, String>> _loadTranslation(Locale locale) async {
    final languageCode = locale.languageCode;
    final supportedLanguageCodes = supportedLocales.map(
      (locale) => locale.languageCode,
    );
    if (!supportedLanguageCodes.contains(languageCode)) {
      throw Exception('The language code $languageCode is not supported.');
    }
    final path = 'translations/$languageCode.json';
    final jsonString = await rootBundle.loadString(path);
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }
}
