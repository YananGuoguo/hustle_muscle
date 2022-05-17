import 'package:get/get.dart';
import 'package:hustle_muscle/utilitaires/db_helper.dart';

import '../models/class_exercise.dart';

class ExerciseController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  var exerciseList = <Exercise>[].obs;

  Future<int> addExercise({Exercise? exercise}) async{
    return await DBHelper.insert(exercise);
  }



  void getExercises() async {
    List<Map<String, dynamic>> exercises = await DBHelper.query();
    exerciseList.assignAll(exercises.map((data)=> new Exercise.fromJson(data)).toList());
  }

}
