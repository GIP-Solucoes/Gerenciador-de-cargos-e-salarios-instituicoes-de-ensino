import 'package:flutter/material.dart';
import 'package:gip_solucoes/components/app_bar/components/desktop_navbar_menu.dart';
import 'package:gip_solucoes/constants.dart';
import '../components.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth >= 750) {
          return const DesktopNavbar();
        }
        //else if (constraints.maxWidth >= kTabletWidth) {
        //   return const Des();
        // }
        return const MobileNavbar();
      }),
    );
  }
}
