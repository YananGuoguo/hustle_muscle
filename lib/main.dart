import 'package:flutter/material.dart';
import 'package:hustle_muscle/home_page.dart';
import 'package:get/get.dart';
import 'package:hustle_muscle/video_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hustle Muscle',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
            const HomePage()
            // const VideoInfo()
    );
  }
}
