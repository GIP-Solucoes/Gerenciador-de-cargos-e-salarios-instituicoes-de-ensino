import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Cargo.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Pontuacao.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/pontuacoes_content.dart';

class TabletPontuacoes extends StatefulWidget {
  List<TextEditingController> pontuacoesTitulo = [];

  List<TextEditingController> pontuacoesFormacao = [];
  List<TextEditingController> pontuacoesExperiencia = [];
  List<TextEditingController> pontuacoesFormacaoQtde = [];
  List<TextEditingController> pontuacoesExperienciaQtde = [];

  List<TextEditingController> pontuacoesAssiduidade = [];

  List<TextEditingController> pontuacoesTempoCasa = [];
  List<Cargo> cargos;
  List<Pontuacao> pontuacoes;
  String instituicao;
  List<Cargo> display_list_cargos;
  TabletPontuacoes(
      {Key? key,
      required this.cargos,
      required this.pontuacoes,
      required this.instituicao,required this.display_list_cargos})
      : super(key: key);

  @override
  State<TabletPontuacoes> createState() {
    return _StateTabletPontuacoes();
  }
}

class _StateTabletPontuacoes extends State<TabletPontuacoes> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    widget.cargos.forEach((element) {
      widget.pontuacoesTitulo.add(TextEditingController(
          text: element.valor_pontuacao.toString().replaceAll('.', ',')));
    });
    widget.pontuacoes.forEach(((element) {
      if (element.nome == "Assiduidade") {
        element.pontuacaoAtributo.forEach((elementt) {
          widget.pontuacoesAssiduidade.add(TextEditingController(
              text: elementt.quantidade_maxima.toString()));
          widget.pontuacoesAssiduidade.add(TextEditingController(
              text: elementt.valor.toString().replaceAll('.', ',')));
        });
      } else if (element.nome == "Experiência") {
        element.pontuacaoAtributo.forEach((elementt) {
          widget.pontuacoesExperiencia.add(TextEditingController(
              text: elementt.valor.toString().replaceAll('.', ',')));
          widget.pontuacoesExperienciaQtde.add(TextEditingController(
              text:
                  elementt.quantidade_maxima.toString().replaceAll('.', ',')));
        });
      } else if (element.nome == "Pontuação de Formação Acadêmica") {
        element.pontuacaoAtributo.forEach((elementt) {
          widget.pontuacoesFormacao.add(TextEditingController(
              text: elementt.valor.toString().replaceAll('.', ',')));
          widget.pontuacoesFormacaoQtde.add(TextEditingController(
              text:
                  elementt.quantidade_maxima.toString().replaceAll('.', ',')));
        });
      } else {
        element.pontuacaoAtributo.forEach((elementt) {
          for (int i = 1; i <= elementt.quantidade_maxima; i++) {
            widget.pontuacoesTempoCasa.add(
                TextEditingController(text: (elementt.valor * i).toString()));
          }
        });
      }
    }));
    return SingleChildScrollView(
        child: Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(width: 5),
                TitlePontuacoes(),
              ],
            ),
            Pontuacoes(
              valor: 0.9,
              cargos: widget.cargos,
              pontuacoes: widget.pontuacoes,
              pontuacoesAssiduidade: widget.pontuacoesAssiduidade,
              pontuacoesExperiencia: widget.pontuacoesExperiencia,
              pontuacoesFormacao: widget.pontuacoesFormacao,
              pontuacoesTempoCasa: widget.pontuacoesTempoCasa,
              pontuacoesTitulo: widget.pontuacoesTitulo,
              pontuacoesExperienciaQtde: widget.pontuacoesExperienciaQtde,
              pontuacoesFormacaoQtde: widget.pontuacoesFormacaoQtde,
            ),
            SizedBox(
              height: 17,
            ),
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                BotaoVoltar(),
                SizedBox(
                  width: 5,
                ),
                BotaoSalvar(
                  instituicao: widget.instituicao,
                  textEditingAssiduidade: widget.pontuacoesAssiduidade,
                  textEditingExperiencia: widget.pontuacoesExperiencia,
                  textEditingFormacao: widget.pontuacoesFormacao,
                  textEditingTempoCasa: widget.pontuacoesTempoCasa,
                  textEditingTitulo: widget.pontuacoesTitulo,
                  textEditingExperienciaQtde: widget.pontuacoesExperienciaQtde,
                  textEditingFormacaoQtde: widget.pontuacoesFormacaoQtde,
                  display_list_cargos: widget.display_list_cargos,
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
