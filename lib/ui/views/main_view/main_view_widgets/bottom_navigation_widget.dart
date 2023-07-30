import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resturant/core/enums/bottom_navigation_enum.dart';
import 'package:resturant/ui/shared/colors.dart';
import 'package:resturant/ui/shared/utlis.dart';

class BottomNavigationWidget extends StatefulWidget {
  final BottomNavigationEnum navitm;
  final Function(BottomNavigationEnum, int) ontap;
  const BottomNavigationWidget(
      {super.key, required this.navitm, required this.ontap});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: screenWidth(6)),
          child: InkWell(
            onTap: () {
              widget.ontap(BottomNavigationEnum.HOME, 2);
            },
            child: CircleAvatar(
              radius: screenWidth(10),
              backgroundColor: widget.navitm == BottomNavigationEnum.HOME
                  ? AppColors.mainorangecolor
                  : AppColors.greycolor,
              child: SvgPicture.asset('assets/images/ic_home.svg'),
            ),
          ),
        ),
        // SvgPicture.asset(
        //   'assets/imagesbg_bottom_navigation.svg',
        //   fit: BoxFit.fitWidth,
        // ),

        CustomPaint(
          painter: ClipShadowShadowPainter(
            clipper: navclipper(),
            shadow: Shadow(
                blurRadius: 12,
                offset: Offset(0, 1),
                color: AppColors.greycolor),
          ),
          child: ClipPath(
            clipper: navclipper(),
            child: Container(
              color: AppColors.whitecolor,
              width: screenWidth(1),
              height: screenWidth(4),
            ),
          ),
        ),
        Positioned(
          bottom: screenWidth(12),
          left: screenWidth(20),
          right: screenWidth(20),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth(40)),
            child: Row(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  navItem(
                      ontap: () {
                        widget.ontap(BottomNavigationEnum.MENU, 0);
                      },
                      size: size,
                      imagename: 'ic_menu',
                      text: 'Menue',
                      isslected: widget.navitm == BottomNavigationEnum.MENU),
                  SizedBox(
                    width: screenWidth(12),
                  ),
                  navItem(
                      ontap: () {
                        widget.ontap(BottomNavigationEnum.OFFERS, 1);
                      },
                      size: size,
                      imagename: 'ic_shopping',
                      text: 'Offers',
                      isslected: widget.navitm == BottomNavigationEnum.OFFERS)
                ],
              ),
              SizedBox(
                width: screenWidth(5.5),
              ),
              Row(
                children: [
                  navItem(
                      ontap: () {
                        widget.ontap(BottomNavigationEnum.PRIFILE, 3);
                      },
                      size: size,
                      imagename: 'ic_user',
                      text: 'Profile',
                      isslected: widget.navitm == BottomNavigationEnum.PRIFILE),
                  SizedBox(
                    width: screenWidth(10),
                  ),
                  navItem(
                      ontap: () {
                        widget.ontap(BottomNavigationEnum.MORE, 4);
                      },
                      size: size,
                      imagename: 'ic_more',
                      text: 'More',
                      isslected: widget.navitm == BottomNavigationEnum.MORE)
                ],
              )
            ]),
          ),
        ),
      ],
    );
  }

  Widget navItem(
      {required Size size,
      required String imagename,
      required String text,
      required bool isslected,
      required Function ontap}) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/$imagename.svg',
            color: isslected ? AppColors.mainorangecolor : AppColors.greycolor,
            width: screenWidth(20),
          ),
          Text(
            text,
            style: TextStyle(
                color: isslected
                    ? AppColors.mainorangecolor
                    : AppColors.greycolor),
          )
        ],
      ),
    );
  }
}

class navclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width * 0.3381500, 0);
    path0.quadraticBezierTo(size.width * 0.3731500, size.height * 0.0069000,
        size.width * 0.3757000, size.height * 0.1236000);
    path0.quadraticBezierTo(size.width * 0.4022000, size.height * 0.5633000,
        size.width * 0.5006000, size.height * 0.5896000);
    path0.quadraticBezierTo(size.width * 0.5955500, size.height * 0.5727000,
        size.width * 0.6200000, size.height * 0.1240000);
    path0.quadraticBezierTo(size.width * 0.6204500, size.height * -0.0157000,
        size.width * 0.6646000, 0);
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(0, 0);
    path0.lineTo(size.width * 0.6225000, size.height * 0.6100000);
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  ClipShadowShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
