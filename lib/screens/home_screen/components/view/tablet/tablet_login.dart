import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/login_content.dart';

class TabletLogin extends StatelessWidget {
  const TabletLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Center(
      child:SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 20.0, horizontal: mediaQuery.width * 0.07),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Login(tamanho: 1,),
          ],
        ),
        
      ),
      )
      
    );
  }
}