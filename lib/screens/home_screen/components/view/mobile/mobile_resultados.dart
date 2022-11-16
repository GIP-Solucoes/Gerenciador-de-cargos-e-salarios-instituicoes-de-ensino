import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/resultado_content.dart';

class MobileResultados extends StatefulWidget {
  const MobileResultados({Key? key}) : super(key: key);

  
  
  @override
  State<MobileResultados> createState() {
    return _StateMobileResultados();
  }
}
class _StateMobileResultados extends State<MobileResultados>{
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Center(
      child:SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Row(children: [
                  SizedBox(width: 5),
                  TitleResultado(),
                ],),
                
                Resultados(valor:0.877,usuarios: [], total_atual: 1, total_ideal: 1, cargos: [], situacoes: [],),
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