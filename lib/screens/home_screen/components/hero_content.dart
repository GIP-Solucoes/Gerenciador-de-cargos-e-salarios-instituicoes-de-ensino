import 'package:flutter/material.dart';
import 'package:starbucks_landing_page/components/app_bar/components/mobile_appbar.dart';
import 'package:starbucks_landing_page/constants.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/desktop_aempresa.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/desktop_esqueci.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/desktop_faq.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/desktop_login.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/desktop_menu.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/desktop_resultados.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/desktop_tabela.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/mobile_hero.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/tablet_hero.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/desktop_cargos.dart';

class HeroContent extends StatefulWidget {
  const HeroContent({Key? key}) : super(key: key);

  
  @override
  State<HeroContent> createState() {
    // TODO: implement createState
    return _StateHeroContent();
  }
}
class _StateHeroContent extends State<HeroContent>{
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth >= 850) {
          return const DesktopTabela();
        } else if (constraints.maxWidth >= 600) {
          return const TabletHero();
        }
        return const MobileHero();
      }),
    );
  }
}
