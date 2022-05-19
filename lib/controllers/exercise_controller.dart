import 'package:get/get.dart';
import 'package:hustle_muscle/utilitaires/db_helper.dart';

import '../models/class_exercise.dart';

class ExerciseController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  var exerciseList = <Exercise>[].obs;
  // var exerciseListByCategory = <Exercise>[].obs;

  Future<int> addExercise({Exercise? exercise}) async{
    return await DBHelper.insert(exercise);
  }

  void getExercises() async {
    print("Get Exercises");
    List<Map<String, dynamic>> exercises = await DBHelper.query();
    exerciseList.assignAll(exercises.map((data)=> Exercise.fromJson(data)).toList());
  }

  void getExerciseByCategory(category) async {
    print("Call queryExerciseByCategory");
    List<Map<String, dynamic>> exercises = await DBHelper.queryExerciseByCategory(category);
    exerciseList.assignAll(exercises.map((data)=> Exercise.fromJson(data)).toList());
  }

  void delete(Exercise exercise){
    var val = DBHelper.delete(exercise);
    print (val);
  }

}
