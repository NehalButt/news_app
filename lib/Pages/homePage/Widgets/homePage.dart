import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Components/hottestLoading.dart';
import 'package:news_app/Components/trendingLoading.dart';
import 'package:news_app/Controller/homeController.dart';
import 'package:news_app/Pages/detailsPage/detailsPage.dart';
import 'package:news_app/Pages/homePage/Widgets/hottestNews.dart';
import 'package:news_app/Pages/homePage/Widgets/trendingCard.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    homeController homecontroller = Get.put(homeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "NEWSEEKERS",
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
              padding: EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Trending News",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Obx(
                        () => homecontroller.isTrendingLoading.value
                            ? Row(children: [trendingLoading(),trendingLoading()],)
                            : Row(
                                children: homecontroller.trendingNewsList
                                    .map((e) => trendingCard(
                                          ontap: () {
                                            Get.to(detailsPage(
                                              newsModel: e,
                                            ));
                                          },
                                          imageUrl: e.urlToImage ??
                                              "https://imgs.search.brave.com/CeKYelYtXaChsrJ8VycTMi_mplcH7_Ykjpzoe5Ns798/rs:fit:860:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy90/aHVtYi9iL2I2L0lt/YWdlX2NyZWF0ZWRf/d2l0aF9hX21vYmls/ZV9waG9uZS5wbmcv/NjQwcHgtSW1hZ2Vf/Y3JlYXRlZF93aXRo/X2FfbW9iaWxlX3Bo/b25lLnBuZw",
                                          title:
                                              e.title ?? "Something Went Wrong",
                                          time: e.publishedAt ?? "Unknown",
                                          author: e.author ?? "Unknown",
                                          tag: "Trending",
                                        ))
                                    .toList(),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "News For You",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => homecontroller.isHottestLoading.value
                          ? Column(children: [hottestLoading(),hottestLoading(),hottestLoading(),],)
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tesla News For You",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => homecontroller.isTeslaLoading.value
                          ? Column(children: [hottestLoading(),hottestLoading(),hottestLoading(),],)
                          : Column(
                              children: homecontroller.teslaNewsList
                                  .map(
                                    (e) => hottestNews(
                                      ontap: () {
                                        Get.to(detailsPage(
                                          newsModel: e,
                                        ));
                                      },
                                      imageUrl: e.urlToImage ??
                                          "https://imgs.search.brave.com/CeKYelYtXaChsrJ8VycTMi_mplcH7_Ykjpzoe5Ns798/rs:fit:860:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy90/aHVtYi9iL2I2L0lt/YWdlX2NyZWF0ZWRf/d2l0aF9hX21vYmls/ZV9waG9uZS5wbmcv/NjQwcHgtSW1hZ2Vf/Y3JlYXRlZF93aXRo/X2FfbW9iaWxlX3Bo/b25lLnBuZw",
                                      title: e.title ?? "Something Went Wrong",
                                      time: e.publishedAt ?? "Unknown",
                                      author: e.author ?? "Anonymous",
                                    ),
                                  )
                                  .toList(),
                            ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Buisness News For You",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Obx(
                        () => homecontroller.isbuisnessLoading.value
                            ? Row(children: [trendingLoading(),trendingLoading()],)
                            : Row(
                                children: homecontroller
                                    .buisnessHeadlineNewsList
                                    .map((e) => trendingCard(
                                          ontap: () {
                                            Get.to(detailsPage(
                                              newsModel: e,
                                            ));
                                          },
                                          imageUrl: e.urlToImage ??
                                              "https://imgs.search.brave.com/CeKYelYtXaChsrJ8VycTMi_mplcH7_Ykjpzoe5Ns798/rs:fit:860:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy90/aHVtYi9iL2I2L0lt/YWdlX2NyZWF0ZWRf/d2l0aF9hX21vYmls/ZV9waG9uZS5wbmcv/NjQwcHgtSW1hZ2Vf/Y3JlYXRlZF93aXRo/X2FfbW9iaWxlX3Bo/b25lLnBuZw",
                                          title:
                                              e.title ?? "Something Went Wrong",
                                          time: e.publishedAt ?? "Unknown",
                                          author: e.author ?? "Unknown",
                                          tag: "Trending",
                                        ))
                                    .toList(),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Wall Street News For You",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => homecontroller.isWallStreetLoading.value
                          ? Column(children: [hottestLoading(),hottestLoading(),hottestLoading(),],)
                          : Column(
                              children: homecontroller.wallStreetNewsList
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
        ),
      ),
    );
  }
}
