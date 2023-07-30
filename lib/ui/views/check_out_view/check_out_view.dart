import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant/ui/shared/custom_widgets/custom_button_new.dart';
import 'package:resturant/ui/shared/utlis.dart';
import 'package:resturant/ui/views/main_view/main_view.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  CheckoutView controller = Get.put(CheckoutView());
  @override
  void initState() {
    storage.setOrderPlaced(true);
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Text(
            'sub Total:${cartService.subTotal.value}',
            style: TextStyle(fontSize: screenWidth(10)),
          ),
          Text(
            'Tax:${cartService.tax.value}',
            style: TextStyle(fontSize: screenWidth(10)),
          ),
          Text(
            'Delivery:${cartService.delivery.value}',
            style: TextStyle(fontSize: screenWidth(10)),
          ),
          Text(
            'Total:${cartService.total.value}',
            style: TextStyle(fontSize: screenWidth(10)),
          ),
          CustomButtonNew(
              text: 'Continue shopping',
              onpressed: () {
                cartService.clearCart();
                Get.off(MainView());
              })
        ],
      ),
    ));
  }
}
