import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/suaspontuacoes_content.dart';

class TabletSuaspontuacoes extends StatefulWidget {
  const TabletSuaspontuacoes({Key? key}) : super(key: key);

  @override
  State<TabletSuaspontuacoes> createState() {
    // TODO: implement createState
    return _StateTabletSuaspontuacoes();
  }
}

class _StateTabletSuaspontuacoes extends State<TabletSuaspontuacoes> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
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
                TitleSuaspontuacoes(tamanho: mediaQuery.width * 0.85),
              ],
            ),
            /*Suaspontuacoes(
              valor: 0.9,
              cargo: null,
              pontuacoes: const [],
              quantidade_anos: null,
              quantidade_meses: null,
              titulo_cargo: null,
              usuario: null,
              valor_cargo: null,
            ),*/
            SizedBox(
              height: 17,
            ),
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                BotaoVoltar(),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
