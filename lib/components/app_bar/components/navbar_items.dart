import 'package:flutter/material.dart';

// navbar_items
final navbarItems = ["A empresa", "Suporte", "Icone", "FAQ"];

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
        if (index == 2) return Icon(Icons.whatsapp);
        return NavbarItem(
          title: navbarItems[index],
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

class NavbarItem extends StatelessWidget {
  const NavbarItem({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20.0,
      ),
    );
  }
}
