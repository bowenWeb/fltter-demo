import 'dart:ui';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/i18n/en.dart';
import 'package:untitled/i18n/zh.dart';

class TranslationController extends GetxController {
  static const localeStorageKey = 'localeKey';
  final locale = "".obs;

  Future<void> loadSavedLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final savedLocale = prefs.getString(localeStorageKey);
    if (savedLocale != null) {
      changeLocale(savedLocale);
    }
  }

  Future<void> changeLocale(String newLocale) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    locale.value = newLocale;
    Get.updateLocale(Locale(newLocale));
    prefs.setString(localeStorageKey, newLocale);
  }
}

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'zh_CN': zh,
      };
}
