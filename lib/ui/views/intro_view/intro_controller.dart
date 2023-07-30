import 'package:get/get.dart';
import 'package:resturant/core/services/base_controller.dart';

class introController extends BaseControoler {
  RxInt currentIndex = 0.obs;
  bool isntEqualTwo() {
    return currentIndex != 2;
  }

  int incressIndex() {
    if (isntEqualTwo()) {
      currentIndex.value += 1;
    } else {
      currentIndex.value = 0;
    }
    return currentIndex.value;
  }
}
