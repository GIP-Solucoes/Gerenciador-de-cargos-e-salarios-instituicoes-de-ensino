import 'package:flutter/material.dart';
import 'package:gip_solucoes/components/app_bar/components/app_drawer_sistema.dart';
import 'package:gip_solucoes/components/app_bar/custom_navbar_sistema.dart';
import 'package:gip_solucoes/constants.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/sistema_content.dart';
//gerenciador da página do sistema
class SistemaScreen extends StatefulWidget {
  const SistemaScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StateSistemaScreen();
  }
}

class _StateSistemaScreen extends State<SistemaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawerSistema(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: kBackgroundColor,
        child: SafeArea(
          child: Column(
            children: [
              const CustomNavbarSistema(),
              Expanded(child: SistemaContent()),
            ],
          ),
        ),
      ),
    );
  }
}
