import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx/global.dart';
import '../../i18n/translations_controller.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key, BuildContext? ctx}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List<dynamic> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalStoreController globalStore = Get.put(GlobalStoreController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("my".tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
                onTap: () async {
                  await showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (ctx) {
                        return SimpleDialog(
                          title: const Text("请选择语言"),
                          children: <Widget>[
                            SimpleDialogOption(
                              onPressed: () {
                                globalStore.setLanguage('zh');
                                var t = TranslationController();
                                t.changeLocale('zh');
                                Navigator.of(context).pop();
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 6),
                                child: Text('中文'),
                              ),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                globalStore.setLanguage('en');
                                var t = TranslationController();
                                t.changeLocale('en');
                                Navigator.of(context).pop();
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 6),
                                child: Text('English'),
                              ),
                            ),
                          ],
                        );
                      });
                },
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("language_setting".tr),
                      const Icon(Icons.chevron_right)
                    ],
                  ),
                )),
            const Divider(),
            GestureDetector(
              onTap: () async {
                await showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (ctx) {
                      return SimpleDialog(
                        title: const Text("请选择主题"),
                        children: <Widget>[
                          SimpleDialogOption(
                            onPressed: () {
                              final ThemeData data = ThemeData(
                                colorScheme: ColorScheme.fromSeed(
                                    seedColor: Colors.blue),
                                useMaterial3: true,
                              );
                              globalStore.setThemeData(data);
                              Navigator.of(context).pop();
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Text('蓝色'),
                            ),
                          ),
                          SimpleDialogOption(
                            onPressed: () {
                              final ThemeData data = ThemeData(
                                colorScheme: ColorScheme.fromSeed(
                                    seedColor: Colors.deepPurpleAccent),
                                useMaterial3: true,
                              );
                              globalStore.setThemeData(data);
                              Navigator.of(context).pop();
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Text('紫色'),
                            ),
                          ),
                        ],
                      );
                    });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("theme_setting".tr),
                  const Icon(Icons.chevron_right)
                ],
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
