import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/SituacaoAdmissional.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/status_content.dart';

class DesktopStatus extends StatefulWidget {
  List<SituacaoAdmissional> situacoesAdmissional;
  List<TextEditingController> nomes = [];
  String instituicao;
  List<bool> tipos = [];
  DesktopStatus(
      {Key? key, required this.situacoesAdmissional, required this.instituicao})
      : super(key: key);

  @override
  State<DesktopStatus> createState() => _DesktopStatusState();
}

class _DesktopStatusState extends State<DesktopStatus> {
  @override
  Widget build(BuildContext context) {
    widget.situacoesAdmissional.forEach((element) {
      verificadoresNome.add(false);
      vertificadoresTipo.add(false);
      widget.nomes.add(TextEditingController(text: element.nome));
      widget.tipos.add(element.calcula_valor);
    });
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.175),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 5),
                TitleStatus(),
              ],
            ),
            Status(
              key: keyStatus,
              valor: 530,
              instituicao: widget.instituicao,
              textEditingNomes: widget.nomes,
              textEditingTipos: widget.tipos,
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
              ],
            )
          ],
        ),
      ),
    ));
  }
}
