import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/controller/sistema_content.dart';

class CargoText extends StatelessWidget {
  String nome;
  String competencias;
  String descricao;
  CargoText(
      {Key? key,
      required this.nome,
      required this.descricao,
      required this.competencias})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AutoSizeText(
          this.nome,
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
          this.descricao,
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
          this.competencias,
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
        SizedBox(
          height: 50,
        ),
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
  String titulo;
  int tempo_experiencia;
  int tempo_empresa;
  DadosText(
      {Key? key,
      required this.titulo,
      required this.tempo_experiencia,
      required this.tempo_empresa})
      : super(key: key);

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
          this.titulo,
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
          tempo_experiencia <= 1
              ? "${this.tempo_experiencia} ano"
              : "${this.tempo_experiencia} anos",
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
          tempo_empresa <= 1
              ? "${this.tempo_empresa} ano"
              : "${this.tempo_empresa} anos",
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

class ProximoCargoText extends StatefulWidget {
  String instituicao;
  int grau;
  String nome_cargo;
  String competencias_cargo;
  String titulo_cargo;
  ProximoCargoText(
      {Key? key,
      required this.instituicao,
      required this.grau,
      required this.nome_cargo,
      required this.competencias_cargo,
      required this.titulo_cargo})
      : super(key: key);

  @override
  State<ProximoCargoText> createState() => _ProximoCargoTextState();
}

class _ProximoCargoTextState extends State<ProximoCargoText> {
  _ProximoCargoTextState({
    Key? key,
  });
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          this.widget.nome_cargo,
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
          this.widget.titulo_cargo,
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
          this.widget.competencias_cargo,
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

class Faixassalariais extends StatefulWidget {
  double tamanho = 1;
  double valor_atual;
  double proximo_valor;
  double intervalo_atual_inicio;
  double intervalo_atual_fim;
  double intervalo_proximo_inicio;
  double intervalo_proximo_fim;
  Faixassalariais(
      {Key? key,
      required this.tamanho,
      required this.valor_atual,
      required this.proximo_valor,
      required this.intervalo_atual_inicio,
      required this.intervalo_atual_fim,
      required this.intervalo_proximo_inicio,
      required this.intervalo_proximo_fim})
      : super(key: key);

  @override
  State<Faixassalariais> createState() => _FaixassalariaisState();
}

class _FaixassalariaisState extends State<Faixassalariais> {
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
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                AutoSizeText(
                  "Valor atual/hr",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14.0 * widget.tamanho,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 130 * widget.tamanho,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "R\$ " +
                            this
                                .widget
                                .valor_atual
                                .toString()
                                .replaceAll('.', ','),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0 * widget.tamanho,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 5 * widget.tamanho,
            ),
            Column(
              children: [
                AutoSizeText(
                  "Proximo valor/hr",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14.0 * widget.tamanho,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 130 * widget.tamanho,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        this.widget.proximo_valor == 0
                            ? "R\$ --,--"
                            : "R\$ " +
                                this
                                    .widget
                                    .proximo_valor
                                    .toString()
                                    .replaceAll('.', ','),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0 * widget.tamanho,
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
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              width: 130 * widget.tamanho,
              height: 30.0,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    this
                            .widget
                            .intervalo_atual_inicio
                            .toString()
                            .replaceAll('.', ',') +
                        " à " +
                        this
                            .widget
                            .intervalo_atual_fim
                            .toString()
                            .replaceAll('.', ',') +
                        " pontos",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0 * (widget.tamanho),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 5 * widget.tamanho,
            ),
            Container(
              alignment: Alignment.center,
              width: 130 * widget.tamanho,
              height: 30.0,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    this.widget.proximo_valor == 0
                        ? "-- à -- pontos"
                        : (this.widget.intervalo_atual_fim)
                                .toString()
                                .replaceAll('.', ',') +
                            " à " +
                            this.widget.intervalo_proximo_fim.toString() +
                            " pontos",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0 * widget.tamanho,
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
  _PontuacaolayoutState({Key? key});
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
                this.widget.soma.toString().replaceAll('.', ','),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Pontuacaolayout extends StatefulWidget {
  double tamanho;
  double soma;
  Pontuacaolayout({Key? key, required this.tamanho, required this.soma})
      : super(key: key);
  @override
  @override
  State<StatefulWidget> createState() {
    return _PontuacaolayoutState();
  }
}
