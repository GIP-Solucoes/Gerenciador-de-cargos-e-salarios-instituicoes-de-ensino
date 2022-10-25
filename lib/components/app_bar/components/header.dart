import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/hero_content.dart';
//imagem empresa (inicio)
class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () {
              pagina = 4;
              Navigator.pushNamed(context, '/');
            },
            child: Image.network('https://firebasestorage.googleapis.com/v0/b/implementacaotcc.appspot.com/o/fixos%2Flogo.png?alt=media&token=43f5d90c-84b3-43fc-8cd9-77a91b9db188', height: 30.0)),

      ],
    );
  }
}
