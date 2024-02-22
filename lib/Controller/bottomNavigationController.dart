import 'package:get/get.dart';
import 'package:news_app/Pages/articlePage/articlePage.dart';
import 'package:news_app/Pages/homePage/Widgets/homePage.dart';
import 'package:news_app/Pages/profilePage/profile.dart';
class bottomNavigationController extends GetxController{
  RxInt index = 0.obs;
  var pages = [
    homePage(),
    articlePage(),
    profile(),
  ];
}