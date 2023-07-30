import 'package:get/get.dart';
import 'package:resturant/core/data/models/apis/cart_model.dart';
import 'package:resturant/core/services/base_controller.dart';
import 'package:resturant/ui/shared/utlis.dart';
import 'package:resturant/ui/views/check_out_view/check_out_view.dart';

class CartController extends BaseControoler {
  RxList<CartModel> cartList = <CartModel>[].obs;
  RxDouble subTotalPrice = 0.0.obs;
  RxDouble total = 0.0.obs;
  RxDouble totalPrice = 0.0.obs;
  RxDouble deliveryFees = 0.0.obs;
  RxDouble tax = 0.0.obs;
  @override
  void onInit() {
    cartList.value = storage.getCartList();
    changeTotals();
    super.onInit();
  }

  void removeFromCart(CartModel model) {
    cartList.remove(model);
    storage.setCartList(cartList);
  }

  void changeCount(bool incress, CartModel model) {
    CartModel result = cartList.firstWhere(
        (element) => element.meal!.id == model.meal!.id,
        orElse: () => CartModel());
    int index = cartList.indexOf(result);
    if (incress) {
      result.count = result.count! + 1;
      result.total = result.total! + model.meal!.price!;
    } else {
      if (result.count! > 1) {
        result.count = result.count! - 1;
        result.total = result.total! - model.meal!.price!;
      }
    }
    cartList.remove(result);
    cartList.insert(index, result);
    storage.setCartList(cartList);
  }

  void subTotal() {
    double totalPrice = 0;
    cartList.forEach((element) {
      totalPrice += element.total!;
    });

    subTotalPrice.value = totalPrice;
    tax.value = 0.18 * subTotalPrice.value;
    deliveryFees.value = 0.1 * (subTotalPrice.value + tax.value);
    total.value = subTotalPrice.value + tax.value + deliveryFees.value;
  }

  double calcsubTotal() {
    return cartList.fold(0.0, (sum, element) => sum + element.total!);
  }

  double calcTax() {
    return calcsubTotal() * 0.18;
  }

  double calcDelivery() {
    return (calcTax() + calcsubTotal()) * 0.1;
  }

  double calcTotal() {
    return (calcsubTotal() + calcTax() + calcDelivery());
  }

  void checkout() {
    runFullLoadingFunction(
        function: Future.delayed(Duration(seconds: 2)).then((value) {
      Get.off(CheckoutView());
    }));
  }

  void changeTotals() {
    calcsubTotal();
    calcTax();
    calcDelivery();
    calcTotal();
  }
}
