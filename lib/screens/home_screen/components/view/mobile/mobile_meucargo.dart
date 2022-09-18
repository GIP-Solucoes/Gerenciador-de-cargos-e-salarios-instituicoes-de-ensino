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
                    CargoText(),
                    SizedBox(height: 22,),
                    DadosText(),
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
                                          child: ProximoCargoText(),
                                        ),
                    SizedBox(height: 22,),
                    Faixassalariais(tamanho: mediaQuery.width*0.003,),
                    SizedBox(height: 22,),
                    
                              Pontuacaolayout(tamanho: 190),
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
