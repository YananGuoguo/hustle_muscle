import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  color: Colors.purple,
                )
              ],
            )));
  }
}
