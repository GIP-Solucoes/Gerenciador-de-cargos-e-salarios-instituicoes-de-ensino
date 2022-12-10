import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Cargo.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/meucargo_content.dart';

class TabletMeucargo extends StatelessWidget {
  Cargo cargo;
  String competencias_cargo;
  String titulo_cargo;
  String nome_cargo;
  double soma;
  double valor_atual;
  double proximo_valor;
  double intervalo_atual_inicio;
  double intervalo_atual_fim;
  double intervalo_proximo_inicio;
  double intervalo_proximo_fim;
  TabletMeucargo({Key? key,
      required this.cargo,
      required this.competencias_cargo,
      required this.nome_cargo,
      required this.titulo_cargo,
      required this.soma, required this.valor_atual, required this.proximo_valor, required this.intervalo_atual_inicio, required this.intervalo_atual_fim, required this.intervalo_proximo_inicio, required this.intervalo_proximo_fim}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Center(
      child:SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 20.0),
        child: 
            Container(
        width: mediaQuery.width*0.85,
        child:
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: mediaQuery.height * 0.015,
                  horizontal: mediaQuery.width * 0.015),
              child: Column(
                  children: [
                    Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                         Container(
                              width: mediaQuery.width*0.35,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                CargoText(competencias: this.cargo.competencias,
                              descricao: this.cargo.descricao,
                              nome: this.cargo.nome,),
                              ],),
                            ),
                          Container(
                            width: mediaQuery.width*0.30,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              DadosText(tempo_empresa: this.cargo.tempo_empresa,
                              titulo: this.cargo.titulo,
                              tempo_experiencia: this.cargo.tempo_experiencia),
                            ],),
                          ),
                    
                        ],),
                      ),
                      SizedBox(height: 22,),
                      Container(
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                      vertical: mediaQuery.height * 0.005,
                                      horizontal: mediaQuery.width * 0.005),
                                          width: mediaQuery.width*0.35,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: ProximoCargoText(grau: this.cargo.grau,
                            instituicao: this.cargo.instituicao,
                            competencias_cargo: competencias_cargo,
                            nome_cargo: nome_cargo,
                            titulo_cargo: titulo_cargo),
                                        ),
                                        Faixassalariais(tamanho: 1, intervalo_atual_fim: intervalo_atual_fim, intervalo_atual_inicio: intervalo_atual_inicio, intervalo_proximo_fim: intervalo_proximo_fim, intervalo_proximo_inicio: intervalo_proximo_inicio, proximo_valor: proximo_valor, valor_atual: valor_atual,),
                        ],),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            SizedBox(height: 22,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              
                              BotaoPontuacoes(),
                              Pontuacaolayout(tamanho: 190, soma: soma,),
                              
                            ],),
                          ],
                        ),
                      ),
                  ]),
            ),
      )
        
      ),
      )
      
    );
  }
}
