import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/suaspontuacoes_content.dart';

class MobileSuaspontuacoes extends StatefulWidget {
  const MobileSuaspontuacoes({Key? key}) : super(key: key);

  
  
  @override
  State<MobileSuaspontuacoes> createState() {
    return _StateMobileSuaspontuacoes();
  }
}
class _StateMobileSuaspontuacoes extends State<MobileSuaspontuacoes>{
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
                  TitleSuaspontuacoes(tamanho:mediaQuery.width * 0.85),
                ],),
                
                Suaspontuacoes(valor:0.9),
                SizedBox(
                  height: 17,
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