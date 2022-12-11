import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/controller/controller_suporte.dart';
import 'package:gip_solucoes/screens/home_screen/components/controller/hero_content.dart';

// navbar_items
final navbarItems = ["A empresa", "Suporte", "FAQ"];

//items layout (inicio)
class NavbarItems extends StatelessWidget {
  const NavbarItems({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: isMobile ? Axis.vertical : Axis.horizontal,
      itemBuilder: (context, index) {
        return NavbarItem(
          title: navbarItems[index],
          index: index,
        );
      },
      separatorBuilder: (context, index) {
        if (index == 1) return const SizedBox(width: 5.0);
        return const SizedBox(width: 30.0);
      },
      shrinkWrap: true,
      itemCount: navbarItems.length,
    );
  }
}

class _StateNavbarItem extends State<NavbarItem> {
  _StateNavbarItem({
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
        if (index != 1) {
          pagina = index;

          Navigator.pushNamed(context, '/');
        } else {
          SuporteController suporteController = new SuporteController();
          suporteController.redireciona_whatsapp();
        }
      },
      child: index == 1
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title + ' ',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
                const Icon(
                  Icons.whatsapp,
                  color: Colors.black,
                )
              ],
            )
          : Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
    );
  }
}

class NavbarItem extends StatefulWidget {
  const NavbarItem({
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
    return _StateNavbarItem(index: index, title: title);
  }
}
