import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Cargo.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/tabela_content.dart';

class TabletTabela extends StatefulWidget {
  List<Cargo> cargos;
  double quantidade = 0;
  bool verifica_geral = false;
  String instituicao;
  List<Cargo> display_list_cargos;
  List<TextEditingController> textEditingCargos = [];
  List<List<TextEditingController>> textEditingIntervalos = [];
  List<List<TextEditingController>> textEditingValores = [];
  TabletTabela({Key? key, required this.cargos, required this.instituicao,required this.display_list_cargos})
      : super(key: key);

  @override
  State<TabletTabela> createState() => _TabletTabelaState();
}

class _TabletTabelaState extends State<TabletTabela> {
  @override
  Widget build(BuildContext context) {
    bool verificador = false;
    verificadoresIntervalo = [];
    verificadoresValor = [];
    widget.cargos.forEach((element) {
      verificadoresCargo.add(false);
      widget.textEditingCargos.add(TextEditingController(text: element.nome));
      List<TextEditingController> listaIntervalos = [];
      List<TextEditingController> listaValores = [];
      List<bool> listaBoolIntervalos = [];
      List<bool> listaBoolValores = [];
      element.faixas.forEach((elementt) {
        if (widget.verifica_geral == false) if (verificador == false)
          widget.quantidade++;
        listaBoolIntervalos.add(false);
        listaBoolValores.add(false);
        listaIntervalos.add(
            TextEditingController(text: elementt.final_intervalo.toString()));
        listaValores.add(TextEditingController(
            text: elementt.valor.toString().replaceAll('.', ',')));
      });
      verificador = true;

      verificadoresIntervalo.add(listaBoolIntervalos);
      verificadoresValor.add(listaBoolValores);
      widget.textEditingIntervalos.add(listaIntervalos);
      widget.textEditingValores.add(listaValores);
    });
    widget.verifica_geral = true;
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 5),
                TitleTabela(),
              ],
            ),
            Tabela(
              valor: 0.877,
              key: keyTabela,
              quantidadeFaixas: widget.quantidade,
              textEditingCargos: widget.textEditingCargos,
              textEditingIntervalos: widget.textEditingIntervalos,
              textEditingValores: widget.textEditingValores,
            ),
            SizedBox(
              height: 20,
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
                    display_list_cargos: widget.display_list_cargos),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
