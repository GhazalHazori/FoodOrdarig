import 'package:resturant/core/enums/connectivity_status.dart';
import 'package:resturant/core/services/base_controller.dart';
import 'package:resturant/ui/shared/utlis.dart';

class MyAppContoller extends BaseControoler {
  ConnectivityStatus connectionStatus = ConnectivityStatus.ONLINE;
  @override
  void onInit() {
    listenToConnectionStatus();

    super.onInit();
  }

  void listenToConnectionStatus() {
    connectivityService.connectivityStatusController.stream.listen((event) {
      connectionStatus = event;
    });
  }
}
