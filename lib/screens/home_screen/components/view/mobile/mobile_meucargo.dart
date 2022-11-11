import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/meucargo_content.dart';

class MobileMeucargo extends StatelessWidget {
  const MobileMeucargo({Key? key}) : super(key: key);

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
                    CargoText(competencias: '', descricao: '', nome: '',),
                    SizedBox(height: 22,),
                    DadosText(tempo_empresa: 1, tempo_experiencia: 1, titulo: '',),
                    SizedBox(height: 22,),
                    Container(
                            padding: EdgeInsets.symmetric(
                                      vertical: mediaQuery.height * 0.005,
                                      horizontal: mediaQuery.width * 0.005),
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: ProximoCargoText(grau: 5, instituicao: '', competencias_cargo: '', nome_cargo: '', titulo_cargo: '',),
                                        ),
                    SizedBox(height: 22,),
                    Faixassalariais(tamanho: mediaQuery.width*0.003, intervalo_atual_fim: 0, intervalo_atual_inicio: 0, intervalo_proximo_fim: 0, intervalo_proximo_inicio: 0, proximo_valor: 0, valor_atual: 0,),
                    SizedBox(height: 22,),
                    
                              Pontuacaolayout(tamanho: 190, soma: 0,),
                              SizedBox(height: 22,),
                              BotaoPontuacoes(),
                  ]),
            ),
      )
        
      ),
      )
      
    );
  }
}
