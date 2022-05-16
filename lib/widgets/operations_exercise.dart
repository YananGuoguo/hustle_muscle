import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'colors.dart' as color;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'input_field.dart';

class OperationsExercise extends StatelessWidget {
  const OperationsExercise({Key? key}) : super(key: key);

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
          children: const [
            Text(
                "Add Exercise",
                style: TextStyle(fontSize: 30)),
            MyInputField(title: "Title", hint: "Enter your title"),
            MyInputField(title: "Title", hint: "Enter your title"),
            MyInputField(title: "Title", hint: "Enter your title"),
            MyInputField(title: "Title", hint: "Enter your title"),

          ],
        )),
      ),
    );
  }
}
