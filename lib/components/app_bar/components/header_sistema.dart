import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/sistema_content.dart';
//imagem empresa (sistema)
class HeaderSistema extends StatelessWidget {
  const HeaderSistema({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () {
              paginaS = 0;
              Navigator.pushNamed(context, '/sistema');
            },
            child: Image.asset('assets/images/unaerp.png', height: 60.0)),

      ],
    );
  }
}
