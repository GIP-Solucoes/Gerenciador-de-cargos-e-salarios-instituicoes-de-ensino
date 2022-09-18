import 'package:flutter/material.dart';

import 'package:gip_solucoes/screens/home_screen/components/view/content/meucargo_content.dart';

class DesktopMeucargo extends StatelessWidget {
  const DesktopMeucargo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Center(
      child:SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 20.0, horizontal: mediaQuery.width * 0.07),
        child: 
            Container(
        width: mediaQuery.width*0.75,
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
                              width: mediaQuery.width*0.25,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                CargoText(),
                              ],),
                            ),
                          Container(
                            width: mediaQuery.width*0.20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              DadosText(),
                            ],),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                      vertical: mediaQuery.height * 0.005,
                                      horizontal: mediaQuery.width * 0.005),
                                          width: mediaQuery.width*0.20,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: ProximoCargoText(),
                                        ),
                    
                        ],),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            SizedBox(height: 22,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Faixassalariais(tamanho: 1,),
                              
                              Pontuacaolayout(tamanho: 190),
                              BotaoPontuacoes(),
                              SizedBox(
                                width: mediaQuery.width*0.0025,
                              ),
                              SizedBox(
                                width: mediaQuery.width*0.0025,
                              ),
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
