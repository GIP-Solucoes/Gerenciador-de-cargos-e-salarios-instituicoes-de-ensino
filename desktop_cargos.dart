import 'package:flutter/material.dart';

import 'package:gip_solucoes/screens/home_screen/components/view/content/aempresa_content.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/esqueci_content.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/cargos_content.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/youtube.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/menu_content.dart';
//import 'package:gip_solucoes/screens/home_screen/components/view/content/serving_items_list.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DesktopCargos extends StatelessWidget {
  const DesktopCargos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Center(
      child:SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.175),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Row(children: [
                  SizedBox(width: 5),
                  TitleCargos(tamanho:mediaQuery.width*0.86),
                ],),
                
                Cargos(valor:0.63),
                SizedBox(
                  height: 20,
                ),
                Row(children: [
                  SizedBox(width: 5,),
                  BotaoVoltar(),
                  SizedBox(width: 5,),
                  BotaoSalvar(),
                ],)
                
          ],
        ),
        
      ),
      )
      
    );
  }
}
/*
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
*/