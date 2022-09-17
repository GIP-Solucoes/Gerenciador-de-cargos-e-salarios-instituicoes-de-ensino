import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/hero_content.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/sistema_content.dart';

// navbar_items
final navbarItemsSistema = ["Configurações", "Sair"];

class NavbarItemsSistema extends StatelessWidget {
  const NavbarItemsSistema({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: isMobile ? Axis.vertical : Axis.horizontal,
      itemBuilder: (context, index) {
        if (index == 1)
          return Row(
            children: [
              NavbarItemSistema(title: navbarItemsSistema[index], index: index),
              Icon(Icons.input),
            ],
          );
        return NavbarItemSistema(
          title: navbarItemsSistema[index],
          index: index,
        );
      },
      separatorBuilder: (context, index) {
        if (index == 1) return const SizedBox(width: 5.0);
        return const SizedBox(width: 30.0);
      },
      shrinkWrap: true,
      itemCount: navbarItemsSistema.length,
    );
  }
}

class _StateNavbarItemSistema extends State<NavbarItemSistema> {
  _StateNavbarItemSistema({
    Key? key,
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
          Navigator.popAndPushNamed(context, '/');
        }else{
          paginaS = 1;
          Navigator.popAndPushNamed(context, '/sistema');
        }
        
      },
      child: index == 1
          ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title + ' ',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                  ),
                ),
                Icon(
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
  NavbarItemSistema({
    Key? key,
    required this.title,
    required this.index,
  }) : super(key: key);
  final String title;
  final int index;
  @override
  @override
  State<StatefulWidget> createState() {
    return _StateNavbarItemSistema(index: index, title: title);
  }
}
