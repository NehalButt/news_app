import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controller/bottomNavigationController.dart';
import 'package:news_app/Pages/homePage/Widgets/bottomNavigationBar.dart';

class appController extends StatelessWidget {
  const appController({super.key});

  @override
  Widget build(BuildContext context) {
    bottomNavigationController controller =
        Get.put(bottomNavigationController());
    return Scaffold(
      floatingActionButton: bottomNavigationBar(),
      body: Obx(() => controller.pages[controller.index.value]),
    );
  }
}
