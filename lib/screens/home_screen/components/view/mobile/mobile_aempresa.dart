import 'package:flutter/material.dart';

import 'package:gip_solucoes/screens/home_screen/components/view/content/aempresa_content.dart';

class MobileAempresa extends StatelessWidget {
  const MobileAempresa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child:Center(
        child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 20.0, horizontal: mediaQuery.width * 0.07),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(children: [
              TitleEmpresa(),
              SizedBox(height: 20,),
              Logo(tamanhologo: 1.5,),
            ],),
            SizedBox(height: 30,),
            Paragrafo(),
          ],
        ),
        
      ),
      )
      
    );
  }
}