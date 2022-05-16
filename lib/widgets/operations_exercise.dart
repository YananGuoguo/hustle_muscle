import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'colors.dart' as color;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'input_field.dart';

class OperationsExercise extends StatefulWidget {
  const OperationsExercise({Key? key}) : super(key: key);

  @override
  State<OperationsExercise> createState() => _OperationsExerciseState();
}

class _OperationsExerciseState extends State<OperationsExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: color.AppColor.secondPageContainerGradient1stColor,
          leading: GestureDetector(
              onTap: () {
                debugPrint("Go back");
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios_outlined,
                  size: 18, color: Colors.white))),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
            child: Column(
          children: [
            const Text("Add Exercise", style: TextStyle(fontSize: 30)),
            const MyInputField(title: "Title", hint: "Enter your title"),
            const MyInputField(title: "Description", hint: "Enter Description"),
            const MyInputField(title: "Time", hint: "Enter Time"),
            const MyInputField(title: "Repeat", hint: "Enter Repeat"),
            const SizedBox(height: 25,),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Create',
              ),
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 5),
                  primary: Colors.white,
                  backgroundColor:
                      color.AppColor.secondPageContainerGradient1stColor,
                  textStyle: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
            ),
          ],
        )),
      ),
    );
  }
}
