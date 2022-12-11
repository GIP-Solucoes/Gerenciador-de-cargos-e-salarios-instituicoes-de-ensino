import 'package:flutter/material.dart';
import 'package:gip_solucoes/components/components.dart';
import 'package:gip_solucoes/constants.dart';
import 'package:gip_solucoes/screens/home_screen/components/controller/hero_content.dart';
//gerenciador da página inicial
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StateHomeScreen();
  }
}

class _StateHomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: kBackgroundColor,
        child: SafeArea(
          child: Column(
            children: [
              const CustomNavbar(),
              Expanded(child: HeroContent()),
            ],
          ),
        ),
      ),
    );
  }
}
