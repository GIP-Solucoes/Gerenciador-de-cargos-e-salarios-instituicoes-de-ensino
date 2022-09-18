import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/simulador_content.dart';

class DesktopSimulador extends StatefulWidget {
  const DesktopSimulador({Key? key}) : super(key: key);

  
  
  @override
  State<DesktopSimulador> createState() {
    return _StateDesktopSimulador();
  }
}
class _StateDesktopSimulador extends State<DesktopSimulador>{
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child:Column(
        children:[
          Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.175),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                Row(children: [
                  SizedBox(width: 5),
                  TitleSimulador(),
                ],),
                
                Simulador(valor:0.65),
                SizedBox(
                  height: 17,
                ),
                
                
          ],
          
        ),
        
      ),
      Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  BotaoCalcular(),
                  SizedBox(width: mediaQuery.width*0.0285,),
                  Resultado(tamanho: 1,),
                  SizedBox(width: mediaQuery.width*0.0285,),
                  BotaoVoltar(),
                ],)
        ] 
      )
      
    );
  }
}
