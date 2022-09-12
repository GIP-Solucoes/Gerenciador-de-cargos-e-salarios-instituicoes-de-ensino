import 'package:flutter/material.dart';
import 'package:gip_solucoes/components/components.dart';
import 'package:gip_solucoes/constants.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/hero_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StateHomeScreen();
  }
}

class _StateHomeScreen extends State<HomeScreen> {
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
              const CustomNavbar(),
              Expanded(child: HeroContent()),
            ],
          ),
        ),
      ),
    );
  }
}
