import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hustle_muscle/widgets/edit_exercise.dart';
import 'package:hustle_muscle/widgets/operations_exercise.dart';
import 'package:hustle_muscle/widgets/video_detail.dart';
import '../controllers/exercise_controller.dart';
import '../models/class_exercise.dart';
import 'colors.dart' as color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  RxList<Exercise> exerciseShow = Get.arguments[0];
  int categoryId = Get.arguments[1];
  String categoryTitle = "";
  int _length = 0;
  final _exerciseController = Get.put(ExerciseController());

  _initData() {
    _exerciseController.exerciseList = exerciseShow;
    switch (categoryId) {
      case 1:
        {
          categoryTitle = "abdominaux";
        }
        break;
      case 2:
        {
          categoryTitle = "biceps";
        }
        break;
      case 3:
        {
          categoryTitle = "cuisses";
        }
        break;
      case 4:
        {
          categoryTitle = "dos";
        }
        break;
      case 5:
        {
          categoryTitle = "epaules";
        }
        break;
      case 6:
        {
          categoryTitle = "mollets";
        }
        break;
      case 7:
        {
          categoryTitle = "parties";
        }
        break;
      case 8:
        {
          categoryTitle = "triceps";
        }
        break;
      case -1:
        {
          categoryTitle = "All Workouts";
        }
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _initData();
    _length = exerciseShow.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                  color.AppColor.gradientFirst,
                  color.AppColor.gradientSecond,
                ],
                    begin: const FractionalOffset(0.0, 0.4),
                    end: Alignment.topRight)),
            child: Column(
              children: [
                Container(
                    padding:
                        const EdgeInsets.only(top: 40, right: 30, left: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 220,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(Icons.arrow_back_ios_new_outlined,
                                  size: 16,
                                  color: color.AppColor.secondPageIconColor),
                            ),
                            Expanded(child: Container()),
                            InkWell(
                              //Create fun()
                              onTap: () async {
                                await Get.to(()=>const OperationsExercise());
                                _length++;
                                setState(() {
                                  categoryId == -1
                                      ? _exerciseController.getExercises()
                                      : _exerciseController
                                          .getExerciseByCategory(categoryId);
                                  _length++;
                                  _length=_exerciseController.exerciseList.length;
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.add_outlined,
                                      size: 16,
                                      color:
                                          color.AppColor.secondPageIconColor),
                                  Text("Add New Exercise",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color:
                                            color.AppColor.secondPageIconColor,
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(categoryTitle,
                            style: TextStyle(
                              fontSize: 20,
                              color: color.AppColor.secondPageTitleColor,
                            )),
                        const SizedBox(height: 5),
                        Text("Your Own Workout",
                            style: TextStyle(
                              fontSize: 20,
                              color: color.AppColor.secondPageTitleColor,
                            )),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Container(
                              width: 90,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      colors: [
                                        color.AppColor
                                            .secondPageContainerGradient1stColor,
                                        color.AppColor
                                            .secondPageContainerGradient2ndColor,
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.timer_sharp,
                                        size: 18,
                                        color:
                                            color.AppColor.secondPageIconColor),
                                    const SizedBox(width: 5),
                                    Text("68 min",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: color
                                                .AppColor.secondPageIconColor))
                                  ]),
                            ),
                            Expanded(child: Container()),
                            Container(
                              width: 250,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      colors: [
                                        color.AppColor
                                            .secondPageContainerGradient1stColor,
                                        color.AppColor
                                            .secondPageContainerGradient2ndColor,
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.fitness_center_outlined,
                                        size: 18,
                                        color:
                                            color.AppColor.secondPageIconColor),
                                    const SizedBox(width: 5),
                                    Text("Resistent band, kettebell",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: color
                                                .AppColor.secondPageIconColor))
                                  ]),
                            )
                          ],
                        ),
                        const SizedBox(width: 20)
                      ],
                    )),
                Expanded(
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(70))),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                const SizedBox(width: 30),
                                Text(categoryTitle,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: color.AppColor.circuitsColor)),
                                Expanded(child: Container()),

                                //TODO: Ontap refresh

                                InkWell(
                                  onTap: (){
                                      categoryId == -1
                                          ? _exerciseController.getExercises()
                                          : _exerciseController
                                          .getExerciseByCategory(categoryId);
                                      setState(() {

                                      });
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.loop,
                                          size: 30,
                                          color: color.AppColor.loopColor),
                                      const SizedBox(width: 10),
                                      Text("$_length actions",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: color.AppColor.setsColor,
                                          ))
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 30),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(child: _listView())
                          ],
                        )))
              ],
            )));
  }

  _listView() {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 1),
        itemCount: exerciseShow.length,
        itemBuilder: (context, int index) {
          return SizedBox(
              height: 120,
              child: Column(
                children: [
                  Row(
                    children: [
                      //TODO: Get.to video_detail Page
                      GestureDetector(
                        onTap: () {
                          Get.to(()=>const VideoDetail(), arguments: [exerciseShow[index].video.toString(),
                            exerciseShow[index].title.toString(),
                            exerciseShow[index].description.toString(),
                            exerciseShow[index].repeat.toString(),
                            exerciseShow[index].time.toString(),
                          ]);
                        },
                        child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(
                                      exerciseShow[index].img.toString()),
                                  fit: BoxFit.cover,
                                ))),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            exerciseShow[index].title.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Text(
                              "Repeat: " +
                                  exerciseShow[index].repeat.toString(),
                              style: TextStyle(color: Colors.grey[500]),
                            ),
                          )
                        ],
                      ),
                      Expanded(child: Container()),
                      InkWell(
                        onTap: () async {
                          await Get.to(()=>const EditExercise(), arguments: exerciseShow[index]);
                          setState(() {
                            categoryId == -1
                                ? _exerciseController.getExercises()
                                : _exerciseController
                                .getExerciseByCategory(categoryId);
                            _length++;
                            _length=_exerciseController.exerciseList.length;
                          });
                        },
                        child: const Icon(Icons.edit,
                            size: 35, color: Colors.blueAccent),
                      ),
                      const SizedBox(
                        width: 28,
                      ),
                      GestureDetector(
                        //Delete Function
                        onTap: () {
                          _exerciseController.delete(exerciseShow[index]);
                          setState(() {
                            categoryId == -1
                                ? _exerciseController.getExercises()
                                : _exerciseController
                                .getExerciseByCategory(categoryId);
                            _length--;
                            _length = _exerciseController.exerciseList.length;
                          });
                        },
                        child: const Icon(Icons.delete,
                            size: 35, color: Colors.blueAccent),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 20,
                        decoration: BoxDecoration(
                          color: const Color(0xFFeaeefc),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                            child: Text("30s rest",
                                style: TextStyle(color: Color(0xFF839fed)))),
                      ),
                      Row(children: [
                        for (int i = 0; i < 70; i++)
                          i.isEven
                              ? Container(
                                  width: 3.5,
                                  height: 1,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF839fed),
                                      borderRadius: BorderRadius.circular(2)),
                                )
                              : Container(
                                  width: 3.5,
                                  height: 1,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(2)),
                                )
                      ])
                    ],
                  )
                ],
              ));
        });
  }
}
