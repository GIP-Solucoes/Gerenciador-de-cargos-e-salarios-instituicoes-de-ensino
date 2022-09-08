import 'package:flutter/material.dart';

import 'package:starbucks_landing_page/screens/home_screen/components/aempresa_text.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/simulador_content.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/youtube.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/menu_content.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/serving_items_list.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DesktopSimulador extends StatefulWidget {
  const DesktopSimulador({Key? key}) : super(key: key);

  
  
  @override
  State<DesktopSimulador> createState() {
    // TODO: implement createState
    return _StateDesktopSimulador();
  }
}
class _StateDesktopSimulador extends State<DesktopSimulador>{
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
                  TitleSimulador(),
                ],),
                
                Simulador(),
                SizedBox(
                  height: 17,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  BotaoCalcular(),
                  Resultado(),
                  BotaoVoltar(),
                ],)
                
          ],
        ),
        
      ),
      )
      
    );
  }
}

class _ServingItems extends StatelessWidget {
  const _ServingItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return servingItems[index];
        },
        separatorBuilder: (context, _) {
          return const SizedBox(height: 40.0);
        },
        itemCount: servingItems.length,
        shrinkWrap: true,
      ),
    );
  }
}
