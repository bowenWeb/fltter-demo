import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalStoreController extends GetxController {
  RxString language = 'en'.obs;
  RxInt navigationBarIndex = 0.obs;
  Rx<ThemeData> themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    useMaterial3: true,
  ).obs;

  void setLanguage(String lang) {
    language.value = lang;
    update();
  }

  void setNavigationBarIndex(int index) {
    navigationBarIndex.value = index;
    update();
  }

  void setThemeData(ThemeData data) {
    themeData.value = data;
    update();
  }
}
