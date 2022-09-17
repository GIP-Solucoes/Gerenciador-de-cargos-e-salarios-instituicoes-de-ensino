import 'package:flutter/material.dart';
import 'package:gip_solucoes/components/app_bar/components/navbar_item_menu.dart';
import 'package:gip_solucoes/components/app_bar/components/navbar_items_sistema.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/hero_content.dart';

import '../../../constants.dart';
import '../../components.dart';

class AppDrawerSistema extends StatelessWidget {
  const AppDrawerSistema({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kBackgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        // height: double.infinity,
        // width: double.infinity,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: double.infinity),
              const SizedBox(height: 30.0),
              const NavbarItemMenu(),
              const SizedBox(height: 30.0),

              // const Divider(thickness: 2.0),
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    height: 40.0,
                    child: NavbarItemSistema(index: index, title: navbarItemsSistema[index]),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(thickness: 1.0);
                },
                itemCount: navbarItemsSistema.length,
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
