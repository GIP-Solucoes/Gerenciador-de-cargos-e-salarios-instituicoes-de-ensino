/*
Text(
                                e.title,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.josefinSans(
                                  color: Colors.blue[600],
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              )*/
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/content/hero_content.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/content/sistema_content.dart';

class HeaderMenu extends StatelessWidget {
  const HeaderMenu({
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

class Sair extends StatelessWidget {
  const Sair({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.settings, color: Colors.blue[600], size: 30.0),
          onPressed: () {
            pagina_backup = paginaS;
            paginaS = 1;
            Navigator.pushNamed(context, '/sistema');
          },
        ),
        SizedBox(width: 50.0),
        TextButton(
          onPressed: () {
            pagina = 1;
            Navigator.pushNamed(context, '/');
          },
          child: Row(
            children: [
              Text(
                'Sair',
                textAlign: TextAlign.center,
                style: GoogleFonts.josefinSans(
                  color: Colors.blue[600],
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                width: 5.0,
              ),
              Icon(Icons.input, color: Colors.blue[600], size: 20.0),
            ],
          ),
        ),

        //const SizedBox(width: 10.0),
        //Image.asset('assets/images/title.png', height: 35.0),
      ],
    );
  }
}
