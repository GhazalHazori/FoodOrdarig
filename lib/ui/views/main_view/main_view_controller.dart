import 'package:flutter/material.dart';

import 'package:resturant/core/enums/bottom_navigation_enum.dart';
import 'package:resturant/core/services/base_controller.dart';
import 'package:resturant/ui/views/main_view/main_view_widgets/bottom_navigation_widget.dart';

class maincontroller extends BaseControoler {
  PageController controller = PageController(initialPage: 2);
  BottomNavigationEnum selected = BottomNavigationEnum.HOME;

  BottomNavigationWidget getBottomNavigation() {
    BottomNavigationWidget bottomnav;
    bottomnav = BottomNavigationWidget(
      navitm: selected,
      ontap: (select, pagenumber) {
        controller.jumpToPage(pagenumber);

        selected = select;
      },
    );
    return bottomnav;
  }
}
