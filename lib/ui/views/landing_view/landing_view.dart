import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resturant/ui/shared/colors.dart';
import 'package:resturant/ui/shared/custom_widgets/custom_button_new.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            body:
                Stack(alignment: AlignmentDirectional.bottomCenter, children: [
      Padding(
        padding: EdgeInsets.only(bottom: size.height * 0.6),
        child: ClipPath(
            clipper: Monkeyshape(),
            child: Container(
              color: AppColors.mainorangecolor,
              width: size.width,
            )),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: size.height * 0.55),
        child: Container(
          child: SvgPicture.asset(
            'assets/images/Background objects.svg',
            width: size.width,
            height: size.height,
            //height: size.height * 0.9,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: size.height * 0.5),
        child: Container(
          child: SvgPicture.asset('assets/imagesLogo.svg'),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: size.height * 0.55),
        child: Column(
          children: [
            Text(
              'Discover the best foods from over 1,000',
              style: TextStyle(color: Colors.grey, fontSize: size.width * 0.04),
            ),
            Text(
              'restaurants and fast delivery to your doorstep',
              style: TextStyle(color: Colors.grey),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: size.width * 0.08),
                child: CustomButtonNew(
                  text: 'Login',
                  onpressed: () {},
                  backgroundcolor: AppColors.mainorangecolor,
                  textsize: size.width * 0.04,
                  bordercolor: AppColors.mainorangecolor,
                )
                // ElevatedButton(
                //   onPressed: () {},
                //   child: Text(
                //     'Login',
                //     style: TextStyle(color: AppColors.whitecolor),
                //   ),
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: AppColors.mainorangecolor,
                //     fixedSize: Size(size.width * 0.8, size.height * 0.06),
                //     shape: StadiumBorder(),
                //   ),
                // ),
                ),
            CustomButtonNew(
              text: 'Create an Account',
              onpressed: () {},
              textcolor: AppColors.mainorangecolor,
              backgroundcolor: AppColors.whitecolor,
              textsize: size.width * 0.04,
              bordercolor: AppColors.mainorangecolor,
            ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: Text(
            //     'Create an Account',
            //     style: TextStyle(color: AppColors.mainorangecolor),
            //   ),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: AppColors.whitecolor,
            //     shape: StadiumBorder(),
            //     side: BorderSide(color: AppColors.mainorangecolor),
            //     fixedSize: Size(size.width * 0.8, size.height * 0.06),
            //   ),
            //)
          ],
        ),
      ),
    ])));
  }
}

class Monkeyshape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(size.width * 0.1962500, size.height);
    path0.quadraticBezierTo(size.width * 0.1597875, size.height * 0.5300000,
        size.width * 0.5004000, size.height * 0.5259600);
    path0.quadraticBezierTo(size.width * 0.8056250, size.height * 0.5219200,
        size.width * 0.8225000, size.height);
    path0.lineTo(size.width, size.height);
    path0.lineTo(size.width * 0.9975000, size.height * 0.0060000);
    path0.lineTo(0, 0);
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
