import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];
  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      info = json.decode(value);
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color.AppColor.homePageBackground,
        body: Container(
            padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Training",
                        style: TextStyle(
                            fontSize: 25,
                            color: color.AppColor.homePageTitle,
                            fontWeight: FontWeight.w700)),
                    Expanded(child: Container()),
                    Icon(Icons.arrow_back_ios_new_outlined,
                        size: 16, color: color.AppColor.homePageIcons),
                    const SizedBox(width: 10),
                    Icon(Icons.calendar_today_outlined,
                        size: 16, color: color.AppColor.homePageIcons),
                    const SizedBox(width: 10),
                    Icon(Icons.arrow_forward_ios_outlined,
                        size: 16, color: color.AppColor.homePageIcons)
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text("Your Program",
                        style: TextStyle(
                            fontSize: 18,
                            color: color.AppColor.homePageSubtitle,
                            fontWeight: FontWeight.w600)),
                    Expanded(child: Container()),
                    Text("Details",
                        style: TextStyle(
                            fontSize: 18,
                            color: color.AppColor.homePageDetail,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(width: 5),
                    Icon(Icons.arrow_forward_ios_outlined,
                        size: 16, color: color.AppColor.homePageIcons)
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              color.AppColor.gradientFirst.withOpacity(0.8),
                              color.AppColor.gradientSecond.withOpacity(0.9)
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.centerRight),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topRight: Radius.circular(80)),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(10, 10),
                              blurRadius: 20,
                              color: color.AppColor.gradientSecond
                                  .withOpacity(0.5))
                        ]),
                    child: Container(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 15,
                          right: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Next Workout",
                                style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      color.AppColor.homePageContainerTextSmall,
                                )),
                            const SizedBox(height: 5),
                            Text("Legs Toning",
                                style: TextStyle(
                                  fontSize: 20,
                                  color:
                                      color.AppColor.homePageContainerTextSmall,
                                )),
                            const SizedBox(height: 5),
                            Text("Glutes Workout",
                                style: TextStyle(
                                  fontSize: 20,
                                  color:
                                      color.AppColor.homePageContainerTextSmall,
                                )),
                            const SizedBox(height: 15),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.timer_sharp,
                                        size: 18,
                                        color: color.AppColor
                                            .homePageContainerTextSmall),
                                    const SizedBox(width: 10),
                                    Text("60 min",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: color.AppColor
                                              .homePageContainerTextSmall,
                                        )),
                                  ],
                                ),
                                Expanded(child: Container()),
                                const Icon(Icons.play_circle_outline_outlined,
                                    color: Colors.white, size: 50)
                              ],
                            )
                          ],
                        ))),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text("Workout Goals",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: color.AppColor.homePageTitle))
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: info.length,
                        itemBuilder: (_, i) {
                          return Row(
                            children: [
                              Container(
                                  width: 200,
                                  height: 170,
                                  padding: const EdgeInsets.only(bottom: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: AssetImage(
                                            info[i]['img']
                                            )),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 3,
                                            offset: const Offset(5, 5),
                                            color: color.AppColor.gradientSecond
                                                .withOpacity(0.1)),
                                        BoxShadow(
                                            blurRadius: 3,
                                            offset: const Offset(-5, -5),
                                            color: color.AppColor.gradientSecond
                                                .withOpacity(0.1))
                                      ]),
                                  child: Center(
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text("glues",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: color
                                                  .AppColor.homePageDetail)),
                                    ),
                                  )),
                            ],
                          );
                        }))
              ],
            )));
  }
}
