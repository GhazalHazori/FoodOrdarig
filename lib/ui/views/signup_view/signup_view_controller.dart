import 'dart:ffi';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resturant/core/data/models/apis/file_model.dart';
import 'package:resturant/core/data/repositories/user_repository.dart';
import 'package:resturant/core/enums/file_type_enum.dart';
import 'package:resturant/core/enums/message_type.dart';
import 'package:resturant/core/services/base_controller.dart';
import 'package:resturant/ui/shared/custom_widgets/custom_toast.dart';
import 'package:resturant/ui/shared/utlis.dart';
import 'package:resturant/ui/views/main_view/main_view.dart';

class SignUpController extends BaseControoler {
  RxBool shoeOptions = false.obs;
  FileModel? selectedFile;
  bool showOptions = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController firstName = TextEditingController();
   TextEditingController lastName = TextEditingController();
  final ImagePicker picker = ImagePicker();
  void setShowOption(bool value) {
    shoeOptions.value = value;
  }

  void login() {
    UserRepository()
        .register(
      firstname: firstName.text,
      lastname: lastName.text,
      photo: selectedFile!.path,
      age: int.parse(age.text),
      email: email.text,
      password: password.text,
    )
        .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messagetype: MessagType.REJECTED);
      }, (r) {
        CustomToast.showMessage(
            message: "Registerd Successfully",
            messagetype: MessagType.SUCCSESS);
        UserRepository()
            .login(email: 'ghazalhazori2233@gmail.com', password: 'ghazal2233')
            .then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messagetype: MessagType.REJECTED);
          }, (r) {
            storage.setIsLoggedIn(true);
            storage.setTokenInfo(r);
            Get.off(MainView());
          });
        });
      });
    });
  }

  Future<FileModel> pickFile(FileTypeEnum type) async {
    String path = '';
    switch (type) {
      case FileTypeEnum.CAMERA:
        await picker
            .pickImage(source: ImageSource.camera)
            .then((value) => path = value?.path ?? '');
        break;
      case FileTypeEnum.GALLERY:
        await picker
            .pickImage(source: ImageSource.gallery)
            .then((value) => path = value?.path ?? '');
        break;
      case FileTypeEnum.FILE:
        await FilePicker.platform
            .pickFiles()
            .then((value) => path = value?.paths[0] ?? '');
        break;
    }
    setShowOption(false);
    return FileModel(path.isNotEmpty ? path : selectedFile!.path,
        path.isNotEmpty ? type : selectedFile!.type);
  }
}
