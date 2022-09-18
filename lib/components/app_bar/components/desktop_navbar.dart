import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/hero_content.dart';

import '../../components.dart';
//layout parte de cima (inicio)
class DesktopNavbar extends StatelessWidget {
  const DesktopNavbar({Key? key}) : super(key: key);

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
                children: [
                  const Header(),
                  const SizedBox(
                    width: 15,
                  ),
                  const SizedBox(
                    child: const NavbarItems(),
                  ),
                ]),
              Row(
                children: [
                  const LoginButton(),
                ],
              )
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style:ButtonStyle(
        minimumSize:MaterialStateProperty.resolveWith((states) => const Size(120,45)),
        textStyle: MaterialStateProperty.resolveWith((states) => const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),),
        backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey[200]),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
      ),
      
      onPressed: () {
        pagina = 1;
        Navigator.pushNamed(context, '/');
      },
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
            const Icon(Icons.navigate_next_rounded, color: Colors.grey, size: 30.0),
          ],
        ),
    );
  }
}
