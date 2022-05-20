import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hustle_muscle/widgets/operations_exercise.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../controllers/category_controller.dart';
import '../controllers/exercise_controller.dart';
import 'colors.dart' as color;

class VideoDetail extends StatefulWidget {
  const VideoDetail({Key? key}) : super(key: key);

  @override
  State<VideoDetail> createState() => _VideoDetailState();
}

class _VideoDetailState extends State<VideoDetail> {
  String youtubeUrl = Get.arguments[0];
  String _title = Get.arguments[1];
  String _description = Get.arguments[2];
  String _repeat = Get.arguments[3];
  String _time = Get.arguments[4];
  late YoutubePlayerController _controller;

  _initData() async {
    String? youtubeId = YoutubePlayer.convertUrlToId(youtubeUrl);
    final controller = YoutubePlayerController(
      initialVideoId: youtubeId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        enableCaption: true,
        isLive: false,
      ),
    );
    _controller = controller;
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              color: color.AppColor.gradientSecond,
            ),
            child: Column(
              children: [
                Column(children: [
                  Container(
                    height: 80,
                    padding: const EdgeInsets.only(
                        top: 30, left: 30, right: 30, bottom: 15),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 20,
                            color: color.AppColor.secondPageIconColor,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Icon(
                          Icons.info_outline,
                          size: 20,
                          color: color.AppColor.secondPageTopIconColor,
                        )
                      ],
                    ),
                  ),
                  _playView(context),
                ]),
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(
                          top: 20,
                        ),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(70))),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Row(),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(child: _listView())
                          ],
                        )))
              ],
            )));
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null) {
      return YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: controller,
          ),
          builder: (context, player) {
            return AspectRatio(aspectRatio: 16 / 9, child: player);
          });
    } else {
      return const Text("Being initialized please wait!");
    }
  }

  _listView() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Row(
            children: [
              const Icon(Icons.touch_app_outlined,
                  size: 25, color: Colors.deepPurpleAccent),
              const SizedBox(width: 35,),
              Text(_title,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black54,
                  )),
            ],
          ),
          const Divider(height: 22, color: Colors.deepPurpleAccent),
          Row(
            children: const [
              Icon(Icons.pending_actions_outlined,
                  size: 25, color: Colors.deepPurpleAccent),
              SizedBox(width: 35,),
              Text("Description",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black54,
                  )),
            ],
          ),
          SizedBox(
            width: 250,
            child:
              Text(_description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  )),
          ),
          const Divider(height: 22, color: Colors.deepPurpleAccent),
          Row(
            children: [
              Container(
                width: 180,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                      color.AppColor.secondPageContainerGradient1stColor,
                      color.AppColor.secondPageContainerGradient2ndColor,
                    ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.timer_sharp,
                      size: 18, color: color.AppColor.secondPageIconColor),
                  const SizedBox(width: 5),
                  Text("$_time sec",
                      style: TextStyle(
                          fontSize: 16,
                          color: color.AppColor.secondPageIconColor))
                ]),
              ),
              Expanded(child: Container()),
              Container(
                width: 180,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                      color.AppColor.secondPageContainerGradient1stColor,
                      color.AppColor.secondPageContainerGradient2ndColor,
                    ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.fitness_center_outlined,
                      size: 18, color: color.AppColor.secondPageIconColor),
                  const SizedBox(width: 5),
                  Text("$_repeat rpt",
                      style: TextStyle(
                          fontSize: 16,
                          color: color.AppColor.secondPageIconColor))
                ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}
