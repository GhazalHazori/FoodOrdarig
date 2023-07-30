import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant/core/enums/bottom_navigation_enum.dart';
import 'package:resturant/ui/shared/colors.dart';
import 'package:resturant/ui/shared/custom_widgets/custom_drawer.dart';
import 'package:resturant/ui/views/main_view/main_view_controller.dart';
import 'package:resturant/ui/views/main_view/main_view_widgets/bottom_navigation_widget.dart';
import 'package:resturant/ui/views/main_view/menu_view/menu_view.dart';
import 'package:resturant/ui/views/main_view/more_view/more_view.dart';
import 'package:resturant/ui/views/main_view/offers_view/offers_view.dart';
import 'package:resturant/ui/views/main_view/profile_view/profile_view.dart';

import 'home_view/home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  PageController controller = PageController(initialPage: 2);
  BottomNavigationEnum selected = BottomNavigationEnum.HOME;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  //maincontroller controller = Get.put(maincontroller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: key,
      drawer: CustomDrawer(),
      bottomNavigationBar: BottomNavigationWidget(
        navitm: selected,
        ontap: (select, pagenumber) {
          controller.jumpToPage(pagenumber);

          selected = select;
        },
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          MenuView(),
          OffersView(),
          HomeView(onPressed: () {
            key.currentState!.openDrawer();
          }),
          ProfileView(),
          MoreView()
        ],
      ),
    ));
  }
}
