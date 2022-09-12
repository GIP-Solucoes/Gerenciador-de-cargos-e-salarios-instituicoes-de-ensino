import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/hero_content.dart';

// navbar_items
final navbarItems = ["A empresa", "Suporte", "FAQ"];

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
        /*if (index == 1) return Row(
          children: [
            NavbarItem(title: navbarItems[index], index: index),
            //Icon(Icons.whatsapp),
          ],
        );*/
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

class _StateNavbarItem extends State<NavbarItem>{
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
        
        if(index!=1){
            pagina = index;

        Navigator.pushNamed(context, '/');
        }
        
      },
      child: index==1?Row(children: [Text(
        title+' ',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
      ),
      Icon(Icons.whatsapp,color: Colors.black,)],):Text(
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
  NavbarItem({
    Key? key,
    required this.title,
    required this.index,
  }) : super(key: key);
  final String title;
  final int index;
  @override
  @override
  State<StatefulWidget> createState() {
    return _StateNavbarItem(index: index, title: title);
  }
}
