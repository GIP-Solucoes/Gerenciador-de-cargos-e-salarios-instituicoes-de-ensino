import 'package:flutter/material.dart';
import 'package:gip_solucoes/components/app_bar/components/mobile_appbar.dart';
import 'package:gip_solucoes/constants.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_aempresa.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_configuracoes.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_esqueci.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_faq.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_hero.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_login.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_menu.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_meucargo.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_pontuacoes.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_professores.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_resultados.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_status.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_suaspontuacoes.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_tabela.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_hero.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_aempresa.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_esqueci.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_faq.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_hero.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_simulador.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_login.dart';

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
              return const TabletEsqueci();
              break;
          }
          return const TabletLogin();
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
