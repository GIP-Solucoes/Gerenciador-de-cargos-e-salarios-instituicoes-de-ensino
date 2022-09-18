import 'package:flutter/material.dart';
import '../components.dart';
//escolhedor de layout (em cima ou do lado) (inicio)
class CustomNavbar extends StatelessWidget {
  const CustomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth >= 750) {
          return const DesktopNavbar();
        }
        return const MobileNavbar();
      }),
    );
  }
}
