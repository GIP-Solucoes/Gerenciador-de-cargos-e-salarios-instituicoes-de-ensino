import 'package:flutter/material.dart';
import 'package:starbucks_landing_page/components/components.dart';
import 'package:starbucks_landing_page/constants.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/hero_content.dart';

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
