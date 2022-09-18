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
                                CargoText(),
                              ],),
                            ),
                          Container(
                            width: mediaQuery.width*0.30,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              DadosText(),
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
                                          child: ProximoCargoText(),
                                        ),
                                        Faixassalariais(tamanho: 1,),
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
                              Pontuacaolayout(tamanho: 190),
                              
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
