import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/name_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gip_solucoes/screens/home_screen/components/controller/sistema_content.dart';

class MenuText extends StatelessWidget {
  const MenuText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [],
    );
  }
}

class Items extends StatelessWidget {
  Items({
    Key? key,
  }) : super(key: key);
  final whatIDo = [
    NameIconColor(
      title: "Meu cargo",
      iconData: Icons.business_center,
      color: Colors.blue[600]!,
      index: 2,
    ),
    NameIconColor(
      title: "Resultado",
      iconData: Icons.trending_up,
      color: Colors.blue[600]!,
      index: 3,
    ),
    NameIconColor(
      title: "Dados dos cargos",
      iconData: Icons.assignment_outlined,
      color: Colors.blue[600]!,
      index: 4,
    ),
    NameIconColor(
      title: "Dados dos funcionários",
      iconData: Icons.file_copy,
      color: Colors.blue[600]!,
      index: 5,
    ),
    NameIconColor(
      title: "Pontuação",
      iconData: Icons.insert_chart,
      color: Colors.blue[600]!,
      index: 6,
    ),
    NameIconColor(
      title: "Simulador",
      iconData: Icons.play_circle,
      color: Colors.blue[600]!,
      index: 7,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        children: whatIDo
            .map((e) => TextButton(
                  onPressed: () {
                    paginaS = e.index;
                    Navigator.pushNamed(context, '/sistema');
                  },
                  child: Container(
                    height: 200,
                    width: 200,
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(80),
                          ),
                          child: Icon(
                            e.iconData,
                            color: e.color,
                            size: 78,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          e.title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.josefinSans(
                            color: Colors.blue[600],
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        )
                      ],
                    ),
                  ),
                ))
            .toList());
  }
}
