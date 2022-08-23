import 'package:flutter/material.dart';
import 'package:starbucks_landing_page/components/app_bar/components/desktop_navbar_menu.dart';
import 'package:starbucks_landing_page/constants.dart';
import '../components.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth >= 750) {
          return const DesktopNavbarMenu();
        }
        //else if (constraints.maxWidth >= kTabletWidth) {
        //   return const Des();
        // }
        return const MobileNavbar();
      }),
    );
  }
}
