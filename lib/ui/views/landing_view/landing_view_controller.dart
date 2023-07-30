import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant/core/enums/nitification_type.dart';
import 'package:resturant/core/services/base_controller.dart';
import 'package:resturant/ui/shared/colors.dart';
import 'package:resturant/ui/shared/utlis.dart';

class LandingController extends BaseControoler {
  Rx<Color> buttonColor = AppColors.mainorangecolor.obs;
  @override
  void onInit() {
    notificationService.notifcationStream.stream.listen((event) {
      if (event.notifctionType == NotificationType.CHANGECOLOR.name) {
        buttonColor.value = AppColors.bluecolor;
      }
    });
    super.onInit();
  }
}
