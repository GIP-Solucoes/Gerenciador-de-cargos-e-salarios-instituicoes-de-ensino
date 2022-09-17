import 'package:flutter/material.dart';
import 'package:gip_solucoes/components/app_bar/components/mobile_appbar.dart';
import 'package:gip_solucoes/constants.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_aempresa.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_cargos.dart';
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
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_cargos.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_configuracoes.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_hero.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_simulador.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_menu.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_meucargo.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_pontuacoes.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_professores.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_resultados.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_simulador.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_status.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_suaspontuacoes.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_tabela.dart';

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
          switch (paginaS) {
            case 0:
              return const TabletMenu();
              break;
              case 1:
              return const TabletConfiguracoes();
              break;
              case 2:
              return const TabletMeucargo();
              break;
              case 3:
              return const TabletResultados();
              break;
              case 4:
              return const TabletCargos();
              break;
              case 5:
              return const TabletProfessores();
              break;
              case 6:
              return const TabletPontuacoes();
              break;
              case 7:
              return const TabletSimulador();
              break;
              case 8:
              return const TabletSuaspontuacoes();
              break;
              case 9:
              return const TabletTabela();
              break;
              case 10:
              return const TabletStatus();
              break;
          }

          return Container(
            height: 50,
            width: 50,
            color: Colors.red,
            child: Text('Em desenvolvimento!'),
          ); 
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
