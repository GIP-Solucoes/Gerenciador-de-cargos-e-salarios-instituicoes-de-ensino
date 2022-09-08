import 'package:flutter/material.dart';
import 'package:starbucks_landing_page/components/app_bar/custom_navbar_sistema.dart';
import 'package:starbucks_landing_page/components/components.dart';
import 'package:starbucks_landing_page/constants.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/content/hero_content.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/content/sistema_content.dart';

class SistemaScreen extends StatefulWidget {
  const SistemaScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StateSistemaScreen();
  }
}

class _StateSistemaScreen extends State<SistemaScreen> {
  @override
  Widget build(BuildContext context) {
    // final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const AppDrawer(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: kBackgroundColor,
        child: SafeArea(
          child: Column(
            children: [
              const CustomNavbarSistema(),
              Expanded(child: SistemaContent()),
            ],
          ),
        ),
      ),
    );
  }
}
