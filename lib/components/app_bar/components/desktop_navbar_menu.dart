import 'package:flutter/material.dart';
import 'package:gip_solucoes/components/app_bar/components/navbar_item_menu.dart';
import 'package:gip_solucoes/components/app_bar/components/navbar_menu_content.dart';

//layout parte de cima (sistema)
class DesktopNavbarMenu extends StatelessWidget {
  const DesktopNavbarMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    const height = 100.0;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: width > 850 ? (width * 0.07) : (width * 0.05)),
      height: height,
      child: Container(
        child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
          const HeaderMenu(),
          const SizedBox(width: 15,),
          const SizedBox(
            height: 30,
            child: const NavbarItemMenu(),
          ),
              ]),
              Row(
                children: [
                  const Sair(),

              ],)
              
          ],),

      ),
    );
  }
}
class BuyNowButton extends StatelessWidget {
  const BuyNowButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Login",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
          Icon(Icons.navigate_next_rounded,
              color: Colors.grey, size: 30.0),
        ],
      ),
    );
  }
}