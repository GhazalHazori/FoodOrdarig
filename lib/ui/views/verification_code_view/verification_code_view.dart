import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:resturant/main.dart';
import 'package:resturant/ui/shared/colors.dart';
import 'package:resturant/ui/shared/custom_widgets/custom_button_new.dart';
import 'package:resturant/ui/shared/utlis.dart';
import 'package:resturant/ui/views/verification_code_view/verification_code_controller.dart';

class VerificationCodeView extends StatefulWidget {
  const VerificationCodeView({super.key});

  @override
  State<VerificationCodeView> createState() => _VerificationCodeViewState();
}

class _VerificationCodeViewState extends State<VerificationCodeView> {
  verificationController controller = Get.put(verificationController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          screenWidth(20).ph,
          Text(
            "We have sent an OTP to\n          your Mobile",
            style: TextStyle(
                color: AppColors.blacktext, fontSize: screenWidth(15)),
          ),
          screenWidth(20).ph,
          Text(
            "Pleas check your mobile number 071*****12\n       continue to reset your password",
            style: TextStyle(
                color: AppColors.greycolor.withOpacity(0.5),
                fontSize: screenWidth(25)),
          ),
          screenWidth(10).ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
            child: PinCodeTextField(
              appContext: context,
              length: 4,
              obscureText: false,
              animationType: AnimationType.fade,
              hintCharacter: '*',
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 50,
                activeFillColor: Colors.white,
              ),
              animationDuration: Duration(milliseconds: 300),
              backgroundColor: Colors.blue.shade50,
              enableActiveFill: true,
              controller: controller.textEditingController,
              onCompleted: controller.onCommplet
              // (v) {
              //   print("Completed");
              // },
              ,
              onChanged: controller.onChange,
              beforeTextPaste: controller.onBeforeTextPaste
              //  (text) {
              //   print("Allowing to paste $text");
              //   //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //   //but you can show anything you want here, like your pop up saying wrong paste format or etc
              //   return true;
              // }
              ,
            ),
          ),
          screenWidth(10).ph,
          CustomButtonNew(text: "Next", onpressed: () {}),
          screenWidth(10).ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Didn\'t Receive?",
                style: TextStyle(
                    color: AppColors.greycolor, fontSize: screenWidth(20)),
              ),
              Text(
                "Click Here",
                style: TextStyle(
                    color: AppColors.mainorangecolor,
                    fontSize: screenWidth(15)),
              )
            ],
          )
        ],
      ),
    ));
  }
}
