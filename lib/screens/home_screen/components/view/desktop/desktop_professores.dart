import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/professores_content.dart';

class DesktopProfessores extends StatefulWidget {
  const DesktopProfessores({Key? key}) : super(key: key);

  
  
  @override
  State<DesktopProfessores> createState() {
    return _StateDesktopProfessores();
  }
}
class _StateDesktopProfessores extends State<DesktopProfessores>{
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
                  TitleProfessores(tamanho:mediaQuery.width*0.5),
                ],),
                
                Professores(valor:0.63),
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