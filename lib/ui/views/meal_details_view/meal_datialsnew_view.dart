import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant/core/data/models/apis/meal_model.dart';
import 'package:resturant/main.dart';
import 'package:resturant/ui/shared/colors.dart';
import 'package:resturant/ui/shared/custom_widgets/custom_button_new.dart';
import 'package:resturant/ui/shared/utlis.dart';
import 'package:resturant/ui/views/cart_view/cart_view.dart';
import 'package:resturant/ui/views/meal_details_view/meal_detailsnew_controller.dart';

class MealDatailsNewView extends StatefulWidget {
  final MealModel model;
  const MealDatailsNewView({super.key, required this.model});

  @override
  State<MealDatailsNewView> createState() => _MealDatailsNewViewState();
}

class _MealDatailsNewViewState extends State<MealDatailsNewView> {
  late MealDatialsNewController controller;

  @override
  void initState() {
    controller = Get.put(MealDatialsNewController(widget.model));
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            20.ph,
            Text(
              'price:${widget.model.price ?? '1000'}',
              style: TextStyle(fontSize: screenWidth(25)),
            ),
            20.ph,
            Obx(() {
              return Row(
                children: [
                  CustomButtonNew(
                    textsize: screenWidth(20),
                    text: '-',
                    onpressed: () {
                      controller.changecount(false);
                    },
                    backgroundcolor: controller.count == 1
                        ? AppColors.greycolor
                        : AppColors.mainorangecolor,
                  ),
                  CustomButtonNew(
                      textsize: screenWidth(18),
                      textcolor: AppColors.blacktext,
                      backgroundcolor: AppColors.whitecolor,
                      text: controller.count.value.toString(),
                      onpressed: () {}),
                  CustomButtonNew(
                      backgroundcolor: AppColors.mainorangecolor,
                      textsize: screenWidth(20),
                      text: '+',
                      onpressed: () {
                        controller.changecount(true);
                      })
                ],
              );
            }),
            20.ph,
            Obx(() {
              return Text(
                '${controller.calcTotal()}',
                style: TextStyle(fontSize: screenWidth(25)),
              );
            }),
            CustomButtonNew(
                text: 'add',
                textsize: screenWidth(20),
                onpressed: () {
                  controller.addToCart();
                  Get.to(() => CartView());
                })
          ],
        ),
      ),
    );
  }
}
