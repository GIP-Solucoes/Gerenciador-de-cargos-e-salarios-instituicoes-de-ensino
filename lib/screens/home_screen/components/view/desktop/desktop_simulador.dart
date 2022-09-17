import 'package:flutter/material.dart';

import 'package:gip_solucoes/screens/home_screen/components/view/content/aempresa_text.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/simulador_content.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/youtube.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/menu_content.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/serving_items_list.dart';
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
    return SingleChildScrollView(
      child:Column(
        children:[
          Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.175),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                Row(children: [
                  SizedBox(width: 5),
                  TitleSimulador(),
                ],),
                
                Simulador(valor:0.65),
                SizedBox(
                  height: 17,
                ),
                
                
          ],
          
        ),
        
      ),
      Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //SizedBox(width: 10,),
                  BotaoCalcular(),
                  SizedBox(width: mediaQuery.width*0.0285,),
                  Resultado(),
                  SizedBox(width: mediaQuery.width*0.0285,),
                  BotaoVoltar(),

                  //SizedBox(width: 10,),
                ],)
        ] 
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
