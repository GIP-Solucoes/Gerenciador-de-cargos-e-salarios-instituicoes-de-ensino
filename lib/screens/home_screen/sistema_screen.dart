import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gip_solucoes/components/app_bar/components/app_drawer_sistema.dart';
import 'package:gip_solucoes/components/app_bar/custom_navbar.dart';
import 'package:gip_solucoes/components/app_bar/custom_navbar_sistema.dart';
import 'package:gip_solucoes/constants.dart';
import 'package:gip_solucoes/screens/home_screen/components/controller/sistema_content.dart';

//gerenciador da página do sistema
class SistemaScreen extends StatefulWidget {
  const SistemaScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StateSistemaScreen();
  }
}

class _StateSistemaScreen extends State<SistemaScreen> {
  String em = '';
  String id = '';
  @override
  Widget build(BuildContext context) {
    FirebaseAuth aut = FirebaseAuth.instance;
    User? use = aut.currentUser;
    if (use != null) {
      em = use!.email!;
    }
    return Scaffold(
      drawer: AppDrawerSistema(email: this.em),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: kBackgroundColor,
        child: SafeArea(
          child: Column(
            children: [
              if (em == '') const CustomNavbar(),
              // ignore: unnecessary_null_comparison
              if (em != '') CustomNavbarSistema(email: em),
              Expanded(child: SistemaContent(email:em)),
            ],
          ),
        ),
      ),
    );
  }
}
