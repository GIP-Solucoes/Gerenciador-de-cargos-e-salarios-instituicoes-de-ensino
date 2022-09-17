import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/sistema_content.dart';

final double tam = 0;

class CargoText extends StatelessWidget {
  const CargoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AutoSizeText(
          "Professor Graduado",
          maxLines: 2,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
            fontWeight: FontWeight.w900,
            fontFamily: 'Santana',
          ),
        ),
        SizedBox(
          height: 12,
        ),
        AutoSizeText(
          "Executam serviços de apoio nas áreas de recursos humanos, administração, finanças e logística; atendem fornecedores e clientes, fornecendo e recebendo informações sobre produtos e serviços; tratam de documentos variados, cumprindo todo o procedimento necessário referente aos mesmos.",
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.black,
            fontSize: 8.0,
            letterSpacing: -1,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        AutoSizeText(
          "Competências",
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        AutoSizeText(
          "Executam serviços de apoio nas áreas de recursos humanos, administração, finanças e logística; atendem fornecedores e clientes, fornecendo e recebendo informações sobre produtos e serviços; tratam de documentos variados, cumprindo todo o procedimento necessário referente aos mesmos.",
          textAlign: TextAlign.justify,
          style:
              TextStyle(color: Colors.black, fontSize: 8.0, letterSpacing: -1),
        ),
      ],
    );
  }
}
class BotaoPontuacoes extends StatelessWidget {
  const BotaoPontuacoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 50,),
        TextButton(
              onPressed: () {
                paginaS = 8;
                Navigator.pushNamed(context, '/sistema');
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                width: 190,
                height: 60.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: Colors.black)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(
                      "Sistema de\npontuação",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_circle_right,
                      color: Colors.blue,
                      size: 40,
                    )
                  ],
                ),
              ),
            ),
      ],
    );
  }
}
class DadosText extends StatelessWidget {
  const DadosText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          "Título mínimo",
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        AutoSizeText(
          "Graduação",
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.0,
          ),
        ),
        SizedBox(
          height: 22,
        ),
        AutoSizeText(
          "Tempo de experiência mínimo",
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        AutoSizeText(
          "1 ano",
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.0,
          ),
        ),
        SizedBox(
          height: 22,
        ),
        AutoSizeText(
          "Tempo mínimo na empresa",
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        AutoSizeText(
          "1 ano",
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}

class ProximoCargoText extends StatelessWidget {
  const ProximoCargoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          "Próximo cargo",
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        AutoSizeText(
          "Especialização",
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 22,
        ),
        AutoSizeText(
          "Requisitos",
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
        SizedBox(
          height: 22,
        ),
        AutoSizeText(
          "Executam serviços de apoio nas áreas de recursos humanos, administração, finanças e logística; atendem fornecedores e clientes, fornecendo e recebendo informações sobre produtos e serviços; tratam de documentos variados, cumprindo todo o procedimento necessário referente aos mesmos.",
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: Colors.white,
              fontSize: 8.0,
              fontStyle: FontStyle.italic,
              letterSpacing: -1),
        ),
      ],
    );
  }
}

class Faixassalariais extends StatelessWidget {
  const Faixassalariais({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: 279,
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Faixas salariais",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Column(
              children: [
                AutoSizeText(
                  "Valor atual/hr",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 130,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "R\$ 49,34",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 19,
            ),
            Column(
              children: [
                AutoSizeText(
                  "Proximo valor/hr",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 130,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "R\$ 57,50",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          width: 279,
          height: 20.0,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(2.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Intervalo - Pontuação",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8.0,
                  fontWeight: FontWeight.bold,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: 130,
              height: 30.0,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "21 à 30 pontos",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 19,
            ),
            Container(
              alignment: Alignment.center,
              width: 130,
              height: 30.0,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "71 à 80 pontos",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _PontuacaolayoutState extends State<Pontuacaolayout> {
  final GlobalKey key = GlobalKey();
  Size sizeLargura = Size(0, 0);

  @override
  void initState() {
    super.initState;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox boxx =
          key.currentContext!.findRenderObject() as RenderBox;
      setState(() {
        sizeLargura = boxx.size;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          key: key,
          alignment: Alignment.center,
          height: 50,
          child: AutoSizeText(
            "Pontuação atual",
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.bold),
          ),
        ),
       // Row(
     //     children: [
            Container(
              alignment: Alignment.center,
              width: sizeLargura.width,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "25",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            
         // ],
       // )
      ],
    );
  }
}

class Pontuacaolayout extends StatefulWidget {
  double tamanho;
  Pontuacaolayout({Key? key, required this.tamanho}) : super(key: key);
  @override
  @override
  State<StatefulWidget> createState() {
    return _PontuacaolayoutState();
  }
}
