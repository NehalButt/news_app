import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controller/homeController.dart';
import 'package:news_app/Pages/detailsPage/detailsPage.dart';
import 'package:news_app/Pages/homePage/Widgets/homePage.dart';
import 'package:news_app/Pages/homePage/Widgets/hottestNews.dart';
import 'package:news_app/Controller/appController.dart';

class articlePage extends StatelessWidget {
  const articlePage({super.key});

  @override
  Widget build(BuildContext context) {
    homeController homecontroller = Get.put(homeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "ARTICLES",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              letterSpacing: 10),
        ),
      ),
      body: Container(
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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        height: 60,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.5),),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                              style: TextStyle(color: Colors.white,
                              fontSize: 19),
                              maxLines: 1,
                          decoration:
                              InputDecoration(border: InputBorder.none,
                              hintText: "Search News ...",
                                hintStyle: TextStyle(color: Colors.white)
                              ),
                        )),
                        InkWell(
                          onTap: (){
                            print("GGGGG");
                          },
                          child: Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(color: Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Obx(
                () => homecontroller.isHottestLoading.value
                ? CircularProgressIndicator()
                : Column(
              children: homecontroller.hottestNewsList
                  .map(
                    (e) => hottestNews(
                  ontap: () {
                    Get.to(detailsPage(
                      newsModel: e,
                    ));
                  },
                  imageUrl: e.urlToImage ??
                      "https://imgs.search.brave.com/CeKYelYtXaChsrJ8VycTMi_mplcH7_Ykjpzoe5Ns798/rs:fit:860:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy90/aHVtYi9iL2I2L0lt/YWdlX2NyZWF0ZWRf/d2l0aF9hX21vYmls/ZV9waG9uZS5wbmcv/NjQwcHgtSW1hZ2Vf/Y3JlYXRlZF93aXRo/X2FfbW9iaWxlX3Bo/b25lLnBuZw",
                  title: e.title!,
                  time: e.publishedAt ?? "Unknown",
                  author: e.author ?? "Anonymous",
                ),
              )
                  .toList(),
            ),
          ),
              ],
            ),
          ),
        ),
      ),
    )
    )
    );
  }
}
