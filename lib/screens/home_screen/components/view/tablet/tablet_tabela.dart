import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/tabela_content.dart';

class TabletTabela extends StatelessWidget {
  const TabletTabela({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child:Center(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Row(children: [
                  SizedBox(width: 5),
                  TitleTabela(),
                ],),
                
                Tabela(valor:0.877, quantidadeFaixas: 0, textEditingCargos: [], textEditingIntervalos: [], textEditingValores: [],),
                SizedBox(
                  height: 20,
                ),
                Row(children: [
                  SizedBox(width: 5,),
                  BotaoVoltar(),
                  SizedBox(width: 5,),
                  BotaoSalvar(instituicao: '',),
                ],)
                
          ],
        ),
        
      ),
      )
      
    );
  }
}