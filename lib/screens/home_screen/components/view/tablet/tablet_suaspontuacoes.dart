import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Cargo.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Pontuacao.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Usuario.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/suaspontuacoes_content.dart';

class TabletSuaspontuacoes extends StatefulWidget {
  Cargo cargo;
  double valor_cargo;
  String titulo_cargo;
  Usuario usuario;
  double quantidade_anos;
  double quantidade_meses;
  double soma;
  List<Pontuacao> pontuacoes;
  TabletSuaspontuacoes({Key? key,
      required this.cargo,
      required this.valor_cargo,
      required this.titulo_cargo,
      required this.usuario,
      required this.quantidade_anos,
      required this.quantidade_meses,
      required this.pontuacoes,
      required this.soma}) : super(key: key);

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
            Suaspontuacoes(
              valor: 0.9,
                cargo: this.widget.cargo,
                pontuacoes: this.widget.pontuacoes,
                quantidade_anos: this.widget.quantidade_anos,
                quantidade_meses: this.widget.quantidade_meses,
                titulo_cargo: this.widget.titulo_cargo,
                usuario: this.widget.usuario,
                valor_cargo: this.widget.valor_cargo,
                soma: this.widget.soma
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
              ],
            )
          ],
        ),
      ),
    ));
  }
}
