import 'dart:convert';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Model/NewsModel.dart';

class homeController extends GetxController{
  RxList<NewsModel> trendingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> hottestNewsList = <NewsModel>[].obs;
  RxList<NewsModel> teslaNewsList = <NewsModel>[].obs;
  RxList<NewsModel> buisnessHeadlineNewsList = <NewsModel>[].obs;
  RxList<NewsModel> wallStreetNewsList = <NewsModel>[].obs;
  RxBool isTrendingLoading = true.obs;
  RxBool isHottestLoading = true.obs;
  RxBool isTeslaLoading = true.obs;
  RxBool isbuisnessLoading = true.obs;
  RxBool isWallStreetLoading = true.obs;
  FlutterTts flutterTts = FlutterTts();



 void onInit() async{
   super.onInit();
   getHottestNews();
   getTrendingNews();
   getTeslaNews();
   getBuisnessNews();
   getWallStreetNews();
 }

 Future<void> getTrendingNews() async {
   isTrendingLoading.value = true;
   var baseURL = "https://newsapi.org/v2/everything?q=apple&from=2024-02-02&to=2024-02-02&sortBy=popularity&apiKey=881ec1f9283a47d3addf07e373e9fa35";
   var response = await http.get(Uri.parse(baseURL));
   try {
     if (response.statusCode == 200) {
       var body = jsonDecode(response.body);
       var articles = body["articles"]; // Correct key is "articles"
       for (var news in articles) {
         trendingNewsList.add(NewsModel.fromJson(news));
       }
       trendingNewsList.value = trendingNewsList.sublist(0,5);
     } else {
       print("Something Went Wrong");
     }
   } catch (ex) {
     print(ex);
   } finally {
     isTrendingLoading.value = false;
   }
 }
 Future<void> getHottestNews() async {
    isHottestLoading.value = true;
    var baseURL = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=881ec1f9283a47d3addf07e373e9fa35";
    var response = await http.get(Uri.parse(baseURL));
    try {
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"]; // Correct key is "articles"
        for (var news in articles) {
          hottestNewsList.add(NewsModel.fromJson(news));
        }
        hottestNewsList.value = hottestNewsList.sublist(0,5);
      } else {
        print("Something Went Wrong");
      }
    } catch (ex) {
      print(ex);
    }
    isHottestLoading.value = false;
  }
  Future<void> getTeslaNews() async {
    isTeslaLoading.value = true;
    var baseURL = "https://newsapi.org/v2/everything?q=tesla&from=2024-01-04&sortBy=publishedAt&apiKey=881ec1f9283a47d3addf07e373e9fa35";
    var response = await http.get(Uri.parse(baseURL));
    try {
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"]; // Correct key is "articles"
        for (var news in articles) {
          teslaNewsList.add(NewsModel.fromJson(news));
        }
        teslaNewsList.value = teslaNewsList.sublist(0,5);
      } else {
        print("Something Went Wrong");
      }
    } catch (ex) {
      print(ex);
    }
    isTeslaLoading.value = false;
  }
  Future<void> getBuisnessNews() async {
    isbuisnessLoading.value = true;
    var baseURL = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=881ec1f9283a47d3addf07e373e9fa35";
    var response = await http.get(Uri.parse(baseURL));
    try {
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"]; // Correct key is "articles"
        for (var news in articles) {
          buisnessHeadlineNewsList.add(NewsModel.fromJson(news));
        }
        buisnessHeadlineNewsList.value = buisnessHeadlineNewsList.sublist(0,5);
      } else {
        print("Something Went Wrong");
      }
    } catch (ex) {
      print(ex);
    }
    isbuisnessLoading.value = false;
  }
  Future<void> getWallStreetNews() async {
    isWallStreetLoading.value = true;
    var baseURL = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=881ec1f9283a47d3addf07e373e9fa35";
    var response = await http.get(Uri.parse(baseURL));
    try {
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"]; // Correct key is "articles"
        for (var news in articles) {
          wallStreetNewsList.add(NewsModel.fromJson(news));
        }
        wallStreetNewsList.value = wallStreetNewsList.sublist(0,5);
      } else {
        print("Something Went Wrong");
      }
    } catch (ex) {
      print(ex);
    }
    isWallStreetLoading.value = false;
  }

  Future<void> speak(String text) async{
   await flutterTts.setLanguage("en-US");
   await flutterTts.setPitch(1);
   await flutterTts.setSpeechRate(0.5);
   await flutterTts.speak(text);
  }


}