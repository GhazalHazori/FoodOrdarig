// // import 'package:cached_network_image/cached_network_image.dart';
// // import 'package:flutter/material.dart';
// // import 'package:resturant/core/data/models/apis/category_model.dart';
// // import 'package:resturant/core/data/repositories/category_repository.dart';
// // import 'package:resturant/core/enums/message_type.dart';
// // import 'package:resturant/ui/shared/colors.dart';
// // import 'package:resturant/ui/shared/custom_widgets/custom_toast.dart';

// // class HomeView extends StatefulWidget {
// //   final Function onPressed;
// //   HomeView({Key? key, required this.onPressed}) : super(key: key);

// //   @override
// //   State<HomeView> createState() => _HomeViewState();
// // }

// // class _HomeViewState extends State<HomeView> {
// //   List<CategoryModel> categoryList = [];
// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //           drawer: Container(
// //             color: AppColors.redcolor,
// //           ),
// //           body: Column(
// //             children: [
// //               Visibility(
// //                 visible: categoryList.length == 0,
// //                 child: InkWell(
// //                   onTap: () {
// //                     CategoryRepository().getAll().then((value) {
// //                       value.fold((l) {
// //                         CustomToast.showMessage(
// //                             context: context,
// //                             message: l,
// //                             messagetype: MessagType.REJECTED);
// //                       }, (r) {
// //                         setState(() {
// //                           categoryList.addAll(r);
// //                         });
// //                       });
// //                     });
// //                   },
// //                   child: CircleAvatar(
// //                     backgroundColor: AppColors.mainorangecolor,
// //                     child: Icon(Icons.menu),
// //                     radius: 15,
// //                   ),
// //                 ),
// //               ),
// //               Visibility(
// //                 visible: categoryList.length > 0,
// //                 child: Expanded(
// //                   child: ListView.builder(
// //                     scrollDirection: Axis.horizontal,
// //                     shrinkWrap: true,
// //                     itemCount: categoryList.length,
// //                     itemBuilder: (BuildContext context, int index) {
// //                       return Column(
// //                         children: [
// //                           CachedNetworkImage(
// //                             imageUrl: 'http://via.placeholder.com/350x150',
// //                             placeholder: (context, url) =>
// //                                 CircularProgressIndicator(),
// //                             errorWidget: (context, url, error) =>
// //                                 Icon(Icons.error),
// //                           ),
// //                           Text(
// //                             categoryList[index].name ?? '',
// //                             style: TextStyle(fontSize: 50),
// //                           ),
// //                         ],
// //                       );
// //                     },
// //                   ),
// //                 ),
// //               )
// //             ],
// //           )),
// //     );
// //   }
// // }

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:resturant/core/data/models/apis/category_model.dart';
// import 'package:resturant/core/data/models/apis/meal_model.dart';
// import 'package:resturant/core/data/repositories/category_repository.dart';
// import 'package:resturant/core/data/repositories/meal_repository.dart';
// import 'package:resturant/core/enums/message_type.dart';
// import 'package:resturant/ui/shared/colors.dart';
// import 'package:dartz/dartz.dart' as dartz;
// import 'package:resturant/ui/shared/custom_widgets/custom_toast.dart';

// class HomeView extends StatefulWidget {
//   final Function onPressed;
//   HomeView({Key? key, required this.onPressed}) : super(key: key);

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   List<CategoryModel> categoryList = [];
//   List<MealModel> mealList = [];
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           drawer: Container(
//             color: AppColors.redcolor,
//           ),
//           body: FutureBuilder<List<dynamic>>(
//               future: Future.wait([
//                 CategoryRepository().getAll(),
//                 MealRepository().getAll(),
//               ]),
//               builder: ((context, AsyncSnapshot<List<dynamic>> snapshot1) {
//                 var categories = snapshot1.data != null
//                     ? snapshot1.data![0]
//                         as dartz.Either<String, List<CategoryModel>>
//                     : null;
//                 var meals = snapshot1.data != null
//                     ? snapshot1.data![1]
//                         as dartz.Either<String, List<MealModel>>
//                     : null;

//                 if (snapshot1.connectionState != ConnectionState.waiting) {
//                   categories!.fold((l) {
//                     CustomToast.showMessage(
//                         message: l, messagetype: MessagType.REJECTED);
//                   }, (r) {
//                     categoryList.clear();
//                     categoryList.addAll(r);
//                   });

//                   meals!.fold((l) {
//                     CustomToast.showMessage(
//                         message: l, messagetype: MessagType.REJECTED);
//                   }, (r) {
//                     mealList.clear();
//                     mealList.addAll(r);
//                   });
//                 }
//                 return Column(
//                   children: [
//                     categories == null
//                         ? SpinKitCircle(
//                             color: AppColors.mainorangecolor,
//                           )
//                         : Expanded(
//                             child: ListView.builder(
//                               scrollDirection: Axis.horizontal,
//                               shrinkWrap: true,
//                               itemCount: categoryList.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return Column(
//                                   children: [
//                                     CachedNetworkImage(
//                                       imageUrl:
//                                           'http://via.placeholder.com/350x150',
//                                       placeholder: (context, url) =>
//                                           CircularProgressIndicator(),
//                                       errorWidget: (context, url, error) =>
//                                           Icon(Icons.error),
//                                     ),
//                                     Text(
//                                       categoryList[index].name ?? '',
//                                       style: TextStyle(fontSize: 50),
//                                     ),
//                                   ],
//                                 );
//                               },
//                             ),
//                           ),
//                     meals == null
//                         ? SpinKitCircle(
//                             color: AppColors.mainorangecolor,
//                           )
//                         : Expanded(
//                             child: ListView.builder(
//                               scrollDirection: Axis.vertical,
//                               shrinkWrap: true,
//                               itemCount: mealList.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return Column(
//                                   children: [
//                                     CachedNetworkImage(
//                                       imageUrl:
//                                           'http://via.placeholder.com/350x150',
//                                       placeholder: (context, url) =>
//                                           CircularProgressIndicator(),
//                                       errorWidget: (context, url, error) =>
//                                           Icon(Icons.error),
//                                     ),
//                                     Text(
//                                       mealList[index].name ?? '',
//                                       style: TextStyle(fontSize: 50),
//                                     ),
//                                   ],
//                                 );
//                               },
//                             ),
//                           ),
//                   ],
//                 );
//               }))),
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:resturant/ui/shared/colors.dart';
import 'package:resturant/ui/shared/custom_widgets/custom_button_new.dart';
import 'package:resturant/ui/shared/utlis.dart';
import 'package:resturant/ui/shared/utlis.dart';
import 'package:resturant/ui/views/main_view/home_view/home_controller.dart';
import 'package:resturant/ui/views/meal_details_view/meal_datialsnew_view.dart';

class HomeView extends StatefulWidget {
  final Function onPressed;
  HomeView({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.put(HomeController());
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: Container(
            color: AppColors.redcolor,
          ),
          body: Column(
            children: [
              Stack(
                children: [
                  Icon(
                    Icons.notifications_active,
                    color: AppColors.mainorangecolor,
                    size: 50,
                  ),
                  Obx(() {
                    return CircleAvatar(
                      child: Text(controller.counterListen.value.toString()),
                      backgroundColor: AppColors.redcolor,
                      minRadius: 5,
                      maxRadius: 10,
                    );
                  })
                ],
              ),
              Icon(
                isOnline ? Icons.wifi : Icons.wifi_off,
                color: isOnline ? Colors.green : Colors.red,
                size: screenWidth(10),
              ),
              Obx(() {
                return controller.isCategoryLoading
                    ? SpinKitCircle(
                        color: AppColors.mainorangecolor,
                      )
                    : Expanded(
                        child: controller.categoryList.isEmpty
                            ? Text('no category')
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: controller.categoryList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl:
                                            'http://via.placeholder.com/350x150',
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                      Text(
                                        controller.categoryList[index].name ??
                                            '',
                                        style: TextStyle(fontSize: 50),
                                      ),
                                    ],
                                  );
                                },
                              ),
                      );
              }),
              Obx(() {
                return controller.isMealLoading
                    ? SpinKitCircle(
                        color: AppColors.mainorangecolor,
                      )
                    : Expanded(
                        child: controller.mealList.isEmpty
                            ? Text('no meal')
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: controller.mealList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                      onTap: () {
                                        Get.to(MealDatailsNewView(
                                            model: controller.mealList[index]));
                                      },
                                      child: Column(children: [
                                        InkWell(
                                          onTap: () async {
                                            await Get.to(MealDatailsNewView(
                                                model: controller
                                                    .mealList[index]));
                                          },
                                          child: CachedNetworkImage(
                                            imageUrl: controller
                                                .mealList[index].images![0],
                                            placeholder: (context, url) =>
                                                CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          ),
                                        ),
                                        // Text(
                                        //   controller.mealList[index].name ?? '',
                                        //   style: TextStyle(fontSize: 50),
                                        // ),
                                        Row(
                                          children: [
                                            Text(
                                              controller.mealList[index].name ??
                                                  '',
                                              style: TextStyle(fontSize: 50),
                                            ),
                                            CustomButtonNew(
                                              text: '+',
                                              textsize: screenWidth(10),
                                              onpressed: () {
                                                controller.addToCart(
                                                    controller.mealList[index]);
                                              },
                                            ),
                                            Obx(() {
                                              print(controller
                                                  .categoryList.length);
                                              return CustomButtonNew(
                                                text:
                                                    '${cartService.cartCount}',
                                                textsize: screenWidth(10),
                                                onpressed: () {},
                                              );
                                            })
                                          ],
                                        ),
                                      ]));
                                },
                              ),
                      );
              })
            ],
          )
          // FutureBuilder<List<dynamic>>(
          //     future: Future.wait([
          //       CategoryRepository().getAll(),
          //       MealRepository().getAll(),
          //     ]),
          //     builder: ((context, AsyncSnapshot<List<dynamic>> snapshot1) {
          //       var categories = snapshot1.data != null
          //           ? snapshot1.data![0]
          //               as dartz.Either<String, List<CategoryModel>>
          //           : null;
          //       var meals = snapshot1.data != null
          //           ? snapshot1.data![1]
          //               as dartz.Either<String, List<MealModel>>
          //           : null;

          //       if (snapshot1.connectionState != ConnectionState.waiting) {
          //         categories!.fold((l) {
          //           CustomToast.showMeassge(
          //               message: l, messageType: MessageType.REJECTED);
          //         }, (r) {
          //           categoryList.clear();
          //           categoryList.addAll(r);
          //         });
//         meals!.fold((l) {
          //           CustomToast.showMeassge(
          //               message: l, messageType: MessageType.REJECTED);
          //         }, (r) {
          //           mealList.clear();
          //           mealList.addAll(r);
          //         });
          //       }

          //       return Column(
          //         children: [
          //           categories == null
          //               ? SpinKitCircle(
          //                   color: AppColors.mainOrangeColor,
          //                 )
          //               : Expanded(
          //                   child: ListView.builder(
          //                     scrollDirection: Axis.horizontal,
          //                     shrinkWrap: true,
          //                     itemCount: categoryList.length,
          //                     itemBuilder: (BuildContext context, int index) {
          //                       return Column(
          //                         children: [
          //                           CachedNetworkImage(
          //                             imageUrl:
          //                                 'http://via.placeholder.com/350x150',
          //                             placeholder: (context, url) =>
          //                                 CircularProgressIndicator(),
          //                             errorWidget: (context, url, error) =>
          //                                 Icon(Icons.error),
          //                           ),
          //                           Text(
          //                             categoryList[index].name ?? '',
          //                             style: TextStyle(fontSize: 50),
          //                           ),
          //                         ],
          //                       );
          //                     },
          //                   ),
          //                 ),
          //           meals == null
          //               ? SpinKitCircle(
          //                   color: AppColors.mainOrangeColor,
          //                 )
          //               : Expanded(
          //                   child: ListView.builder(
          //                     scrollDirection: Axis.vertical,
          //                     shrinkWrap: true,
          //                     itemCount: mealList.length,
          //                     itemBuilder: (BuildContext context, int index) {
          //                       return Column(
          //                         children: [
          //                           CachedNetworkImage(
          //                             imageUrl:
          //                                 'http://via.placeholder.com/350x150',
          //                             placeholder: (context, url) =>
          //                                 CircularProgressIndicator(),
          //                             errorWidget: (context, url, error) =>
          //                                 Icon(Icons.error),
          //                           ),
          //                           Text(
          //                             mealList[index].name ?? '',
          //                             style: TextStyle(fontSize: 50),
          //                           ),
          //                         ],
          //                       );
          //                     },
          //                   ),
          //                 ),
          //         ],
          //       );
          //     }))
          ),
    );
  }
}
