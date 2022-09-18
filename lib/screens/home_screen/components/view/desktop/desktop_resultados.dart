import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/resultado_content.dart';

class DesktopResultados extends StatefulWidget {
  const DesktopResultados({Key? key}) : super(key: key);

  
  
  @override
  State<DesktopResultados> createState() {
    return _StateDesktopResultados();
  }
}
class _StateDesktopResultados extends State<DesktopResultados>{
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Center(
      child:SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.175),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Row(children: [
                  SizedBox(width: 5),
                  TitleResultado(),
                ],),
                
                Resultados(valor:0.63),
                SizedBox(
                  height: 20,
                ),
                Row(children: [
                  SizedBox(width: 5,),
                  BotaoVoltar(),
                ],)
                
          ],
        ),
        
      ),
      )
      
    );
  }
}