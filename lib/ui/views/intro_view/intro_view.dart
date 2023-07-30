import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:resturant/main.dart';
import 'package:resturant/ui/shared/colors.dart';
import 'package:resturant/ui/shared/custom_widgets/custom_button_new.dart';
import 'package:resturant/ui/views/intro_view/intro_controller.dart';
import 'package:resturant/ui/views/landing_view/landing_view.dart';
import 'package:resturant/ui/views/landing_view/landing_view_nn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  List<String> titleList = [
    'Find Food You Love',
    'Fast Delivery',
    'Live Tracking'
  ];
  List<String> descriptionList = [
    'Discover the best foods from over 1,000\n restaurants and fast delivery to your doorstep',
    'Fast food delivery to your home, office\nwherever you are',
    'Real time tracking of your food on the app\nonce you placed the order'
  ];
  introController controller = Get.put(introController());
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.width * 0.05, horizontal: size.width * 0.07),
          child: Obx(() {
            return Column(
              children: [
                20.ph,
                SvgPicture.asset(
                    'assets/images/intro${controller.currentIndex.value}.svg'),
                10.ph,
                new DotsIndicator(
                  dotsCount: 3,
                  position: controller.currentIndex.value.toDouble(),
                  decorator: DotsDecorator(
                      color: AppColors.greyDotsIndicator,
                      activeColor: AppColors.mainorangecolor),
                ),
                20.ph,
                Text(
                  titleList[controller.currentIndex.value],
                  style: TextStyle(
                      color: AppColors.greyintrotext,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.07),
                ),
                30.ph,
                Text(
                  descriptionList[controller.currentIndex.value],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.greydescriptionList,
                      fontSize: size.width * 0.035),
                ),
                Spacer(),
                CustomButtonNew(
                    text: controller.isntEqualTwo() ? 'Next' : 'Finish',
                    textsize: size.width * 0.04,
                    backgroundcolor: AppColors.mainorangecolor,
                    onpressed: () async {
                      if (controller.isntEqualTwo()) {
                        controller.incressIndex();
                      } else {
                        Get.to(LandingViewNN());
                      }
                    })
              ],
            );
          })),
    ));
  }
}
