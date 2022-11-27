import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Cargo.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/cargos_content.dart';

class DesktopCargos extends StatefulWidget {
  List<Cargo> cargos;
  bool verificar = false;
  String instituicao;
  List<TextEditingController> editingControllerNomes = [];

  List<TextEditingController> editingControllerTitulos = [];

  List<TextEditingController> editingControllerTempoExperiencia = [];

  List<TextEditingController> editingControllerTempoMinimo = [];

  List<TextEditingController> editingControllerDescricoes = [];

  List<TextEditingController> editingControllerCompetencias = [];
  DesktopCargos({Key? key, required this.cargos,required this.instituicao}) : super(key: key);

  @override
  State<DesktopCargos> createState() => _DesktopCargosState();
}

class _DesktopCargosState extends State<DesktopCargos> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    widget.cargos.forEach((element) {
      if (widget.verificar == false) {
        nomes.add(false);
        titulos.add(false);
        experiencias.add(false);
        casas.add(false);
        descricoes.add(false);
        competencias.add(false);
      }

      widget.editingControllerNomes
          .add(TextEditingController(text: element.nome));
      widget.editingControllerTitulos
          .add(TextEditingController(text: element.titulo));
      widget.editingControllerTempoExperiencia.add(
          TextEditingController(text: element.tempo_experiencia.toString()));
      widget.editingControllerTempoMinimo
          .add(TextEditingController(text: element.tempo_empresa.toString()));
      widget.editingControllerDescricoes
          .add(TextEditingController(text: element.descricao));
      widget.editingControllerCompetencias
          .add(TextEditingController(text: element.competencias));
    });
    widget.verificar = true;
    return Center(
        child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.175),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 5),
                TitleCargos(tamanho: mediaQuery.width * 0.5),
              ],
            ),
            Cargos(
              valor: 0.63,
              editingControllerCompetencias:
                  widget.editingControllerCompetencias,
              editingControllerDescricoes: widget.editingControllerDescricoes,
              editingControllerNomes: widget.editingControllerNomes,
              editingControllerTempoMinimo: widget.editingControllerTempoMinimo,
              editingControllerTempoExperiencia:
                  widget.editingControllerTempoExperiencia,
              editingControllerTitulos: widget.editingControllerTitulos,
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
                BotaoSalvar(casass: widget.editingControllerTempoMinimo, competenciass: widget.editingControllerCompetencias, descricoess: widget.editingControllerDescricoes, experienciass: widget.editingControllerTempoExperiencia, instituicao: widget.instituicao, nomess: widget.editingControllerNomes, tituloss: widget.editingControllerTitulos,),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
