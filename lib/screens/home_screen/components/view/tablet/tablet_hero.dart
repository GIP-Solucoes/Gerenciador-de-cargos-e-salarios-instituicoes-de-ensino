import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/hero_text.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class TabletHero extends StatelessWidget {
  const TabletHero({Key? key}) : super(key: key);

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
            
            HeroText(),
            Container(
              padding: EdgeInsets.symmetric(
            vertical: 40.0, horizontal: mediaQuery.width * 0.14),
              child:YoutubePlayerIFrame(
              controller: YoutubePlayerController(
                initialVideoId: '7S-AMLNHTzM',
                params: const YoutubePlayerParams(
        startAt: const Duration(minutes: 1, seconds: 36),
        showControls: true,
        showFullscreenButton: true,
        desktopMode: false,
        privacyEnhanced: true,
        useHybridComposition: true,
      ),
                ),
            ),),
          ],
        ),
        
      ),
      )
      
    );
  }
}