import 'package:get/get.dart';
import 'package:hustle_muscle/utilitaires/db_helper.dart';

import '../models/class_category.dart';

class CategoryController extends GetxController {

  @override
  void onReady() {
    super.onReady();
  }

  var categoryList = <Category>[].obs;

  void getCategories() async {
    print("Get Exercises");
    List<Map<String, dynamic>> categories = await DBHelper.queryCategory();
    categoryList.assignAll(categories.map((data)=> Category.fromJson(data)).toList());
    print("in categoryList" "$categoryList");
  }
}
