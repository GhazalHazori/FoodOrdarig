import 'package:get/get.dart';
import 'package:resturant/core/services/base_controller.dart';
import 'package:resturant/ui/shared/utlis.dart';
import 'package:resturant/ui/views/main_view/main_view.dart';

class CheckoutController extends BaseControoler {
  @override
  void onClose() {
    cartService.clearCart();
    Get.off(MainView());
    super.onClose();
  }
}
