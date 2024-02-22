import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/Controller/appController.dart';
import 'package:news_app/Controller/homeController.dart';
import 'package:news_app/Model/NewsModel.dart';
import 'package:news_app/Pages/homePage/Widgets/homePage.dart';

class detailsPage extends StatelessWidget {
  final NewsModel newsModel;
  const detailsPage({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    homeController homecontroller = Get.put(homeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(
          "Details Page",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              letterSpacing: 10),
        ),
      ),
      body: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://www.kindacode.com/wp-content/uploads/2021/04/background.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          children: [
                            Container(
                              height: 400,
                              width: 500,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey.shade600,
                                  borderRadius: BorderRadius.circular(10)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  newsModel.urlToImage ??
                                      "https://imgs.search.brave.com/CeKYelYtXaChsrJ8VycTMi_mplcH7_Ykjpzoe5Ns798/rs:fit:860:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy90/aHVtYi9iL2I2L0lt/YWdlX2NyZWF0ZWRf/d2l0aF9hX21vYmls/ZV9waG9uZS5wbmcv/NjQwcHgtSW1hZ2Vf/Y3JlYXRlZF93aXRo/X2FfbW9iaWxlX3Bo/b25lLnBuZw",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              newsModel.title ?? "Something Went Wrong",
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  newsModel.publishedAt ?? "Today",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.orangeAccent,
                                  child: Text(
                                    newsModel.author?[0] ?? "Anonymous"[0],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  newsModel.author ?? "Anonymous",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 450,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white24),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          homecontroller.speak(
                                              newsModel.description ??
                                                  "No Description"
                                          );

                                        },
                                        color: Colors.white,
                                        icon: Icon(Icons.play_arrow_rounded),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: 300,
                                          child: Lottie.asset(
                                              'Assets/Animation/wav.json',
                                          height: 40,
                                        ),
                                        )
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                  newsModel.description ??
                                      "Something Went Wrong",
                                  style: TextStyle(
                                      fontSize: 19,
                                      letterSpacing: 1.5,
                                      color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                      ))))),
    );
  }
}
