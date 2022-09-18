import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/pontuacoes_content.dart';

class DesktopPontuacoes extends StatefulWidget {
  const DesktopPontuacoes({Key? key}) : super(key: key);

  
  
  @override
  State<DesktopPontuacoes> createState() {
    return _StateDesktopProfessores();
  }
}
class _StateDesktopProfessores extends State<DesktopPontuacoes>{
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child:Container(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.175),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                Row(children: [
                  SizedBox(width: 5),
                  TitlePontuacoes(),
                ],),
                
                Pontuacoes(valor:0.65),
                SizedBox(
                  height: 17,
                ),
                Row(children: [
                  SizedBox(width: 5,),
                  BotaoVoltar(),
                  SizedBox(width: 5,),
                  BotaoSalvar(),
                ],)
                
          ],
        ),
        
      ),
      )
      
    );
  }
}
