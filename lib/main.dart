import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import './screens/screens.dart';
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
void main() {
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
class _StateMyApp extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink,
        fontFamily: 'Poppins',
      ),
      home: const HomeScreen(),
    );
  }
}