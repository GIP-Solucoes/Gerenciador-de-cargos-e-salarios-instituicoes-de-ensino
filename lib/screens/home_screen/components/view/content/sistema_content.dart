import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_cargos.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_configuracoes.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_login.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_menu.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_meucargo.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_pontuacoes.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_professores.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_resultados.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_status.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_suaspontuacoes.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_tabela.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_cargos.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_configuracoes.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_menu.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_meucargo.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_pontuacoes.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_professores.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_resultados.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_simulador.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_status.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_suaspontuacoes.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_tabela.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_cargos.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_configuracoes.dart';
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

int paginaS = 11;
int pagina_backup = 0;
int paginaU = 0;

class SistemaContent extends StatefulWidget {
  String email;
  SistemaContent({Key? key, required this.email}) : super(key: key);

  @override
  State<SistemaContent> createState() {
    return _StateSistemaContent(email: this.email);
  }
}

class _StateSistemaContent extends State<SistemaContent> {
  String email;
  _StateSistemaContent({Key? key, required this.email});
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (this.email != '') {
      CollectionReference usuarios =
          FirebaseFirestore.instance.collection('Usuario');
      usuarios
          .where('email', isEqualTo: this.widget.email)
          .get()
          .then((QuerySnapshot q) {
        q.docs.forEach((element) {
          if (element['direitos_administrador'] == false) {
            setState(() {
              paginaU = 1;
            });
          } else {
            setState(() {
              paginaU = 2;
            });
          }
          print(paginaS);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        Object? data = ModalRoute.of(context)?.settings.arguments;
        if (data == null && paginaS == 11) {
          return const DesktopLogin();
        }

        if (constraints.maxWidth >= 850) {
          if (paginaU == 0) {
            return const Center(
              child: Text('Carregando...'),
            );
          }
          if (paginaU == 1) {
            if (paginaS == 0 || paginaS == 11) {
              return const DesktopMeucargo();
            }
          }
          if (paginaU == 2) {
            if (paginaS == 0 || paginaS == 11) return const DesktopMenu();
            if (paginaS == 2) return const DesktopMeucargo();
          }
          switch (paginaS) {
            case 1:
              return const DesktopConfiguracoes();
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
            case 11:
              return const TabletMenu();
              break;
          }
        }
        switch (paginaS) {
          case 0:
            return const MobileMenu();
            break;
          case 1:
            return const MobileConfiguracoes();
            break;
          case 2:
            return const MobileMeucargo();
            break;
          case 3:
            return const MobileResultados();
            break;
          case 4:
            return const MobileCargos();
            break;
          case 5:
            return const MobileProfessores();
            break;
          case 6:
            return const MobilePontuacoes();
            break;
          case 7:
            return const MobileSimulador();
            break;
          case 8:
            return const MobileSuaspontuacoes();
            break;
          case 9:
            return const MobileTabela();
            break;
          case 11:
            return const MobileMenu();
            break;
        }
        return const MobileStatus();
      }),
    );
  }
}
