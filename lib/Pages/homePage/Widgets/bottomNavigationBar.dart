import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controller/bottomNavigationController.dart';

class bottomNavigationBar extends StatelessWidget {
  const bottomNavigationBar({Key? key});

  @override
  Widget build(BuildContext context) {
    bottomNavigationController controller =
    Get.put(bottomNavigationController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 70,
          width: 250,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.index.value = 0;
                      },
                      child: Obx(
                            () => AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.ease,
                          child: Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: controller.index.value == 0
                                ? Colors.orangeAccent
                                : null,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.index.value = 1;
                      },
                      child: Obx(
                            () => AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.ease,
                          child: Icon(
                            Icons.book,
                            color: Colors.white,
                          ),
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: controller.index.value == 1
                                ? Colors.orangeAccent
                                : null,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.index.value = 2;
                      },
                      child: Obx(
                            () => AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.ease,
                          child: Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: controller.index.value == 2
                                ? Colors.orangeAccent
                                : null,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
