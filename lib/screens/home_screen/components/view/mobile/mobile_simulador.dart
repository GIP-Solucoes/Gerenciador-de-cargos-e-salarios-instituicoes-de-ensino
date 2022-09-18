import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/simulador_content.dart';

class MobileSimulador extends StatefulWidget {
  const MobileSimulador({Key? key}) : super(key: key);

  
  
  @override
  State<MobileSimulador> createState() {
    return _StateMobileSimulador();
  }
}
class _StateMobileSimulador extends State<MobileSimulador>{
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child:Column(
        children:[
          Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                Row(children: [
                  SizedBox(width: 5),
                  TitleSimulador(),
                ],),
                
                Simulador(valor:0.9),
                SizedBox(
                  height: 17,
                ),
                
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                  Resultado(tamanho: 0.5,),
                    SizedBox(height: 5,),

                      BotaoCalcular(),
                      SizedBox(height: 5,),
                      BotaoVoltar(),

                ],),
          ],
          
        ),
        
      ),
      
        ] 
      )
      
    );
  }
}