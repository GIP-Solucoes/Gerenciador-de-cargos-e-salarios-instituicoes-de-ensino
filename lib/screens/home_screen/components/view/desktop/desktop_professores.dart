import 'package:flutter/material.dart';

import 'package:gip_solucoes/screens/home_screen/components/view/content/aempresa_text.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/esqueci_content.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/youtube.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/menu_content.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/professores_content.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/serving_items_list.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DesktopProfessores extends StatefulWidget {
  const DesktopProfessores({Key? key}) : super(key: key);

  
  
  @override
  State<DesktopProfessores> createState() {
    // TODO: implement createState
    return _StateDesktopProfessores();
  }
}
class _StateDesktopProfessores extends State<DesktopProfessores>{
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
                  TitleProfessores(),
                ],),
                
                Professores(),
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
