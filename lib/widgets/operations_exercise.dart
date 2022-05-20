import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hustle_muscle/controllers/exercise_controller.dart';
import '../models/class_exercise.dart';
import 'colors.dart' as color;
import 'input_field.dart';

class OperationsExercise extends StatefulWidget {
  const OperationsExercise({Key? key}) : super(key: key);

  @override
  State<OperationsExercise> createState() => _OperationsExerciseState();
}

class _OperationsExerciseState extends State<OperationsExercise> {
  final ExerciseController _exerciseController = Get.put(ExerciseController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _repeatController = TextEditingController();
  String imageUri = "";
  int _selectedCategoryId = 1;

  String _selectedCategory = "abdominaux";
  List<String> categoryId = [
    'abdominaux',
    'biceps',
    'cuisses',
    'dos',
    'epaules',
    'mollets',
    'parties',
    'triceps',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: color.AppColor.secondPageContainerGradient1stColor,
          leading: GestureDetector(
              onTap: () {
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
            MyInputField(
                title: "Title",
                hint: "Enter your title",
                controller: _titleController),
            MyInputField(
              title: "Description",
              hint: "Enter Description",
              controller: _descriptionController,
            ),
            MyInputField(
              title: "Time",
              hint: "Enter Time",
              controller: _timeController,
            ),
            MyInputField(
              title: "Repeat",
              hint: "Enter Repeat",
              controller: _repeatController,
            ),
            MyInputField(
              title: "Category",
              hint: _selectedCategory,
              widget: DropdownButton(
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.deepPurpleAccent,
                ),
                iconSize: 32,
                elevation: 4,
                underline: const SizedBox(
                  height: 0,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue!;
                  });
                },
                items:
                    categoryId.map<DropdownMenuItem<String>>((String? value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value!),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextButton(
              onPressed: () => _validateData(),
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

  _validateData() {
    if (_titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _timeController.text.isNotEmpty &&
        _repeatController.text.isNotEmpty) {
      _addExerciseToDb();
      _exerciseController.getExerciseByCategory(categoryId);
      Get.back();
    } else if (_titleController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _timeController.text.isEmpty ||
        _repeatController.text.isEmpty) {
      Get.snackbar("Required", "All fields are required! ",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Colors.pink,
          icon: const Icon(
            Icons.warning_amber_outlined,
            color: Colors.pink,
          ));
    }
  }

  _addExerciseToDb() async {
    switch (_selectedCategory) {
      case "abdominaux":
        {
          _selectedCategoryId = 1;
          imageUri = "assets/images/abdominaux.jpg";
        }
        break;
      case "biceps":
        {
          _selectedCategoryId = 2;
          imageUri = "assets/images/biceps.jpg";
        }
        break;
      case "cuisses":
        {
          _selectedCategoryId = 3;
          imageUri = "assets/images/cuisses.jpg";
        }
        break;
      case "dos":
        {
          _selectedCategoryId = 4;
          imageUri = "assets/images/dos.jpg";
        }
        break;
      case "epaules":
        {
          _selectedCategoryId = 5;
          imageUri = "assets/images/epaules.jpg";
        }
        break;
      case "mollets":
        {
          _selectedCategoryId = 6;
          imageUri = "assets/images/mollets.jpg";
        }
        break;
      case "parties":
        {
          _selectedCategoryId = 7;
          imageUri = "assets/images/parties.jpg";
        }
        break;
      case "triceps":
        {
          _selectedCategoryId = 8;
          imageUri = "assets/images/triceps.jpg";
        }
        break;
    }
    int value = await _exerciseController.addExercise(
        exercise: Exercise(
            title: _titleController.text,
            description: _descriptionController.text,
            time: int.parse(_timeController.text),
            repeat: int.parse(_repeatController.text),
            category: _selectedCategoryId,
            img: imageUri,
            video: "https://www.youtube.com/watch?v=GQyWIur03aw"));
    print("My id is " "$value");
  }
}
