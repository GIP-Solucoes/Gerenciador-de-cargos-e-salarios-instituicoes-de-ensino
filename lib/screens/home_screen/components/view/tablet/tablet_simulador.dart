import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/simulador_content.dart';

class TabletSimulador extends StatefulWidget {
  const TabletSimulador({Key? key}) : super(key: key);

  
  
  @override
  State<TabletSimulador> createState() {
    return _StateTabletSimulador();
  }
}
class _StateTabletSimulador extends State<TabletSimulador>{
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
                
                Simulador(valor:0.9, cargos: [], pontuacoes: [], textEditingAssiduidade: [], textEditingExperiencia: [], textEditingFormacao: [], resultado: TextEditingController(), resultadoFaixaSalarial: TextEditingController(),),
                SizedBox(
                  height: 17,
                ),
                
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                  Resultado(tamanho: 1, faixaSalariall: '', valorr: '', resultado: TextEditingController(), resultadoFaixaSalarial: TextEditingController(),),
                    SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BotaoCalcular(cargos: [], pontuacoes: [], faixaSalariall: '', valorr: '', resultado: TextEditingController(), resultadoFaixaSalarial: TextEditingController(), instituicao: '', textEditingControllerAssiduidade: [], textEditingControllerExperiencia: [], textEditingControllerFormacao: [],),
                      
                      BotaoVoltar(),
                    ],
                  ),
                ],),
          ],
          
        ),
        
      ),
      
        ] 
      )
      
    );
  }
}
