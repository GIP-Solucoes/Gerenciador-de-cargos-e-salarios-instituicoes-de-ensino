import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/professores_content.dart';

class MobileProfessores extends StatefulWidget {
  const MobileProfessores({Key? key}) : super(key: key);

  
  
  @override
  State<MobileProfessores> createState() {
    return _StateMobileProfessores();
  }
}
class _StateMobileProfessores extends State<MobileProfessores>{
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child:Column(
        children: [
          
          Container(
            child: Padding(
            padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: [
                    Row(children: [
                      SizedBox(width: 5),
                      TitleProfessores(tamanho:mediaQuery.width*0.86),
                    ],),
                    
                    Professores(valor:0.877),
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
          ),
        ],
      )
      
    );
  }
}