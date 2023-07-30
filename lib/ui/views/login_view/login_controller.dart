import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:resturant/core/data/repositories/user_repository.dart';
import 'package:resturant/core/enums/message_type.dart';
import 'package:resturant/core/services/base_controller.dart';
import 'package:resturant/ui/shared/custom_widgets/custom_toast.dart';
import 'package:resturant/ui/shared/utlis.dart';
import 'package:resturant/ui/views/main_view/main_view.dart';

class LoginController extends BaseControoler {
  TextEditingController emailController =
      TextEditingController(text: 'Test@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: 'Test@1234');

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  void login() {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      UserRepository()
          .login(email: emailController.text, password: passwordController.text)
          .then((value) {
        value.fold((l) {
          isLoading.value = false;
          CustomToast.showMessage(message: l, messagetype: MessagType.REJECTED);
        }, (r) {
          storage.setIsLoggedIn(true);
          storage.setTokenInfo(r);
          Get.off(MainView(), transition: Transition.fadeIn);
        });
      });
    } else {}
  }
}
