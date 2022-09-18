import 'package:flutter/material.dart';
import 'package:gip_solucoes/components/app_bar/components/desktop_navbar_menu.dart';
import 'package:gip_solucoes/components/app_bar/components/mobile_appbar_sistema.dart';
//escolhedor de layout (em cima ou do lado) (sistema)
class CustomNavbarSistema extends StatelessWidget {
  const CustomNavbarSistema({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth >= 750) {
          return const DesktopNavbarMenu();
        }
        return const MobileNavbarSistema();
      }),
    );
  }
}
