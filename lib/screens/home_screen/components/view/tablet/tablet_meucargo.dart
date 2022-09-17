import 'dart:math';

import 'package:flutter/material.dart';

import 'package:gip_solucoes/screens/home_screen/components/view/content/aempresa_text.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/meucargo_content.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/youtube.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/hero_text.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/serving_items_list.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

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
        //height: (mediaQuery.height*2.3)-(mediaQuery.width*0.65),
        width: mediaQuery.width*0.85,
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
                              width: mediaQuery.width*0.35,
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
                                          /*height:mediaQuery.height*0.45,*/
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: ProximoCargoText(),
                                        ),
                                        Faixassalariais(),
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              
                              BotaoPontuacoes(),
                              Pontuacaolayout(tamanho: 190),
                              
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
