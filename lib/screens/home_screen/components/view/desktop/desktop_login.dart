import 'package:flutter/material.dart';

import 'package:gip_solucoes/screens/home_screen/components/view/content/aempresa_text.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/youtube.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/login_content.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/serving_items_list.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DesktopLogin extends StatelessWidget {
  const DesktopLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Center(
      child:SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 20.0, horizontal: mediaQuery.width * 0.07),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Login(),
            
            //const SizedBox(height: 75.0),
            //Rorw(
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