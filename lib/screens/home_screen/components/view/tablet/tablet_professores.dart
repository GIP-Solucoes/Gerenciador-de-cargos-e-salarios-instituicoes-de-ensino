import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/professores_content.dart';

class TabletProfessores extends StatefulWidget {
  const TabletProfessores({Key? key}) : super(key: key);

  
  
  @override
  State<TabletProfessores> createState() {
    return _StateTabletProfessores();
  }
}
class _StateTabletProfessores extends State<TabletProfessores>{
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
                    
                    Professores(valor:0.877, usuarios: [], textEditingAprovacaoConcursoPublico: [], textEditingAssiduidade: [], textEditingCreditosPosGraduacao: [], textEditingCursosAperfeicoamento: [], textEditingCursosExtensaoCultural: [], textEditingData: [], textEditingLivros: [], textEditingMatriculas: [], textEditingNomes: [], textEditingObservacoes: [], textEditingOutrosCursos: [], textEditingPesquisasRealizadas: [], textEditingProfessorUniversidadePublica: [], textEditingTrabalhosCientificosPublicados: [], textEditingVariaveis: [], cargos: [], cargos_usuarios: [], situacoes: [], situacoes_usuarios: [], cargos_antigo: [], keysAltura: [], keysAlturaX: [], sizeAlturas: [], instituicao: '',),
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