import 'package:flutter/material.dart';
import 'package:starbucks_landing_page/components/app_bar/components/mobile_appbar.dart';
import 'package:starbucks_landing_page/constants.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/desktop/desktop_aempresa.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/desktop/desktop_cargos.dart';
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

int paginaS = 0;
int pagina_backup=0;
class SistemaContent extends StatefulWidget {
  const SistemaContent({Key? key}) : super(key: key);

  @override
  State<SistemaContent> createState() {
    // TODO: implement createState
    return _StateSistemaContent();
  }
}

class _StateSistemaContent extends State<SistemaContent> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth >= 850) {
          switch (paginaS) {
            case 0:
              return const DesktopMenu();
              break;
              case 1:
              return const DesktopConfiguracoes();
              break;
              case 2:
              return const DesktopMeucargo();
              break;
              case 3:
              return const DesktopResultados();
              break;
              case 4:
              return const DesktopCargos();
              break;
              case 5:
              return const DesktopProfessores();
              break;
              case 6:
              return const DesktopPontuacoes();
              break;
              case 7:
              return const DesktopSimulador();
              break;
              case 8:
              return const DesktopSuaspontuacoes();
              break;
              case 9:
              return const DesktopTabela();
              break;
              case 10:
              return const DesktopStatus();
              break;
          }
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
