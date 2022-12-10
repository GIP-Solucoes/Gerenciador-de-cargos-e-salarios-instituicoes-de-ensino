import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/SituacaoAdmissional.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/status_content.dart';
class MobileStatus extends StatefulWidget {
  List<SituacaoAdmissional> situacoesAdmissional;
  List<TextEditingController> nomes = [];
  String instituicao;
  List<bool> tipos = [];
  MobileStatus({Key? key, required this.situacoesAdmissional, required this.instituicao}) : super(key: key);

  @override
  State<MobileStatus> createState() => _MobileStatusState();
}

class _MobileStatusState extends State<MobileStatus> {
  @override
  Widget build(BuildContext context) {
    verificadoresNome = [];
    vertificadoresTipo = [];
    widget.situacoesAdmissional.forEach((element) {
      verificadoresNome.add(false);
      vertificadoresTipo.add(false);
      widget.nomes.add(TextEditingController(text: element.nome));
      widget.tipos.add(element.calcula_valor);
    });
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child:Center(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Row(children: [
                  SizedBox(width: 5),
                  TitleStatus(),
                ],),
                
                Status(valor:(mediaQuery.width * 0.75),key: keyStatus,
              instituicao: widget.instituicao,
              textEditingNomes: widget.nomes,
              textEditingTipos: widget.tipos,),
                SizedBox(
                  height: 20,
                ),
                Row(children: [
                  SizedBox(width: 5,),
                  BotaoVoltar(),
                  SizedBox(width: 5,),
                ],)
                
          ],
        ),
        
      ),
      )
      
    );
  }
}