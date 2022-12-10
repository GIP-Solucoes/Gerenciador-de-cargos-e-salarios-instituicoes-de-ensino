import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Cargo.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Pontuacao.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/simulador_content.dart';

class TabletSimulador extends StatefulWidget {
  String instituicao;
  String valorr = "?";
  String faixaSalariall = "??,??";
  List<TextEditingController> textEditingAssiduidade = [
    TextEditingController(text: '0')
  ];
  TextEditingController resultado = TextEditingController(text: '??,??');
  TextEditingController resultadoFaixaSalarial =
      TextEditingController(text: '?');
  List<TextEditingController> textEditingExperiencia = [
    TextEditingController(text: '0'),
    TextEditingController(text: '0'),
    TextEditingController(text: '0'),
    TextEditingController(text: '0')
  ];
  List<TextEditingController> textEditingFormacao = [
    TextEditingController(text: '0'),
    TextEditingController(text: '0'),
    TextEditingController(text: '0'),
    TextEditingController(text: '0'),
    TextEditingController(text: '0'),
    TextEditingController(text: '0')
  ];
  List<Cargo> cargos;
  List<Pontuacao> pontuacoes;
  TabletSimulador({Key? key,
    required this.cargos,
    required this.pontuacoes,
    required this.instituicao}) : super(key: key);

  
  
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
                
                Simulador(valor:0.9, key: keySimulador,
              cargos: widget.cargos,
              pontuacoes: widget.pontuacoes,
              textEditingAssiduidade: widget.textEditingAssiduidade,
              textEditingExperiencia: widget.textEditingExperiencia,
              textEditingFormacao: widget.textEditingFormacao,
              resultado: widget.resultado,
              resultadoFaixaSalarial: widget.resultadoFaixaSalarial,),
                SizedBox(
                  height: 17,
                ),
                
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                  Resultado(tamanho: 1, key: keyFaixa,
            faixaSalariall: widget.faixaSalariall,
            valorr: widget.faixaSalariall,
            resultado: widget.resultado,
            resultadoFaixaSalarial: widget.resultadoFaixaSalarial,),
                    SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BotaoCalcular(cargos: widget.cargos,
            pontuacoes: widget.pontuacoes,
            faixaSalariall: widget.faixaSalariall,
            valorr: widget.valorr,
            resultado: widget.resultado,
            resultadoFaixaSalarial: widget.resultadoFaixaSalarial, instituicao: widget.instituicao, textEditingControllerAssiduidade: widget.textEditingAssiduidade, textEditingControllerExperiencia: widget.textEditingExperiencia, textEditingControllerFormacao: widget.textEditingFormacao,),
                      
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
