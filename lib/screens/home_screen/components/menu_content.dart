import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/name_color.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:my_portfolio/models/name_color.dart';

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
      iconData: Icons.business_center, //assigment_indbusiness center
      color: Colors.blue[600]!,
    ),
    NameIconColor(
      title: "Resultado",
      iconData: Icons.trending_up,
      color: Colors.blue[600]!,
    ),
    NameIconColor(
      title: "Dados dos cargos",
      iconData: Icons.assignment_outlined,
      color: Colors.blue[600]!,
    ),
    NameIconColor(
      title: "Dados dos funcionários",
      iconData: Icons.file_copy,//file copy
      color: Colors.blue[600]!,
    ),
    NameIconColor(
      title: "Pontuação",
      iconData: Icons.insert_chart,
      color: Colors.blue[600]!,
    ),
    NameIconColor(
      title: "Simulador",
      iconData: Icons.play_circle,
      color: Colors.blue[600]!,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                children: whatIDo
                    .map((e) => Container(
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
                        ))
                    .toList());

    /*Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(children:[
          //Column(children: [
            Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                child: NameIconColor(
                                  title: "Mobile App Development",
      iconData: Icons.mobile_friendly,
      color: Colors.green[400]!,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                child: NameIconColor(
                                  title: "Mobile App Development",
      iconData: Icons.mobile_friendly,
      color: Colors.green[400]!,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                child: NameIconColor(
                                  title: "Mobile App Development",
      iconData: Icons.mobile_friendly,
      color: Colors.green[400]!,
                                ),
                              ),

          //],),
          ],),
                              Row(
                              children:[
                                Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                child: NameIconColor(
                                  title: "Mobile App Development",
      iconData: Icons.mobile_friendly,
      color: Colors.green[400]!,
                                ),
                              ),

                              SizedBox(height: 10,),
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                child: NameIconColor(
                                  title: "Mobile App Development",
      iconData: Icons.mobile_friendly,
      color: Colors.green[400]!,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                child: NameIconColor(
                                  title: "Mobile App Development",
      iconData: Icons.mobile_friendly,
      color: Colors.green[400]!,
                                ),
                              ),
                              ],),
        
        
      ],
    );*/
  }
}
