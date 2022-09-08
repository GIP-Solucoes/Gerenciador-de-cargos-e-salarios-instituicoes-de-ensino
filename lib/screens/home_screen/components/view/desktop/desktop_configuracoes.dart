import 'package:flutter/material.dart';

import 'package:starbucks_landing_page/screens/home_screen/components/view/content/aempresa_text.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/content/esqueci_content.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/content/configuracoes_content.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/content/youtube.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/content/menu_content.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/content/serving_items_list.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DesktopConfiguracoes extends StatelessWidget {
  const DesktopConfiguracoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Center(
      child:Center(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.175),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Row(children: [
                  SizedBox(width: 5),
                  TitleConfiguracoes(),
                ],),
                
                Container(
        height: 450,
        width: 600,
        //margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: 
            Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: mediaQuery.width * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Dadosgerais(),
                          BotaoSalvar()
                        ],
                      ),
                      Column(children: [
                        Segundonome(),
                        SizedBox(height: 30,),
                        Alterarimagem()
                      ],)
                    ])),
      ),
                SizedBox(
                  height: 10,
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