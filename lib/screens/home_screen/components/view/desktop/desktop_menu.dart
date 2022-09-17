import 'package:flutter/material.dart';

import 'package:gip_solucoes/screens/home_screen/components/view/content/aempresa_text.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/esqueci_content.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/youtube.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/menu_content.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/serving_items_list.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DesktopMenu extends StatelessWidget {
  const DesktopMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Center(
        child:Center(
          child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 20.0, horizontal: mediaQuery.width * 0.18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
                
                children: [
                  //SizedBox(width: 50,),
                  Items(),
                  
                 //SizedBox(width: 50,),
              
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
        
      ),
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
