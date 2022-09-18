import 'package:flutter/material.dart';

import 'package:gip_solucoes/screens/home_screen/components/view/content/aempresa_content.dart';

class TabletAempresa extends StatelessWidget {
  const TabletAempresa({Key? key}) : super(key: key);

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
            Row(children: [
              TitleEmpresa(),
              SizedBox(width: 20,),
              Logo(tamanhologo: 2,),
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