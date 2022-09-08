import 'package:flutter/material.dart';
import 'package:starbucks_landing_page/components/app_bar/components/mobile_appbar.dart';
import 'package:starbucks_landing_page/constants.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/desktop/desktop_aempresa.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/desktop/desktop_configuracoes.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/desktop/desktop_esqueci.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/desktop/desktop_faq.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/desktop/desktop_hero.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/desktop/desktop_login.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/desktop/desktop_menu.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/desktop/desktop_meucargo.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/desktop/desktop_pontuacoes.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/desktop/desktop_professores.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/desktop/desktop_resultados.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/desktop/desktop_status.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/desktop/desktop_suaspontuacoes.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/desktop/desktop_tabela.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/mobile/mobile_hero.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/tablet/tablet_hero.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/desktop/desktop_simulador.dart';

int pagina = 4;

class HeroContent extends StatefulWidget {
  const HeroContent({Key? key}) : super(key: key);

  @override
  State<HeroContent> createState() {
    // TODO: implement createState
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
              return const DesktopEsqueci();
          }
          return const DesktopLogin();
        } else if (constraints.maxWidth >= 600) {
          return Container(
            height: 50,
            width: 50,
            color: Colors.red,
            child: Text('Em desenvolvimento!'),
          ); //const TabletHero();
        }
        return Container(
          height: 50,
          width: 50,
          color: Colors.red,
          child: Text('Em desenvolvimento!'),
        ); //const MobileHero();
      }),
    );
  }
}