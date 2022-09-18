import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/pontuacoes_content.dart';

class MobilePontuacoes extends StatefulWidget {
  const MobilePontuacoes({Key? key}) : super(key: key);

  
  
  @override
  State<MobilePontuacoes> createState() {
    return _StateMobilePontuacoes();
  }
}
class _StateMobilePontuacoes extends State<MobilePontuacoes>{
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child:Container(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                Row(children: [
                  SizedBox(width: 5),
                  TitlePontuacoes(),
                ],),
                
                Pontuacoes(valor:0.9),
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
