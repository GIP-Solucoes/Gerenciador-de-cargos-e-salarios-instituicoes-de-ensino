import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/cargos_content.dart';

class TabletCargos extends StatelessWidget {
  const TabletCargos({Key? key}) : super(key: key);

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
                  TitleCargos(tamanho:mediaQuery.width*0.86),
                ],),
                
                Cargos(valor:0.877, editingControllerCompetencias: [], editingControllerDescricoes: [], editingControllerNomes: [], editingControllerTempoMinimo: [], editingControllerTempoExperiencia: [], editingControllerTitulos: [],),
                SizedBox(
                  height: 20,
                ),
                Row(children: [
                  SizedBox(width: 5,),
                  BotaoVoltar(),
                  SizedBox(width: 5,),
                  BotaoSalvar(casass: [], competenciass: [], descricoess: [], instituicao: '', experienciass: [], nomess: [], tituloss: [],),
                ],)
                
          ],
        ),
        
      ),
      )
      
    );
  }
}