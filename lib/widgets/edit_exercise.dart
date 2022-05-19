import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hustle_muscle/controllers/exercise_controller.dart';
import '../models/class_exercise.dart';
import 'colors.dart' as color;
import 'input_field.dart';

class EditExercise extends StatefulWidget {
  const EditExercise({Key? key}) : super(key: key);

  @override
  State<EditExercise> createState() => _EditExerciseState();
}

class _EditExerciseState extends State<EditExercise> {
  final ExerciseController _exerciseController = Get.put(ExerciseController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _repeatController = TextEditingController();
  Exercise exercise = Get.arguments;
  String imageUri = "";
  int _selectedCategoryId = 1;
  int _exerciseID = 1;

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

  _init() {
    _exerciseID = exercise.id!;
    _selectedCategoryId = exercise.category!;
    switch (_selectedCategoryId) {
      case 1:
        {
          _selectedCategory = "abdominaux";
        }
        break;
      case 2:
        {
          _selectedCategory = "biceps";
        }
        break;
      case 3:
        {
          _selectedCategory = "cuisses";
        }
        break;
      case 4:
        {
          _selectedCategory = "dos";
        }
        break;
      case 5:
        {
          _selectedCategory = "epaules";
        }
        break;
      case 6:
        {
          _selectedCategory = "mollets";
        }
        break;
      case 7:
        {
          _selectedCategory = "parties";
        }
        break;
      case 8:
        {
          _selectedCategory = "triceps";
        }
        break;
    }
    _descriptionController.text=exercise.description.toString();
    _titleController.text = exercise.title!;
    _timeController.text = exercise.time.toString();
    _repeatController.text = exercise.repeat.toString();
  }

  @override
  void initState() {
    super.initState();
    _init();
    print("_selectedCategory:::$_selectedCategory");
  }

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
            const Text("Update Exercise", style: TextStyle(fontSize: 30)),
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
            Row(
              children: [
                TextButton(
                  onPressed: () => _validateData(),
                  child: const Text(
                    'Edit',
                  ),
                  style: TextButton.styleFrom(
                    fixedSize: const Size.fromWidth(170),
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 5, bottom: 5),
                      primary: Colors.white,
                      backgroundColor:
                      color.AppColor.secondPageContainerGradient1stColor,
                      textStyle: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                ),
                Expanded(child: Container()),
                TextButton(
                  onPressed: () => _onDelete(),
                  child: const Text(
                    'Delete',
                  ),
                  style: TextButton.styleFrom(
                      fixedSize: const Size.fromWidth(170),
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 5, bottom: 5),
                      primary: Colors.white,
                      backgroundColor:
                      Colors.pink,
                      textStyle: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                ),
              ],
            )
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
      _exerciseController.getExerciseByCategory(categoryId);
      _updateExerciseToDb();
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

  _onDelete(){
    _exerciseController.delete(exercise);
    _exerciseController.getExerciseByCategory(exercise.category);
    Get.back();
  }

  _updateExerciseToDb() async {
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
    await _exerciseController.editExercise(
        exercise: Exercise(
            id: _exerciseID,
            title: _titleController.text,
            description: _descriptionController.text,
            time: int.parse(_timeController.text),
            repeat: int.parse(_repeatController.text),
            category: _selectedCategoryId,
            img: imageUri,
            video: "https://www.youtube.com/watch?v=GQyWIur03aw"));
  }
}
