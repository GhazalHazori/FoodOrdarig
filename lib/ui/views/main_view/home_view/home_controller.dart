import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:resturant/core/data/models/apis/category_model.dart';
import 'package:resturant/core/data/models/apis/meal_model.dart';
import 'package:resturant/core/data/repositories/category_repository.dart';
import 'package:resturant/core/data/repositories/meal_repository.dart';
import 'package:resturant/core/enums/message_type.dart';
import 'package:resturant/core/enums/nitification_type.dart';
import 'package:resturant/core/enums/operation_type.dart';
import 'package:resturant/core/enums/request_status.dart';
import 'package:resturant/ui/shared/custom_widgets/custom_toast.dart';
import 'package:resturant/ui/shared/utlis.dart';

import '../../../../core/services/base_controller.dart';

class HomeController extends BaseControoler {
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxList<MealModel> mealList = <MealModel>[].obs;
  RxBool isConnected = false.obs;
  StreamSubscription<ConnectivityResult>? subscription;
  RxInt counterListen = 0.obs;

  bool get isCategoryLoading =>
      requestStatus.value == RequestStatus.LOADING &&
      operationType == OperationType.CATEGORY;

  bool get isMealLoading =>
      requestStatus.value == RequestStatus.LOADING &&
      operationType == OperationType.MEAL;
  // bool get isOnline =>
  // requestStatus.value == RequestStatus.DEFUALT &&
  // operationType == OperationType.NONE;
  RxInt cartCount = 0.obs;

  @override
  void onInit() async {
    notificationService.notifcationStream.stream.listen((event) {
      if (event.notifctionType == NotificationType.SUBSCRIPTION.name) {
        counterListen = counterListen + 1;
      }
    });
    getAllGategory();
    getAllMeal();
    checkInternet();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    checkInternet();
  }

  void getAllGategory() {
    runLoadingFutureFunction(
        type: OperationType.CATEGORY,
        function: CategoryRepository().getAll().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messagetype: MessagType.REJECTED);
          }, (r) {
            categoryList.addAll(r);
          });
        }));
  }

  void getAllMeal() {
    runLoadingFutureFunction(
        type: OperationType.MEAL,
        function: MealRepository().getAll().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messagetype: MessagType.REJECTED);
          }, (r) {
            mealList.addAll(r);
          });
        }));
  }

  void addToCart(MealModel model) {
    cartService.addToCart(
        model: model,
        count: 1,
        afterAdd: () {
          cartCount.value += 1;
          CustomToast.showMessage(
              message: 'Added', messagetype: MessagType.SUCCSESS);
        });
  }

  Future<void> checkInternet() async {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      isConnected.value = (result != ConnectivityResult.none);
    });
  }
}
