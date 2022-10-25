import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_aempresa.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_esqueci.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_faq.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_hero.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_login.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_aempresa.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_esqueci.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_faq.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_hero.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_login.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_aempresa.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_esqueci.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_faq.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_hero.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_login.dart';

int pagina = 4;

class HeroContent extends StatefulWidget {
  const HeroContent({Key? key}) : super(key: key);

  @override
  State<HeroContent> createState() {
    return _StateHeroContent();
  }
}

class _StateHeroContent extends State<HeroContent> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth >= 850) {
          switch (pagina) {
            case 4:
              return const DesktopHero();
              break;
            case 0:
              return const DesktopAempresa();
              break;
            case 2:
              return const DesktopFaq();
              break;
            case 3:
              return DesktopEsqueci();
              break;
          }
          return const DesktopLogin();
        } else if (constraints.maxWidth >= 600) {
          switch (pagina) {
            case 4:
              return const TabletHero();
              break;
            case 0:
              return const TabletAempresa();
              break;
            case 2:
              return const TabletFaq();
              break;
            case 3:
              return TabletEsqueci();
              break;
          }
          return const TabletLogin();
        }
        switch (pagina) {
            case 4:
              return const MobileHero();
              break;
            case 0:
              return const MobileAempresa();
              break;
            case 2:
              return const MobileFaq();
              break;
            case 3:
              return MobileEsqueci();
              break;
          }
          return const MobileLogin();
      }),
    );
  }
}
