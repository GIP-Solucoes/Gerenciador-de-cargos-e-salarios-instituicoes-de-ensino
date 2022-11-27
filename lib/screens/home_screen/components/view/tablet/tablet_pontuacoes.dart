import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/pontuacoes_content.dart';

class TabletPontuacoes extends StatefulWidget {
  const TabletPontuacoes({Key? key}) : super(key: key);

  
  
  @override
  State<TabletPontuacoes> createState() {
    return _StateTabletPontuacoes();
  }
}
class _StateTabletPontuacoes extends State<TabletPontuacoes>{
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
                
                Pontuacoes(valor:0.9, cargos: [], pontuacoes: [], pontuacoesAssiduidade: [], pontuacoesExperiencia: [], pontuacoesFormacao: [], pontuacoesTempoCasa: [], pontuacoesTitulo: [], pontuacoesExperienciaQtde: [], pontuacoesFormacaoQtde: [],),
                SizedBox(
                  height: 17,
                ),
                Row(children: [
                  SizedBox(width: 5,),
                  BotaoVoltar(),
                  SizedBox(width: 5,),
                  BotaoSalvar(instituicao: '', textEditingAssiduidade: [], textEditingExperiencia: [], textEditingFormacao: [], textEditingTempoCasa: [], textEditingTitulo: [], textEditingExperienciaQtde: [], textEditingFormacaoQtde: [],),
                ],)
                
          ],
        ),
        
      ),
      )
      
    );
  }
}
