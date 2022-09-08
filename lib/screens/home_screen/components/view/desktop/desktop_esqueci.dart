import 'package:flutter/material.dart';

import 'package:starbucks_landing_page/screens/home_screen/components/view/content/aempresa_text.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/content/esqueci_content.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/content/youtube.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/content/faq_content.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/content/serving_items_list.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DesktopEsqueci extends StatelessWidget {
  const DesktopEsqueci({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child:Center(
        child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 20.0, horizontal: mediaQuery.width * 0.07),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
              
              children: [
                  SizedBox(height: 60),
                Row(children: [
                  TitleEsqueci(),
                ],),
                SizedBox(height: 10,),
                  Row(children: [
                  EscritaEsqueci(),
                ],),
                SizedBox(height: 10,),
                Row(children: [
                  EsqueciCampo(),
                ],),
                SizedBox(height: 10,),
                Row(children: [
                  EsqueciBotao(),
                  VoltarBotao(),
                ],),
              
            
            //const SizedBox(height: 75.0),
            //Row(
              //mainAxisSize: MainAxisSize.min,
              //children: const [
                //Expanded(
                //  child: HeroText(),
                //),
                //Expanded(
                //  flex: 2,
                //  child: HeroImage(),
                //),
              //],
            //),
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
