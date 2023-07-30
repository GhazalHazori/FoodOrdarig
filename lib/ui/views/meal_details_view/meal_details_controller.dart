import 'package:get/get.dart';
import 'package:resturant/core/data/models/apis/meal_model.dart';
import 'package:resturant/core/services/base_controller.dart';

class MealDatailsController extends BaseControoler {
  MealModel mealitem = MealModel();
  RxInt counter = 1.obs;
  int subcounter() {
    counter--;
    return counter.value;
  }

  int sumcounter() {
    counter++;
    return counter.value;
  }
}
