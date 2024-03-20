import 'package:flutter/material.dart';
import 'package:untitled/pages/detail/index.dart';
import 'package:untitled/pages/home/index.dart';
import 'package:untitled/pages/my/index.dart';
import 'package:untitled/pages/user/index.dart';
import 'package:get/get.dart';
import '../../getx/global.dart';
import 'i18n/translations_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> renderPageList = [
      const HomePage(),
      const UserPage(),
      const MyPage(),
    ];
    final GlobalStoreController globalController =
        Get.put(GlobalStoreController());

    return GetBuilder<GlobalStoreController>(
      builder: (controller) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: controller.themeData.value,
          home: Scaffold(
              body: renderPageList[controller.navigationBarIndex.value],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: controller.navigationBarIndex.value,
                onTap: (int index) {
                  globalController.setNavigationBarIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.account_balance_rounded),
                    label: 'home'.tr,
                  ),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.account_circle_outlined),
                      label: 'user'.tr),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.settings), label: 'my'.tr)
                ],
              )),
          locale: const Locale('en'),
          translations: AppTranslations(),
          routes: <String, WidgetBuilder>{
            '/home': (BuildContext context) => const HomePage(),
            '/my': (BuildContext context) => const MyPage(),
            '/user': (BuildContext context) => const UserPage(),
            '/detail': (BuildContext context) => const DetailPage(),
          },
        );
      },
    );
  }
}
