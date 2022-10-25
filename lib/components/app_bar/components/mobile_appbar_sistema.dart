import 'package:flutter/material.dart';
import 'package:gip_solucoes/components/app_bar/components/header_sistema.dart';

//layout parte de cima mobile (sistema)
class MobileNavbarSistema extends StatelessWidget {
  String email;
  MobileNavbarSistema({Key? key,required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      height: 70.0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const HeaderSistema(),
          Positioned(
            left: 5.0,
            child: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ],
      ),
    );
  }
}
