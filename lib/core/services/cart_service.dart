// import 'package:resturant/core/data/models/apis/cart_model.dart';
// import 'package:resturant/ui/shared/utlis.dart';

// class cartServices {
//   List<CartModel> cartList = storage.getCartList();

//   int getMealIndex(CartModel model) {
//     CartModel result = cartList.firstWhere(
//         (element) => element.meal!.id == model.meal!.id,
//         orElse: () => CartModel());
//     return result.count != null ? cartList.indexOf(result) : -1;
//   }

//   bool isMealIndex(CartModel model) => getMealIndex(model) != -1;
// }
import 'package:get/get.dart';
import 'package:resturant/core/data/models/apis/cart_model.dart';
import 'package:resturant/core/data/models/apis/meal_model.dart';
import 'package:resturant/ui/shared/utlis.dart';

class CartService {
  RxList<CartModel> cartList = storage.getCartList().obs;
  RxInt cartCount = 0.obs;
  RxDouble subTotal = 0.0.obs;
  RxDouble tax = 0.0.obs;
  RxDouble delivery = 0.0.obs;
  RxDouble total = 0.0.obs;
  CartService() {
    cartCount.value = getCartCount();
  }
  void addToCart(
      {required MealModel model, required int count, Function? afterAdd}) {
    if (getCartModel(model) != null) {
      int index = cartList.indexOf(getCartModel(model)!);
      cartList[index].count = cartList[index].count! + count;
      cartList[index].total = cartList[index].total! + (count * model.price!);
    } else {
      cartList.add(CartModel(
          count: count, total: (count * model.price!).toDouble(), meal: model));
    }
    cartCount.value += count;
    calcTotals();
    storage.setCartList(cartList);
    if (afterAdd != null) afterAdd();
  }

  void removeFromCart({required CartModel model, Function? afterRemove}) {
    cartList.remove(model);
    storage.setCartList(cartList);
    cartCount.value -= model.count!;
    calcTotals();
    if (afterRemove != null) afterRemove();
  }

  void changeCount(
      {required bool incress,
      required CartModel model,
      Function? afterChange}) {
    CartModel result = getCartModel(model.meal!)!;
    int index = cartList.indexOf(result);
    if (incress) {
      result.count = result.count! + 1;
      result.total = result.total! + model.meal!.price!;
      cartCount.value += 1;
    } else {
      if (result.count! > 1) {
        result.count = result.count! - 1;
        result.total = result.total! - model.meal!.price!;
        cartCount.value -= 1;
      }
    }
    cartList.remove(result);
    cartList.insert(index, result);
    calcTotals();
    storage.setCartList(cartList);
    if (afterChange != null) afterChange();
  }

  CartModel? getCartModel(MealModel model) {
    try {
      return cartList.firstWhere((element) => element.meal!.id == model.id);
    } catch (e) {
      return null;
    }
  }

  int getCartCount() {
    return cartList.fold(
        0, (previousValue, element) => previousValue + element.count!);
  }

  void calcTotals() {
    subTotal.value = cartList.fold(
        0, (previousValue, element) => previousValue + element.total!);
    tax.value = subTotal.value * taxAmount;
    delivery.value = (subTotal.value + tax.value) * deliveryAmount;
    total.value = subTotal.value + tax.value + delivery.value;
  }

  void clearCart() {
    cartList.clear();
    storage.setCartList(cartList);
    cartCount.value = 0;
    calcTotals();
  }
}
