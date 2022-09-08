import 'package:flutter/material.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/content/hero_content.dart';

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
            child: Image.asset('assets/images/logo.png', height: 30.0)),
            
        //const SizedBox(width: 10.0),
        //Image.asset('assets/images/title.png', height: 35.0),
      ],
    );
  }
}
