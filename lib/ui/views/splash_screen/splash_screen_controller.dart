import 'package:get/get.dart';
import 'package:resturant/core/enums/message_type.dart';
import 'package:resturant/ui/shared/custom_widgets/custom_toast.dart';
import 'package:resturant/ui/shared/utlis.dart';
import 'package:resturant/ui/views/intro_view/intro_view.dart';
import 'package:resturant/ui/views/landing_view/landding-view-new.dart';
import 'package:resturant/ui/views/landing_view/landing_view.dart';
import 'package:resturant/ui/views/landing_view/landing_view_nn.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    if (storage.getOrderPlaced()) {
      cartService.clearCart();
      storage.setOrderPlaced(false);
    }
    Future.delayed(Duration(seconds: 5)).then((value) {
      if (storage.getFirstLunch()) {
        Get.off(IntroView);
      } else {
        // return SharedPrefrenceRepository.getLogeedIn()
        //     ? Get.off(MainView)
        // :
        Get.off(LandingView);
      }
      storage.setFirstLunch(false);
      // if (storage.getSubStatus()) {
      //   Get.off(LandingViewNN());
      // } else {
      //   CustomToast.showMessage(
      //       message: "Your Sub expired", messagetype: MessagType.WARNING);
      // }
    });
    super.onInit();
  }
}
