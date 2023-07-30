import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant/core/data/models/apis/meal_model.dart';
import 'package:resturant/main.dart';
import 'package:resturant/ui/shared/colors.dart';

import 'package:resturant/ui/views/meal_details_view/meal_details_controller.dart';

class MealDatialsView extends StatefulWidget {
  final MealModel mealitem;
  MealDatialsView({super.key, required this.mealitem});

  @override
  State<MealDatialsView> createState() => _MealDatialsViewState();
}

class _MealDatialsViewState extends State<MealDatialsView> {
  MealDatailsController controller = Get.put(MealDatailsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CachedNetworkImage(imageUrl: 'http://via.placeholder.com/350x150'),
          Container(
            decoration: BoxDecoration(
              color: AppColors.whitecolor,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Column(
              children: [
                Text(controller.mealitem.name ?? ''),
                15.ph,
                Text("${controller.mealitem.price}??' ' "),
                15.ph,
                Text(
                  'Descraption',
                  style: TextStyle(fontSize: 30, color: AppColors.blacktext),
                ),
                15.ph,
                Text(
                  controller.mealitem.description ?? '',
                  style: TextStyle(color: AppColors.greycolor),
                ),
                Row(
                  children: [
                    Text(
                      'Number of portation',
                      style: TextStyle(
                          color: AppColors.blacktext,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                    10.pw,
                    ElevatedButton(
                      child: Text('-'),
                      onPressed: () {
                        controller.counter > 1
                            ? controller.subcounter()
                            // pricnew = controller.idetprice();
                            : null;
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(20, 20),
                          backgroundColor: AppColors.mainorangecolor),
                    ),
                    ElevatedButton(
                      child: Obx(() => Text("${controller.counter}")),
                      onPressed: () {
                        controller.counter;
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(20, 20),
                          backgroundColor: AppColors.mainorangecolor),
                    ),
                    15.pw,
                    ElevatedButton(
                      child: Text('+'),
                      onPressed: () {
                        controller.sumcounter();
                        // pricnew = controller.idetprice();
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(20, 20),
                          backgroundColor: AppColors.mainorangecolor),
                    ),
                  ],
                ),
                Obx(() => Text("${controller.counter * 1500}"))
              ],
            ),
          )
        ],
      ),
    ));
  }
}
