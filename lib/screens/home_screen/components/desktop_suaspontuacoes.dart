import 'package:flutter/material.dart';

import 'package:starbucks_landing_page/screens/home_screen/components/aempresa_text.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/esqueci_content.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/youtube.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/menu_content.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/suaspontuacoes_content.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/serving_items_list.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DesktopSuaspontuacoes extends StatefulWidget {
  const DesktopSuaspontuacoes({Key? key}) : super(key: key);

  
  
  @override
  State<DesktopSuaspontuacoes> createState() {
    // TODO: implement createState
    return _StateDesktopProfessores();
  }
}
class _StateDesktopProfessores extends State<DesktopSuaspontuacoes>{
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      child:Container(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.175),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                Row(children: [
                  SizedBox(width: 5),
                  TitleSuaspontuacoes(),
                ],),
                
                Pontuacoes(),
                SizedBox(
                  height: 17,
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
