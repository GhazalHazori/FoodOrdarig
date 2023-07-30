import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:resturant/core/data/repositories/user_repository.dart';
import 'package:resturant/core/enums/file_type_enum.dart';
import 'package:resturant/core/enums/message_type.dart';
import 'package:resturant/ui/shared/colors.dart';
import 'package:resturant/ui/shared/custom_widgets/custom_button_new.dart';
import 'package:resturant/ui/shared/custom_widgets/custom_toast.dart';
import 'package:resturant/ui/shared/utlis.dart';
import 'package:resturant/ui/views/main_view/main_view.dart';
import 'package:resturant/ui/views/signup_view/signup_view_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  SignUpController controller = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Obx(() {
      return ListView(
        children: [
          Center(
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                InkWell(
                  onTap: controller.selectedFile == null ||
                          controller.selectedFile!.path.isEmpty
                      ? () {
                          controller.setShowOption(false);
                        }
                      : null,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.mainorangecolor,
                    child: controller.selectedFile == null
                        ? Icon(Icons.person)
                        : controller.selectedFile!.path.isNotEmpty &&
                                controller.selectedFile!.type ==
                                    FileTypeEnum.FILE
                            ? Icon(Icons.file_copy)
                            : controller.selectedFile!.path.isNotEmpty
                                ? Image.file(
                                    File(controller.selectedFile!.path))
                                : Icon(Icons.person),
                  ),
                ),
                Visibility(
                    visible: controller.selectedFile != null &&
                        controller.selectedFile!.path.isNotEmpty,
                    child: InkWell(
                      onTap: () {
                        controller.setShowOption(true);
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.bluecolor,
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Visibility(
              visible: controller.showOptions,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButtonNew(
                      text: 'Camera',
                      onpressed: () {
                        controller
                            .pickFile(FileTypeEnum.CAMERA)
                            .then((value) => controller.selectedFile = value);
                      }),
                  CustomButtonNew(
                      text: 'Gallery',
                      onpressed: () {
                        controller
                            .pickFile(FileTypeEnum.GALLERY)
                            .then((value) => controller.selectedFile = value);
                      }),
                  CustomButtonNew(
                      text: 'File',
                      onpressed: () {
                        controller
                            .pickFile(FileTypeEnum.FILE)
                            .then((value) => controller.selectedFile = value);
                      })
                ],
              )),
          CustomButtonNew(
              text: 'Register',
              onpressed: () {
        
              }),
          Lottie.asset(
            'assets/lottie/145958-figma-to-lottie-face.json',
          ),
          CustomButtonNew(
            text: 'Open Link',
            onpressed: () async {
              final Uri _url = Uri.parse('https://flutter.dev');
              if (!await launchUrl(
                _url,
                mode: LaunchMode.externalApplication,
              )) {
                CustomToast.showMessage(
                    message: 'Cant open url', messagetype: MessagType.REJECTED);
              }
            },
          )
        ],
      );
    })));
  }
}
