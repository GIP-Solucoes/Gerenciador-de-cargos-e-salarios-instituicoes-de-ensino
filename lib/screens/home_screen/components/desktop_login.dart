import 'package:flutter/material.dart';

import 'package:starbucks_landing_page/screens/home_screen/components/aempresa_text.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/youtube.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/login_content.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/serving_items_list.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DesktopLogin extends StatelessWidget {
  const DesktopLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Center(
      child:Center(
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