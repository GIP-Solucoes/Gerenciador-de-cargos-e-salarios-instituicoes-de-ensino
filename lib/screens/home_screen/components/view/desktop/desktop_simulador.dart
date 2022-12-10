import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Cargo.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Pontuacao.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/simulador_content.dart';

class DesktopSimulador extends StatefulWidget {
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
  DesktopSimulador({
    Key? key,
    required this.cargos,
    required this.pontuacoes,
    required this.instituicao
  }) : super(key: key);

  @override
  State<DesktopSimulador> createState() {
    return _StateDesktopSimulador();
  }
}

class _StateDesktopSimulador extends State<DesktopSimulador> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.175),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(width: 5),
                TitleSimulador(),
              ],
            ),
            Simulador(
              key: keySimulador,
              valor: 0.65,
              cargos: widget.cargos,
              pontuacoes: widget.pontuacoes,
              textEditingAssiduidade: widget.textEditingAssiduidade,
              textEditingExperiencia: widget.textEditingExperiencia,
              textEditingFormacao: widget.textEditingFormacao,
              resultado: widget.resultado,
              resultadoFaixaSalarial: widget.resultadoFaixaSalarial,
            ),
            SizedBox(
              height: 17,
            ),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BotaoCalcular(
            cargos: widget.cargos,
            pontuacoes: widget.pontuacoes,
            faixaSalariall: widget.faixaSalariall,
            valorr: widget.valorr,
            resultado: widget.resultado,
            resultadoFaixaSalarial: widget.resultadoFaixaSalarial, instituicao: widget.instituicao, textEditingControllerAssiduidade: widget.textEditingAssiduidade, textEditingControllerExperiencia: widget.textEditingExperiencia, textEditingControllerFormacao: widget.textEditingFormacao,
          ),
          SizedBox(
            width: mediaQuery.width * 0.0285,
          ),
          Resultado(
            key: keyFaixa,
            tamanho: 1,
            faixaSalariall: widget.faixaSalariall,
            valorr: widget.faixaSalariall,
            resultado: widget.resultado,
            resultadoFaixaSalarial: widget.resultadoFaixaSalarial,
          ),
          SizedBox(
            width: mediaQuery.width * 0.0285,
          ),
          BotaoVoltar(),
        ],
      )
    ]));
  }
}
