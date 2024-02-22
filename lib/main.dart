import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controller/appController.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'news_app',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
        home: appController(),
    );
  }
}


