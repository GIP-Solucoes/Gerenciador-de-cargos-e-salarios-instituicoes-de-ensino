import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/suaspontuacoes_content.dart';

class DesktopSuaspontuacoes extends StatefulWidget {
  const DesktopSuaspontuacoes({Key? key}) : super(key: key);

  
  
  @override
  State<DesktopSuaspontuacoes> createState() {
    return _StateDesktopProfessores();
  }
}
class _StateDesktopProfessores extends State<DesktopSuaspontuacoes>{
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
                  TitleSuaspontuacoes(tamanho:mediaQuery.width*0.5),
                ],),
                
                Suaspontuacoes(valor:0.65),
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
