import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/sistema_content.dart';

// navbar_items_sistema
final navbarItemsSistema = ["Configurações", "Sair"];

//items layout (sistema)
class _StateNavbarItemSistema extends State<NavbarItemSistema> {
  _StateNavbarItemSistema({
    // ignore: unused_element
    key,
    required this.title,
    required this.index,
  });
  final String title;
  final int index;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (index == 1) {
            paginaU = 0;
          
          FirebaseAuth.instance.signOut();
          Navigator.popAndPushNamed(context, '/');
          
          
        } else {
          paginaS = 1;
          Navigator.popAndPushNamed(context, '/sistema');
        }
      },
      child: index == 1
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$title ',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                  ),
                ),
                const Icon(
                  Icons.input,
                  color: Colors.blue,
                )
              ],
            )
          : Text(
              title,
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 20.0,
              ),
            ),
    );
  }
}

class NavbarItemSistema extends StatefulWidget {
  const NavbarItemSistema({
    Key? key,
    required this.title,
    required this.index,
  }) : super(key: key);
  final String title;
  final int index;
  @override
  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _StateNavbarItemSistema(index: index, title: title);
  }
}
