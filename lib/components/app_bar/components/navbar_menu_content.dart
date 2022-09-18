import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/hero_content.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/sistema_content.dart';
//conteudo layout cima (sistema)
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
            if(paginaS!=1)
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
              const SizedBox(
                width: 5.0,
              ),
              Icon(Icons.input, color: Colors.blue[600], size: 20.0),
            ],
          ),
        ),
      ],
    );
  }
}
