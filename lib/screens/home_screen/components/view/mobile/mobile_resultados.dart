import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Cargo.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/SituacaoAdmissional.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Usuario.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/resultado_content.dart';

class MobileResultados extends StatefulWidget {
  List<Usuario> usuarios;
  double total_atual;
  double total_ideal;
  List<Cargo> cargos;
  List<SituacaoAdmissional> situacoes;
  List<Cargo> cargos_usuarios_final=[];
  List<SituacaoAdmissional> situacoes_usuarios_final = [];
  MobileResultados({Key? key,
      required this.usuarios,
      required this.total_atual,
      required this.total_ideal,
      required this.cargos,
      required this.situacoes}) : super(key: key);

  
  
  @override
  State<MobileResultados> createState() {
    return _StateMobileResultados();
  }
}
class _StateMobileResultados extends State<MobileResultados>{
  @override
  Widget build(BuildContext context) {
    widget.usuarios.forEach((element) {
      widget.cargos.forEach((elementt) {
        if (element.id_usuario == elementt.usuario_id) {
          setState(() {
            widget.cargos_usuarios_final.add(elementt);
          });
        }
      });
      widget.situacoes.forEach((elementt) {
        if (element.id_usuario == elementt.id_usuario) {
          setState(() {
            widget.situacoes_usuarios_final.add(elementt);
          });
        }
      });
    });
    final mediaQuery = MediaQuery.of(context).size;
    return Center(
      child:SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Row(children: [
                  SizedBox(width: 5),
                  TitleResultado(),
                ],),
                
                Resultados(valor:0.877,
                usuarios: this.widget.usuarios,
                total_atual: this.widget.total_atual,
                total_ideal: this.widget.total_ideal,
                situacoes: this.widget.situacoes_usuarios_final,
                cargos: this.widget.cargos_usuarios_final),
                SizedBox(
                  height: 20,
                ),
                Row(children: [
                  SizedBox(width: 5,),
                  BotaoVoltar(),
                ],)
                
          ],
        ),
        
      ),
      )
      
    );
  }
}