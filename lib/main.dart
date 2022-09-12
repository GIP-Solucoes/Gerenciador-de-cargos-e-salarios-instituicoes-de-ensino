import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:gip_solucoes/screens/home_screen/sistema_screen.dart';

import './screens/screens.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StateMyApp();
  }
}

class _StateMyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink,
        fontFamily: 'Poppins',
      ),
      routes: {
        '/': (_) => const HomeScreen(),
        '/sistema':(_)=>const SistemaScreen(),
      },
    );
  }
}
