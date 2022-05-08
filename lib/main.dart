import 'package:flutter/material.dart';
import 'package:hustle_muscle/home_page.dart';
import 'colors.dart' as color;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          backgroundColor: color.AppColor.homePageBackground,
          body: Container(
              padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Training",
                          style: TextStyle(
                              fontSize: 30,
                              color: color.AppColor.homePageTitle,
                              fontWeight: FontWeight.w700)),
                      Expanded(child: Container()),
                      Icon(Icons.arrow_back_ios_new_outlined,
                          size: 20, color: color.AppColor.homePageIcons),
                      const SizedBox(width: 10),
                      Icon(Icons.calendar_today_outlined,
                          size: 20, color: color.AppColor.homePageIcons),
                      const SizedBox(width: 10),
                      Icon(Icons.arrow_forward_ios_outlined,
                          size: 20, color: color.AppColor.homePageIcons)
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text("Your Program",
                          style: TextStyle(
                              fontSize: 20,
                              color: color.AppColor.homePageSubtitle,
                              fontWeight: FontWeight.w600)),
                      Expanded(child: Container()),
                      Text("Details",
                          style: TextStyle(
                              fontSize: 20,
                              color: color.AppColor.homePageDetail,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(width: 5),
                      Icon(Icons.arrow_forward_ios_outlined,
                          size: 18, color: color.AppColor.homePageIcons)
                    ],
                  ),
                  Container()
                ],
              ))),
    );
  }
}
