import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    homeStore.getClustersList();
    super.initState();
  }

  final HomeStoreController homeStore = Get.put(HomeStoreController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("home".tr),
        ),
        body: GetBuilder<HomeStoreController>(builder: (controller) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: controller.clusters.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map item = controller.clusters[index];
                      return GestureDetector(
                        child: ListTile(title: Text("${item['clusterName']}")),
                        onTap: () {
                          Get.toNamed('/detail',
                              arguments: {"clusterName": item['clusterName']});
                        },
                      );
                    }),
              ),
            ],
          );
        }));
  }
}
