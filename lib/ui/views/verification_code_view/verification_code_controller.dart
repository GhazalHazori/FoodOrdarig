import 'package:flutter/material.dart';
import 'package:resturant/core/services/base_controller.dart';

class verificationController extends BaseControoler {
  TextEditingController textEditingController = TextEditingController();
  void onCommplet(v) {
    print("Completed");
  }

  void onChange(value) {
    print(value);
  }

  bool onBeforeTextPaste(text) {
    print("Allowing to paste $text");
    return true;
  }
}
