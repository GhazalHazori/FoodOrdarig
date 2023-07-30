import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant/ui/shared/colors.dart';
import 'package:resturant/ui/shared/custom_widgets/custom_button_new.dart';
import 'package:resturant/ui/shared/utlis.dart';
import 'package:resturant/ui/views/cart_view/cart_view_controller.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartController controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          return Column(
            children: [
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              controller
                                  .removeFromCart(controller.cartList[index]);
                            },
                            icon: Icon(Icons.delete)),
                        Column(
                          children: [
                            Text(
                              controller.cartList[index].meal?.name ?? '',
                              style: TextStyle(fontSize: screenWidth(10)),
                            ),
                            Text(
                              controller.cartList[index].meal!.price.toString(),
                              style: TextStyle(fontSize: screenWidth(10)),
                            ),
                            Row(
                              children: [
                                CustomButtonNew(
                                    text: '-',
                                    textsize: 15,
                                    onpressed: () {
                                      controller.changeCount(
                                          false, controller.cartList[index]);
                                    }),
                                CustomButtonNew(
                                    text: '+',
                                    textsize: 15,
                                    onpressed: () {
                                      controller.changeCount(
                                          true, controller.cartList[index]);
                                    })
                              ],
                            ),
                            Text(
                              controller.cartList[index].total.toString(),
                              style: TextStyle(fontSize: screenWidth(10)),
                            )
                          ],
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      width: screenWidth(1),
                      height: 2,
                      color: AppColors.mainorangecolor,
                    );
                  },
                  itemCount: controller.cartList.length),
              // CustomButtonNew(
              //     text: 'subtotal',
              //     textsize: screenWidth(40),
              //     onpressed: () {
              //       controller.subTotal();
              //     }),
              // Obx(() => Text(
              //       controller.subTotalPrice.toString(),
              //       style: TextStyle(fontSize: screenWidth(20)),
              //     )),
              // Obx(() => Text(
              //       controller.tax.toString(),
              //       style: TextStyle(fontSize: screenWidth(20)),
              //     )),
              // Obx(() => Text(
              //       controller.deliveryFees.toString(),
              //       style: TextStyle(fontSize: screenWidth(20)),
              //     )),
              // Obx(() => Text(
              //       controller.total.toString(),
              //       style: TextStyle(fontSize: screenWidth(20)),
              //     ))
              Text("subTotal:${controller.calcsubTotal()}"),
              Text("tax:${controller.calcTax()}"),
              Text("Delivery:${controller.calcDelivery()}"),
              Text("Total:${controller.calcTotal()}"),
              CustomButtonNew(
                text: 'Checkout',
                onpressed: () {
                  controller.checkout();
                },
              )
            ],
          );
        }),
      ),
    );
  }
}
