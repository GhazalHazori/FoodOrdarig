import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:resturant/main.dart';
import 'package:resturant/ui/shared/colors.dart';
import 'package:resturant/ui/shared/custom_widgets/custom_button_new.dart';
import 'package:resturant/ui/shared/utlis.dart';
import 'package:resturant/ui/views/login_view/login_view.dart';
import 'package:geocoding/geocoding.dart ' as geo;

class LandingViewNew extends StatelessWidget {
  const LandingViewNew({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              ClipPath(
                  clipper: ghazalClipper(),
                  child: Container(
                    color: AppColors.mainorangecolor,
                    width: size.width,
                    height: size.width,
                  )),
              SvgPicture.asset(
                'assets/imagesBackground objects.svg',
                width: size.width,
                height: size.width,
              ),
              30.ph,
              SvgPicture.asset(
                'assets/imagesLogo.svg',
                height: size.width * 0.30,
              )
            ],
          ),
          SizedBox(height: size.width * 0.25),
          Column(children: [
            Center(
              child: Text(
                '   Discover the best foods from over 1,000\n resturants and fast delivery to your doorstep',
                style: TextStyle(
                    color: AppColors.greytextcolor,
                    fontSize: size.width * 0.04),
              ),
            ),
            60.ph,
            CustomButtonNew(
              text: 'Login',
              onpressed: () async {
                // _navigatortobuttonlogin(context);
                Location location = new Location();

                bool _serviceEnabled;
                PermissionStatus _permissionGranted;
                LocationData _locationData;

                _serviceEnabled = await location.serviceEnabled();
                if (!_serviceEnabled) {
                  _serviceEnabled = await location.requestService();
                  if (!_serviceEnabled) {
                    return;
                  }
                }

                _permissionGranted = await location.hasPermission();
                if (_permissionGranted == PermissionStatus.denied) {
                  _permissionGranted = await location.requestPermission();
                  if (_permissionGranted != PermissionStatus.granted) {
                    await Get.defaultDialog(
                        middleText:
                            "The application dosen\'t work without location pleas permission to your application",
                        middleTextStyle: TextStyle(
                            color: AppColors.blacktext,
                            fontSize: screenWidth(35)),
                        textConfirm: "OK",
                        textCancel: "No Thanks",
                        cancelTextColor: AppColors.blacktext,
                        confirmTextColor: AppColors.blacktext,
                        onCancel: () {
                          exit(0);
                        },
                        onConfirm: () async {
                          _permissionGranted =
                              await location.requestPermission();
                        });
                  }
                }

                _locationData = await location.getLocation();
                print(_locationData);

                List<geo.Placemark> placemarks =
                    await geo.placemarkFromCoordinates(
                        _locationData.latitude ?? 0.0,
                        _locationData.longitude ?? 0.0);

                print(placemarks[0]);
              },
              backgroundcolor: AppColors.mainorangecolor,
              textcolor: AppColors.whitecolor,
              textsize: size.width * 0.04,
            ),
            25.ph,
            CustomButtonNew(
              text: 'Create an Account',
              onpressed: () {},
              backgroundcolor: AppColors.whitecolor,
              textcolor: AppColors.mainorangecolor,
              textsize: size.width * 0.04,
              bordercolor: AppColors.mainorangecolor,
            )
          ])
          // SizedBox(
          //   height: size.height * 0.7,
          // ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       'Discover the best foods from over 1,000\n resturants and fast delivery to your doorstep',
          //       style: TextStyle(
          //           color: AppColors.greytextcolor,
          //           fontSize: size.width * 0.06),
          //     ),
          //     CustomButtonNew(
          //       text: 'Login',
          //       onpressed: () {},
          //       backgroundcolor: AppColors.mainorangecolor,
          //       textcolor: AppColors.whitecolor,
          //       textsize: size.width * 0.04,
          //     ),
          //     CustomButtonNew(
          //       text: 'Create an Account',
          //       onpressed: () {},
          //       backgroundcolor: AppColors.whitecolor,
          //       textcolor: AppColors.mainorangecolor,
          //       textsize: size.width * 0.04,
          //     )
          //   ],
          // )
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

void _navigatortobuttonlogin(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => LoginView()));
}
