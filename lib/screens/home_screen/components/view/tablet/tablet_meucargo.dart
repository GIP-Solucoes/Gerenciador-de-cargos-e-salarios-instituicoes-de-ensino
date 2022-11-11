import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/meucargo_content.dart';

class TabletMeucargo extends StatelessWidget {
  const TabletMeucargo({Key? key}) : super(key: key);

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
                                CargoText(competencias: '', descricao: '', nome: '',),
                              ],),
                            ),
                          Container(
                            width: mediaQuery.width*0.30,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              DadosText(tempo_empresa: 1, tempo_experiencia: 1, titulo: '',),
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
                                          child: ProximoCargoText(grau: 5, instituicao: '', competencias_cargo: '', nome_cargo: '', titulo_cargo: '',),
                                        ),
                                        Faixassalariais(tamanho: 1, intervalo_atual_fim: 0, intervalo_atual_inicio: 0, intervalo_proximo_fim: 0, intervalo_proximo_inicio: 0, proximo_valor: 0, valor_atual: 0,),
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
                              Pontuacaolayout(tamanho: 190, soma: 0,),
                              
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
