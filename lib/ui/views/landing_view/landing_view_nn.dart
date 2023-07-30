import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:resturant/main.dart';
import 'package:resturant/ui/shared/utlis.dart';
import 'package:resturant/ui/views/landing_view/landing_view_controller.dart';
import 'package:resturant/ui/views/main_view/home_view/home_view.dart';
import 'package:resturant/ui/views/main_view/main_view.dart';
import 'package:resturant/ui/views/map_view/maps_view.dart';

import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_button_new.dart';

class LandingViewNN extends StatefulWidget {
  const LandingViewNN({super.key});

  @override
  State<LandingViewNN> createState() => _LandingViewNNState();
}

class _LandingViewNNState extends State<LandingViewNN> {
  LandingController controller = Get.put(LandingController());
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              ClipPath(
                  clipper: ghazalClipper(),
                  child: Container(
                    color: AppColors.mainorangecolor,
                    width: screenWidth(1),
                    height: screenHeight(2),
                  )),
              SvgPicture.asset(
                'assets/images/Background objects.svg',
                width: screenWidth(1),
                height: screenHeight(2),
              ),
              SvgPicture.asset(
                'assets/images/Logo.svg',
                height: screenHeight(8),
                width: screenWidth(10),
              )
            ],
          ),
          SizedBox(
            height: screenWidth(5),
          ),
          Center(
            child: Text(
              '   Discover the best foods from over 1,000\n resturants and fast delivery to your doorstep',
              style: TextStyle(
                  color: AppColors.greytextcolor, fontSize: screenWidth(25)),
            ),
          ),
          60.ph,
          Obx(() {
            return CustomButtonNew(
              text: 'Login',
              onpressed: ()
                  // async
                  {
                Get.to(MainView());
                // LocationData? curretLocation =
                //     await locationService.getCurrentLocation();
                // if (curretLocation != null) {
                //   Get.to(MapsView(
                //     currentLocation: curretLocation,
                //   ));
                // }
                // Location location = new Location();

                // bool _serviceEnabled;
                // PermissionStatus _permissionGranted;
                // LocationData _locationData;

                // _serviceEnabled = await location.serviceEnabled();
                // if (!_serviceEnabled) {
                //   _serviceEnabled = await location.requestService();
                //   if (!_serviceEnabled) {
                //     return;
                //   }
                // }

                // _permissionGranted = await location.hasPermission();
                // if (_permissionGranted == PermissionStatus.denied) {
                //   _permissionGranted = await location.requestPermission();
                //   if (_permissionGranted != PermissionStatus.granted) {
                //     return;
                //   }
                // }

                // _locationData = await location.getLocation();
                // print(_locationData);

                // List<geo.Placemark> placemarks =
                //     await geo.placemarkFromCoordinates(
                //         _locationData.latitude ?? 0.0,
                //         _locationData.longitude ?? 0.0);

                // print(placemarks[0]);
              },
              backgroundcolor: controller.buttonColor.value,
              textcolor: AppColors.whitecolor,
              textsize: screenWidth(30),
            );
          }),
          25.ph,
          CustomButtonNew(
            text: 'Create an Account',
            onpressed: () {},
            backgroundcolor: AppColors.whitecolor,
            textcolor: AppColors.mainorangecolor,
            textsize: screenWidth(80),
            bordercolor: AppColors.mainorangecolor,
          )
        ],
      ),
    ));
  }
}

class ghazalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.quadraticBezierTo(size.width * 0.1536875, size.height * 1.0106600,
        size.width * 0.2154500, size.height);
    path0.cubicTo(
        size.width * 0.3363875,
        size.height * 1.0039800,
        size.width * 0.1003250,
        size.height * 0.7377600,
        size.width * 0.4995875,
        size.height * 0.6911000);
    path0.cubicTo(
        size.width * 0.9083000,
        size.height * 0.7483600,
        size.width * 0.6952375,
        size.height * 1.0092800,
        size.width * 0.8103375,
        size.height);
    path0.quadraticBezierTo(size.width * 0.8739875, size.height * 1.0079800,
        size.width, size.height);
    path0.lineTo(size.width, 0);
    path0.lineTo(0, 0);

    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
