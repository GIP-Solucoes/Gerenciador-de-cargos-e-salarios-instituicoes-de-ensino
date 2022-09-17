import 'dart:math';

import 'package:flutter/material.dart';

import 'package:gip_solucoes/screens/home_screen/components/view/content/aempresa_text.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/meucargo_content.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/youtube.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/hero_text.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/serving_items_list.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

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
        //height: (mediaQuery.height*2.3)-(mediaQuery.width*0.65),
        width: mediaQuery.width*0.75,
        child:
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: mediaQuery.height * 0.015,
                  horizontal: mediaQuery.width * 0.015),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Expanded(
                     /* child:*/ Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                         // Flexible(
                          /*  child:*/ Container(
                              //height: mediaQuery.height*0.45,
                              width: mediaQuery.width*0.25,
                              child: Column(
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                CargoText(),
                              ],),
                            ),
                          //),
                          Container(
                            //height: mediaQuery.height*0.45,
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
                                          /*height:mediaQuery.height*0.45,*/
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: ProximoCargoText(),
                                        ),
                    
                        ],),
                      ),
                    //),
                    //Flexible(
                     /* child:*/ Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            SizedBox(height: 22,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Faixassalariais(),
                              
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
                   // )
                  ]),
            ),
      )
        
      ),
      )
      
    );
  }
}
