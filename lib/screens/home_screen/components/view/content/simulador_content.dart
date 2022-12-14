import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Cargo.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Pontuacao.dart';
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

class BotaoCalcular extends StatefulWidget {
  List<Cargo> cargos;
  List<Pontuacao> pontuacoes;
  List<TextEditingController> textEditingControllerFormacao;
  List<TextEditingController> textEditingControllerExperiencia;
  List<TextEditingController> textEditingControllerAssiduidade;
  String valorr;
  String faixaSalariall;
  TextEditingController resultado;
  TextEditingController resultadoFaixaSalarial;
  String instituicao;
  BotaoCalcular(
      {Key? key,
      required this.cargos,
      required this.pontuacoes,
      required this.valorr,
      required this.faixaSalariall,
      required this.resultado,
      required this.resultadoFaixaSalarial,
      required this.instituicao,
      required this.textEditingControllerFormacao,
      required this.textEditingControllerExperiencia,
      required this.textEditingControllerAssiduidade})
      : super(key: key);

  @override
  State<BotaoCalcular> createState() => _BotaoCalcularState();
}

final keyFaixa = GlobalKey<_ResultadoState>();
final keySimulador = GlobalKey<_SimuladorState>();

class _BotaoCalcularState extends State<BotaoCalcular> {
  String conversor(int contador) {
    if (contador == 0) {
      return "A";
    } else if (contador == 1) {
      return "B";
    } else if (contador == 2) {
      return "C";
    } else if (contador == 3) {
      return "D";
    } else if (contador == 4) {
      return "E";
    } else if (contador == 5) {
      return "F";
    } else if (contador == 6) {
      return "G";
    } else if (contador == 7) {
      return "H";
    } else if (contador == 8) {
      return "I";
    } else if (contador == 9) {
      return "J";
    } else if (contador == 10) {
      return "K";
    } else if (contador == 11) {
      return "L";
    } else if (contador == 12) {
      return "M";
    } else if (contador == 13) {
      return "N";
    } else if (contador == 14) {
      return "O";
    } else if (contador == 15) {
      return "P";
    } else if (contador == 16) {
      return "Q";
    } else if (contador == 17) {
      return "R";
    } else if (contador == 18) {
      return "S";
    } else if (contador == 19) {
      return "T";
    } else if (contador == 20) {
      return "U";
    } else if (contador == 21) {
      return "V";
    } else if (contador == 22) {
      return "W";
    } else if (contador == 23) {
      return "X";
    } else if (contador == 24) {
      return "Y";
    } else if (contador == 25) {
      return "Z";
    }
    return "Z" + (contador - 25).toString();
  }

  Future<void> get_faixas_salariais_simulador(double soma, String cargo) async {
    int contador = 0;
    bool verificador = false;
    CollectionReference cargos = FirebaseFirestore.instance.collection('Cargo');
    DocumentSnapshot carg = await cargos.doc(cargo).get();
    CollectionReference faixassalarias =
        carg.reference.collection('FaixaSalarial');

    faixassalarias
        .where('final_intervalo', isLessThan: soma)
        .orderBy('final_intervalo', descending: false)
        .get()
        .then((QuerySnapshot q) {
      if (q.docs.length == 0) {
        keyFaixa.currentState!.alterarFaixa(conversor(contador));
      }
      q.docs.forEach((element) {
        contador++;
        keyFaixa.currentState!.alterarFaixa(conversor(contador));
      });
    });
    faixassalarias
        .where('final_intervalo', isGreaterThanOrEqualTo: soma)
        .orderBy('final_intervalo', descending: false)
        .get()
        .then((QuerySnapshot q) {
      if (q.docs.length == 0) {
        //////////////
        bool verificador3 = false;
        faixassalarias
            .orderBy('final_intervalo', descending: true)
            .get()
            .then((QuerySnapshot q) {
          q.docs.forEach((element) {
            if (verificador3 == false) {
              keyFaixa.currentState!.alterarValor(
                  element['valor'].toString().replaceAll('.', ','));
              verificador3 = true;
            }
          });
        });
      }
      q.docs.forEach((element) {
        if (verificador == false) {
          keyFaixa.currentState!
              .alterarValor(element['valor'].toString().replaceAll('.', ','));
          verificador = true;
        }
      });
    });
  }

  get_pontuacao_simulador() {
    double somaS;
    CollectionReference cargos = FirebaseFirestore.instance.collection('Cargo');
    cargos
        .where('instituicao', isEqualTo: this.widget.instituicao)
        .where('titulo', isEqualTo: keySimulador.currentState!.tituloo)
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((element) {
        print("dentro cargo");
        somaS = element['valor_pontuacao'];
        CollectionReference pontuacoes =
            FirebaseFirestore.instance.collection('Pontuacao');
        pontuacoes
            .where('instituicao', isEqualTo: this.widget.instituicao)
            .get()
            .then((QuerySnapshot q) {
          q.docs.forEach((elementPontuacao) {
            print("dentro pontuacao");
            DocumentReference _documentReference = elementPontuacao.reference;
            CollectionReference _collectionReference =
                _documentReference.collection('PontuacaoAtributo');
            ////////////////

            _collectionReference
                .orderBy('nome', descending: false)
                .get()
                .then((QuerySnapshot q) {
              q.docs.forEach((elementPontuacaoAtributo) {
                print("dentro pontuacaoAtributo");
                double valor = 0;
                if (elementPontuacao['nome'] ==
                    "Pontua????o de Forma????o Acad??mica") {
                  if (elementPontuacaoAtributo['nome'] ==
                      "Cursos de Aperfei??oamento (m??nimo 180 Hs)") {
                    if (widget
                        .textEditingControllerFormacao[2].text.isNotEmpty) {
                      if (double.parse(
                              widget.textEditingControllerFormacao[2].text) >
                          elementPontuacaoAtributo['quantidade_maxima']) {
                        valor = elementPontuacaoAtributo['quantidade_maxima'] *
                            elementPontuacaoAtributo['valor'];
                      } else {
                        valor = double.parse(
                                widget.textEditingControllerFormacao[2].text) *
                            elementPontuacaoAtributo['valor'];
                      }
                    }
                  } else if (elementPontuacaoAtributo['nome'] ==
                      "Cursos de Extens??o Cultural (m??nimo 30 Hs)") {
                    if (widget
                        .textEditingControllerFormacao[3].text.isNotEmpty) {
                      if (double.parse(
                              widget.textEditingControllerFormacao[3].text) >
                          elementPontuacaoAtributo['quantidade_maxima']) {
                        valor = elementPontuacaoAtributo['quantidade_maxima'] *
                            elementPontuacaoAtributo['valor'];
                      } else {
                        valor = double.parse(
                                widget.textEditingControllerFormacao[3].text) *
                            elementPontuacaoAtributo['valor'];
                      }
                    }
                  } else if (elementPontuacaoAtributo['nome'] ==
                      'Cr??ditos de P??s-Gradua????o "Stricto Sensu" por disciplina') {
                    if (widget
                        .textEditingControllerFormacao[1].text.isNotEmpty) {
                      if (double.parse(
                              widget.textEditingControllerFormacao[1].text) >
                          elementPontuacaoAtributo['quantidade_maxima']) {
                        valor = elementPontuacaoAtributo['quantidade_maxima'] *
                            elementPontuacaoAtributo['valor'];
                      } else {
                        valor = double.parse(
                                widget.textEditingControllerFormacao[1].text) *
                            elementPontuacaoAtributo['valor'];
                      }
                    }
                  } else if (elementPontuacaoAtributo['nome'] == "Vari??veis") {
                    if (widget
                        .textEditingControllerFormacao[5].text.isNotEmpty) {
                      if (double.parse(
                              widget.textEditingControllerFormacao[5].text) >
                          elementPontuacaoAtributo['quantidade_maxima']) {
                        valor = elementPontuacaoAtributo['quantidade_maxima'] *
                            elementPontuacaoAtributo['valor'];
                      } else {
                        valor = double.parse(
                                widget.textEditingControllerFormacao[5].text) *
                            elementPontuacaoAtributo['valor'];
                      }
                    }
                  } else if (elementPontuacaoAtributo['nome'] ==
                      "Outros Cursos de Gradua????o") {
                    if (widget
                        .textEditingControllerFormacao[4].text.isNotEmpty) {
                      if (double.parse(
                              widget.textEditingControllerFormacao[4].text) >
                          elementPontuacaoAtributo['quantidade_maxima']) {
                        valor = elementPontuacaoAtributo['quantidade_maxima'] *
                            elementPontuacaoAtributo['valor'];
                      } else {
                        valor = double.parse(
                                widget.textEditingControllerFormacao[4].text) *
                            elementPontuacaoAtributo['valor'];
                      }
                    }
                  } else {
                    if (widget
                        .textEditingControllerFormacao[0].text.isNotEmpty) {
                      if (double.parse(
                              widget.textEditingControllerFormacao[0].text) >
                          elementPontuacaoAtributo['quantidade_maxima']) {
                        valor = elementPontuacaoAtributo['quantidade_maxima'] *
                            elementPontuacaoAtributo['valor'];
                      } else {
                        valor = double.parse(
                                widget.textEditingControllerFormacao[0].text) *
                            elementPontuacaoAtributo['valor'];
                      }
                    }
                  }
                } else if (elementPontuacao['nome'] == "Experi??ncia") {
                  if (elementPontuacaoAtributo['nome'] ==
                      "Trabalhos cient??ficos publicados em revista especializada") {
                    if (widget
                        .textEditingControllerExperiencia[3].text.isNotEmpty) {
                      if (double.parse(
                              widget.textEditingControllerExperiencia[3].text) >
                          elementPontuacaoAtributo['quantidade_maxima']) {
                        valor = elementPontuacaoAtributo['quantidade_maxima'] *
                            elementPontuacaoAtributo['valor'];
                      } else {
                        valor = double.parse(widget
                                .textEditingControllerExperiencia[3].text) *
                            elementPontuacaoAtributo['valor'];
                      }
                    }
                  } else if (elementPontuacaoAtributo['nome'] ==
                      "Realiza????o de Pesquisa aprovada pela Institui????o (M??nimo 1 ano)") {
                    if (widget
                        .textEditingControllerExperiencia[2].text.isNotEmpty) {
                      if (double.parse(
                              widget.textEditingControllerExperiencia[2].text) >
                          elementPontuacaoAtributo['quantidade_maxima']) {
                        valor = elementPontuacaoAtributo['quantidade_maxima'] *
                            elementPontuacaoAtributo['valor'];
                      } else {
                        valor = double.parse(widget
                                .textEditingControllerExperiencia[2].text) *
                            elementPontuacaoAtributo['valor'];
                      }
                    }
                  } else if (elementPontuacaoAtributo['nome'] ==
                      "Professor de universidade p??blica (Por ano completo)") {
                    if (widget
                        .textEditingControllerExperiencia[1].text.isNotEmpty) {
                      if (double.parse(
                              widget.textEditingControllerExperiencia[1].text) >
                          elementPontuacaoAtributo['quantidade_maxima']) {
                        valor = elementPontuacaoAtributo['quantidade_maxima'] *
                            elementPontuacaoAtributo['valor'];
                      } else {
                        valor = double.parse(widget
                                .textEditingControllerExperiencia[1].text) *
                            elementPontuacaoAtributo['valor'];
                      }
                    }
                  } else {
                    if (widget
                        .textEditingControllerExperiencia[0].text.isNotEmpty) {
                      if (double.parse(
                              widget.textEditingControllerExperiencia[0].text) >
                          elementPontuacaoAtributo['quantidade_maxima']) {
                        valor = elementPontuacaoAtributo['quantidade_maxima'] *
                            elementPontuacaoAtributo['valor'];
                      } else {
                        valor = double.parse(widget
                                .textEditingControllerExperiencia[0].text) *
                            elementPontuacaoAtributo['valor'];
                      }
                    }
                  }
                } else if (elementPontuacao['nome'] == "Assiduidade") {
                  if (widget
                      .textEditingControllerAssiduidade[0].text.isNotEmpty) {
                    if (double.parse(
                            widget.textEditingControllerAssiduidade[0].text) <=
                        elementPontuacaoAtributo['quantidade_maxima']) {
                      valor = elementPontuacaoAtributo['valor'];
                    } else {
                      valor = 0;
                    }
                  }
                } else {
                  print("Tempo casa:" +
                      keySimulador.currentState!.tempooCasa.toString());
                  if (keySimulador.currentState!.tempooCasa >
                      elementPontuacaoAtributo['quantidade_maxima']) {
                    valor = elementPontuacaoAtributo['quantidade_maxima'] *
                        elementPontuacaoAtributo['valor'];
                  } else {
                    valor = keySimulador.currentState!.tempooCasa *
                        elementPontuacaoAtributo['valor'];
                  }
                }
                somaS = somaS + valor;
                print(somaS);
                get_faixas_salariais_simulador(somaS, element.id);
              });
            });
          });
        });
      });
    });
  }

  Future<List<String>> retornar_dados() async {
    Future<List<String>> teste = ['teste', 'teste1'] as Future<List<String>>;
    return teste;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        get_pontuacao_simulador();
      },
      child: Container(
        alignment: Alignment.center,
        width: 175.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calculate, color: Colors.white, size: 30.0),
            Text(
              " CALCULAR",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<String>> dados = [] as Future<List<String>>;

class Resultado extends StatefulWidget {
  TextEditingController resultado;
  TextEditingController resultadoFaixaSalarial;
  double tamanho;
  String faixaSalariall;
  String valorr;
  Resultado(
      {Key? key,
      required this.tamanho,
      required this.faixaSalariall,
      required this.valorr,
      required this.resultado,
      required this.resultadoFaixaSalarial})
      : super(key: key);

  @override
  State<Resultado> createState() => _ResultadoState();
}

String testekk = "?";

class _ResultadoState extends State<Resultado> {
  String valorFaixa = "?";
  String valorRs = "??,??";
  void alterarFaixa(String valorFP) => setState(() {
        valorFaixa = valorFP;
      });
  void alterarValor(String valorFP) => setState(() {
        valorRs = valorFP;
      });
  Future<List<String>> retornar_dado2() async {
    Future<List<String>> teste = ['testeg', 'teste1'] as Future<List<String>>;
    return teste;
  }

  @override
  Widget build(BuildContext context) {
    widget.faixaSalariall = "?";
    widget.valorr = "??,??";
    return Container(
      width: 500.0 * widget.tamanho,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.orange[200],
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: 175.0 * widget.tamanho,
            height: 40.0,
            decoration: BoxDecoration(
              color: Colors.orange[400],
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Text(
              textAlign: TextAlign.center,
              "RESULTADO:",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0 * widget.tamanho,
              ),
            ),
          ),
          Text(
            textAlign: TextAlign.center,
            " FAIXA SALARIAL $valorFaixa | VALOR R\$ $valorRs",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0 * widget.tamanho,
            ),
          ),
        ],
      ),
    );
  }
}

class BotaoStatus extends StatelessWidget {
  BotaoStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 205.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings, color: Colors.white, size: 15.0),
          Text(
            " GERENCIAR STATUS",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}

class _SimuladorState extends State<Simulador> {
  int statusCont = 1;
  double mediaQueryx = 0;
  double valor = 0.65;
  String tituloo = "";
  _SimuladorState(double valor) {
    this.valor = valor;
  }
  final dropValue = ValueNotifier('');
  final dropOpcoes = [
    'Gradua????o',
    'Especializa????o',
    'Mestrado',
    'Doutorado',
    'Livre Doc??ncia'
  ];
  final dropValue2 = ValueNotifier('');
  final dropOpcoes2 = ['1 ano', '2 anos', '3 anos', '4 anos', '5 anos'];
  static TextEditingController text = TextEditingController(text: "5");
  final List<GlobalKey> categorias = [
    GlobalKey(),
    GlobalKey(),
  ];
  int ind = 0;
  late ScrollController scrollCont;
  BuildContext? tabContext;
  scrollTo(int index) async {
    scrollCont.removeListener(changeTabs);
    final categoria = categorias[index].currentContext!;

    await Scrollable.ensureVisible(categoria,
        duration: Duration(milliseconds: 600));
    setState(() {
      ind = index;
    });
    scrollCont.addListener(changeTabs);
  }

  @override
  void initState() {
    scrollCont = ScrollController();
    scrollCont.addListener(changeTabs);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  changeTabs() {
    late RenderBox box;
    for (var i = 0; i < categorias.length; i++) {
      box = categorias[i].currentContext!.findRenderObject() as RenderBox;
      Offset position = box.localToGlobal(Offset.zero);
      if (scrollCont.offset >= (position.dx - (mediaQueryx * 0.25)))
        setState(() {
          ind = i;
        });
    }
  }

  double tempooCasa = 0;
  List<String> tempo_c = ['0 ano'];
  List<String> titulo_c = ['Professor Graduado'];
  bool verifica_tempo_c = false;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    mediaQueryx = mediaQuery.width;

    if (this.widget.cargos.asMap().containsKey(3)) {
      if (verifica_tempo_c == false) {
        if (this.widget.cargos.asMap().containsKey(0))
          tituloo = widget.cargos[0].titulo;
        for (int i = 1; i <= widget.cargos.length; i++) {
          if (i == 1)
            tempo_c.add('$i ano');
          else
            tempo_c.add('$i anos');
        }
        verifica_tempo_c = true;
      }
    }
    return Builder(builder: (BuildContext context) {
      tabContext = context;

      return Container(
        height: 430,
        width: ((mediaQuery.width * valor) - 40) + (mediaQuery.width * 0.02),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: mediaQuery.height * 0.005,
                  horizontal: mediaQuery.width * 0.01),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [],
                        ),
                        SizedBox(
                          height: 45.0,
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: (mediaQuery.width * valor) - 40,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              children: [
                                SizedBox(
                                    height: 299,
                                    child: SingleChildScrollView(
                                        child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              key: categorias[0],
                                              alignment: Alignment.center,
                                              width: 209,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Colors.blue[200],
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "T??tulo",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Container(
                                              key: categorias[1],
                                              alignment: Alignment.center,
                                              width: 320,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Colors.blue[200],
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    (this
                                                            .widget
                                                            .pontuacoes
                                                            .asMap()
                                                            .containsKey(2))
                                                        ? widget
                                                            .pontuacoes[2].nome
                                                        : "Carregando...",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              width: 50.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Colors.blue[200],
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Qtde",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              width: 320,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Colors.blue[200],
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    (this
                                                            .widget
                                                            .pontuacoes
                                                            .asMap()
                                                            .containsKey(1))
                                                        ? widget
                                                            .pontuacoes[1].nome
                                                        : "Carregando...",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              width: 50.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Colors.blue[200],
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Text(
                                                "Qtde",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        IntrinsicHeight(
                                          child: Container(
                                            constraints:
                                                BoxConstraints(maxHeight: 100),
                                            child: Row(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 209,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        child:
                                                            ValueListenableBuilder(
                                                                valueListenable:
                                                                    widget
                                                                        .valueNotifierTitulo,
                                                                builder: (BuildContext
                                                                        context,
                                                                    String
                                                                        value,
                                                                    _) {
                                                                  return DropdownButton<
                                                                      String>(
                                                                    hint: Text(
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              16.0,
                                                                        ),
                                                                        (this.widget.cargos.asMap().containsKey(0))
                                                                            ? widget.cargos[0].titulo
                                                                            : "..."),
                                                                    value: (value
                                                                            .isEmpty)
                                                                        ? null
                                                                        : value,
                                                                    onChanged:
                                                                        (escolha) {
                                                                      widget.valueNotifierTitulo
                                                                              .value =
                                                                          escolha
                                                                              .toString();
                                                                      setState(
                                                                          () {
                                                                        tituloo =
                                                                            escolha.toString();
                                                                      });
                                                                      setState(
                                                                          () {
                                                                        for (int i =
                                                                                0;
                                                                            i < 3;
                                                                            i++)
                                                                          if (dropOpcoes[i] ==
                                                                              escolha)
                                                                            setState(() {
                                                                              statusCont = i + 1;
                                                                            });
                                                                      });
                                                                    },
                                                                    items: widget
                                                                        .cargos
                                                                        .map((op) =>
                                                                            DropdownMenuItem(
                                                                              value: op.titulo,
                                                                              child: Text(op.titulo),
                                                                            ))
                                                                        .toList(),
                                                                  );
                                                                })),
                                                    SizedBox(
                                                      width: 30,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 320,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        (this
                                                                    .widget
                                                                    .pontuacoes
                                                                    .asMap()
                                                                    .containsKey(
                                                                        2) &&
                                                                this
                                                                    .widget
                                                                    .pontuacoes[
                                                                        2]
                                                                    .pontuacaoAtributo
                                                                    .asMap()
                                                                    .containsKey(
                                                                        0))
                                                            ? widget
                                                                .pontuacoes[2]
                                                                .pontuacaoAtributo[
                                                                    0]
                                                                .nome
                                                            : "Carregando...",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      constraints:
                                                          BoxConstraints(
                                                              minHeight: 40),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            alignment: Alignment
                                                                .topRight,
                                                            height: 10,
                                                            width: 50,
                                                            child: IconButton(
                                                              onPressed: () {
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder: (_) =>
                                                                        AlertDialog(
                                                                          title:
                                                                              Text(
                                                                            "M??ximo de pontos:",
                                                                          ),
                                                                          content: Text((this.widget.pontuacoes.asMap().containsKey(2) && this.widget.pontuacoes[2].pontuacaoAtributo.asMap().containsKey(0))
                                                                              ? "O m??ximo de pontos para este atributo ?? ${widget.pontuacoes[2].pontuacaoAtributo[0].quantidade_maxima}."
                                                                              : "Carregando..."),
                                                                          actions: [
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                child: Text('Ok')),
                                                                          ],
                                                                        ));
                                                              },
                                                              icon: const Icon(
                                                                  Icons
                                                                      .help_outlined,
                                                                  size: 15,
                                                                  color: Colors
                                                                      .blue),
                                                            ),
                                                          ),
                                                          TextField(
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      r'[0-9]')),
                                                            ],
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller: widget
                                                                .textEditingFormacao[0],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 30,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 320,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        (this
                                                                    .widget
                                                                    .pontuacoes
                                                                    .asMap()
                                                                    .containsKey(
                                                                        1) &&
                                                                this
                                                                    .widget
                                                                    .pontuacoes[
                                                                        1]
                                                                    .pontuacaoAtributo
                                                                    .asMap()
                                                                    .containsKey(
                                                                        0))
                                                            ? widget
                                                                .pontuacoes[1]
                                                                .pontuacaoAtributo[
                                                                    0]
                                                                .nome
                                                            : "Carregando...",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      constraints:
                                                          BoxConstraints(
                                                              minHeight: 40),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            alignment: Alignment
                                                                .topRight,
                                                            height: 10,
                                                            width: 50,
                                                            child: IconButton(
                                                              onPressed: () {
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder: (_) =>
                                                                        AlertDialog(
                                                                          title:
                                                                              Text(
                                                                            "M??ximo de pontos:",
                                                                          ),
                                                                          content: Text((this.widget.pontuacoes.asMap().containsKey(1) && this.widget.pontuacoes[1].pontuacaoAtributo.asMap().containsKey(0))
                                                                              ? "O m??ximo de pontos para este atributo ?? ${widget.pontuacoes[1].pontuacaoAtributo[0].quantidade_maxima}."
                                                                              : "Carregando..."),
                                                                          actions: [
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                child: Text('Ok')),
                                                                          ],
                                                                        ));
                                                              },
                                                              icon: const Icon(
                                                                  Icons
                                                                      .help_outlined,
                                                                  size: 15,
                                                                  color: Colors
                                                                      .blue),
                                                            ),
                                                          ),
                                                          TextField(
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      r'[0-9]')),
                                                            ],
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller: widget
                                                                .textEditingExperiencia[0],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        IntrinsicHeight(
                                          child: Container(
                                            constraints:
                                                BoxConstraints(maxHeight: 100),
                                            child: Row(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 209,
                                                      height: 4,
                                                      child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 209,
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .blue[200],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    (this
                                                                            .widget
                                                                            .pontuacoes
                                                                            .asMap()
                                                                            .containsKey(
                                                                                3))
                                                                        ? widget
                                                                            .pontuacoes[3]
                                                                            .nome
                                                                        : "Carregando...",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ]),
                                                    ),
                                                    SizedBox(
                                                      width: 30,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 320,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        (this
                                                                    .widget
                                                                    .pontuacoes
                                                                    .asMap()
                                                                    .containsKey(
                                                                        2) &&
                                                                this
                                                                    .widget
                                                                    .pontuacoes[
                                                                        2]
                                                                    .pontuacaoAtributo
                                                                    .asMap()
                                                                    .containsKey(
                                                                        1))
                                                            ? widget
                                                                .pontuacoes[2]
                                                                .pontuacaoAtributo[
                                                                    1]
                                                                .nome
                                                            : "Carregando...",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      constraints:
                                                          BoxConstraints(
                                                              minHeight: 40),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            alignment: Alignment
                                                                .topRight,
                                                            height: 10,
                                                            width: 50,
                                                            child: IconButton(
                                                              onPressed: () {
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder: (_) =>
                                                                        AlertDialog(
                                                                          title:
                                                                              Text(
                                                                            "M??ximo de pontos:",
                                                                          ),
                                                                          content: Text((this.widget.pontuacoes.asMap().containsKey(2) && this.widget.pontuacoes[2].pontuacaoAtributo.asMap().containsKey(1))
                                                                              ? "O m??ximo de pontos para este atributo ?? ${widget.pontuacoes[2].pontuacaoAtributo[1].quantidade_maxima}."
                                                                              : "Carregando..."),
                                                                          actions: [
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                child: Text('Ok')),
                                                                          ],
                                                                        ));
                                                              },
                                                              icon: const Icon(
                                                                  Icons
                                                                      .help_outlined,
                                                                  size: 15,
                                                                  color: Colors
                                                                      .blue),
                                                            ),
                                                          ),
                                                          TextField(
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      r'[0-9]')),
                                                            ],
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller: widget
                                                                .textEditingFormacao[1],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 30,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 320,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        (this
                                                                    .widget
                                                                    .pontuacoes
                                                                    .asMap()
                                                                    .containsKey(
                                                                        1) &&
                                                                this
                                                                    .widget
                                                                    .pontuacoes[
                                                                        1]
                                                                    .pontuacaoAtributo
                                                                    .asMap()
                                                                    .containsKey(
                                                                        1))
                                                            ? widget
                                                                .pontuacoes[1]
                                                                .pontuacaoAtributo[
                                                                    1]
                                                                .nome
                                                            : "Carregando...",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      constraints:
                                                          BoxConstraints(
                                                              minHeight: 40),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            alignment: Alignment
                                                                .topRight,
                                                            height: 10,
                                                            width: 50,
                                                            child: IconButton(
                                                              onPressed: () {
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder: (_) =>
                                                                        AlertDialog(
                                                                          title:
                                                                              Text(
                                                                            "M??ximo de pontos:",
                                                                          ),
                                                                          content: Text((this.widget.pontuacoes.asMap().containsKey(1) && this.widget.pontuacoes[1].pontuacaoAtributo.asMap().containsKey(1))
                                                                              ? "O m??ximo de pontos para este atributo ?? ${widget.pontuacoes[1].pontuacaoAtributo[1].quantidade_maxima}."
                                                                              : "Carregando..."),
                                                                          actions: [
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                child: Text('Ok')),
                                                                          ],
                                                                        ));
                                                              },
                                                              icon: const Icon(
                                                                  Icons
                                                                      .help_outlined,
                                                                  size: 15,
                                                                  color: Colors
                                                                      .blue),
                                                            ),
                                                          ),
                                                          TextField(
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      r'[0-9]')),
                                                            ],
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller: widget
                                                                .textEditingExperiencia[1],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        IntrinsicHeight(
                                          child: Container(
                                            constraints:
                                                BoxConstraints(maxHeight: 100),
                                            child: Row(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 209,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        child:
                                                            ValueListenableBuilder(
                                                                valueListenable:
                                                                    widget
                                                                        .valueNotifierTempo,
                                                                builder: (BuildContext
                                                                        context,
                                                                    String
                                                                        value,
                                                                    _) {
                                                                  return DropdownButton<
                                                                      String>(
                                                                    hint: Text(
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              16.0,
                                                                        ),
                                                                        tempo_c[
                                                                            0]),
                                                                    value: (value
                                                                            .isEmpty)
                                                                        ? null
                                                                        : value,
                                                                    onChanged:
                                                                        (escolha) {
                                                                      widget.valueNotifierTempo
                                                                              .value =
                                                                          escolha
                                                                              .toString();
                                                                      setState(
                                                                          () {
                                                                        String t = escolha
                                                                            .toString()
                                                                            .substring(0,
                                                                                1);
                                                                        print(
                                                                            t);
                                                                        tempooCasa =
                                                                            double.parse(t);
                                                                      });
                                                                      setState(
                                                                          () {
                                                                        for (int i =
                                                                                0;
                                                                            i < 3;
                                                                            i++)
                                                                          if (dropOpcoes2[i] ==
                                                                              escolha)
                                                                            setState(() {
                                                                              statusCont = i + 1;
                                                                            });
                                                                      });
                                                                    },
                                                                    items: tempo_c
                                                                        .map((op) => DropdownMenuItem(
                                                                              value: op,
                                                                              child: Text(op),
                                                                            ))
                                                                        .toList(),
                                                                  );
                                                                })),
                                                    SizedBox(
                                                      width: 30,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 320,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        (this
                                                                    .widget
                                                                    .pontuacoes
                                                                    .asMap()
                                                                    .containsKey(
                                                                        2) &&
                                                                this
                                                                    .widget
                                                                    .pontuacoes[
                                                                        2]
                                                                    .pontuacaoAtributo
                                                                    .asMap()
                                                                    .containsKey(
                                                                        2))
                                                            ? widget
                                                                .pontuacoes[2]
                                                                .pontuacaoAtributo[
                                                                    2]
                                                                .nome
                                                            : "Carregando...",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      constraints:
                                                          BoxConstraints(
                                                              minHeight: 40),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            alignment: Alignment
                                                                .topRight,
                                                            height: 10,
                                                            width: 50,
                                                            child: IconButton(
                                                              onPressed: () {
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder: (_) =>
                                                                        AlertDialog(
                                                                          title:
                                                                              Text(
                                                                            "M??ximo de pontos:",
                                                                          ),
                                                                          content: Text((this.widget.pontuacoes.asMap().containsKey(2) && this.widget.pontuacoes[2].pontuacaoAtributo.asMap().containsKey(2))
                                                                              ? "O m??ximo de pontos para este atributo ?? ${widget.pontuacoes[2].pontuacaoAtributo[2].quantidade_maxima}."
                                                                              : "Carregando..."),
                                                                          actions: [
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                child: Text('Ok')),
                                                                          ],
                                                                        ));
                                                              },
                                                              icon: const Icon(
                                                                  Icons
                                                                      .help_outlined,
                                                                  size: 15,
                                                                  color: Colors
                                                                      .blue),
                                                            ),
                                                          ),
                                                          TextField(
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      r'[0-9]')),
                                                            ],
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller: widget
                                                                .textEditingFormacao[2],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 30,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 320,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        (this
                                                                    .widget
                                                                    .pontuacoes
                                                                    .asMap()
                                                                    .containsKey(
                                                                        1) &&
                                                                this
                                                                    .widget
                                                                    .pontuacoes[
                                                                        1]
                                                                    .pontuacaoAtributo
                                                                    .asMap()
                                                                    .containsKey(
                                                                        2))
                                                            ? widget
                                                                .pontuacoes[1]
                                                                .pontuacaoAtributo[
                                                                    2]
                                                                .nome
                                                            : "Carregando...",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      constraints:
                                                          BoxConstraints(
                                                              minHeight: 40),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            alignment: Alignment
                                                                .topRight,
                                                            height: 10,
                                                            width: 50,
                                                            child: IconButton(
                                                              onPressed: () {
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder: (_) =>
                                                                        AlertDialog(
                                                                          title:
                                                                              Text(
                                                                            "M??ximo de pontos:",
                                                                          ),
                                                                          content: Text((this.widget.pontuacoes.asMap().containsKey(1) && this.widget.pontuacoes[1].pontuacaoAtributo.asMap().containsKey(2))
                                                                              ? "O m??ximo de pontos para este atributo ?? ${widget.pontuacoes[1].pontuacaoAtributo[2].quantidade_maxima}."
                                                                              : "Carregando..."),
                                                                          actions: [
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                child: Text('Ok')),
                                                                          ],
                                                                        ));
                                                              },
                                                              icon: const Icon(
                                                                  Icons
                                                                      .help_outlined,
                                                                  size: 15,
                                                                  color: Colors
                                                                      .blue),
                                                            ),
                                                          ),
                                                          TextField(
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      r'[0-9]')),
                                                            ],
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller: widget
                                                                .textEditingExperiencia[2],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        IntrinsicHeight(
                                          child: Container(
                                            constraints:
                                                BoxConstraints(maxHeight: 100),
                                            child: Row(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 209,
                                                    ),
                                                    SizedBox(
                                                      width: 30,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 320,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        (this
                                                                    .widget
                                                                    .pontuacoes
                                                                    .asMap()
                                                                    .containsKey(
                                                                        2) &&
                                                                this
                                                                    .widget
                                                                    .pontuacoes[
                                                                        2]
                                                                    .pontuacaoAtributo
                                                                    .asMap()
                                                                    .containsKey(
                                                                        3))
                                                            ? widget
                                                                .pontuacoes[2]
                                                                .pontuacaoAtributo[
                                                                    3]
                                                                .nome
                                                            : "Carregando...",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      constraints:
                                                          BoxConstraints(
                                                              minHeight: 40),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            alignment: Alignment
                                                                .topRight,
                                                            height: 10,
                                                            width: 50,
                                                            child: IconButton(
                                                              onPressed: () {
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder: (_) =>
                                                                        AlertDialog(
                                                                          title:
                                                                              Text(
                                                                            "M??ximo de pontos:",
                                                                          ),
                                                                          content: Text((this.widget.pontuacoes.asMap().containsKey(2) && this.widget.pontuacoes[2].pontuacaoAtributo.asMap().containsKey(3))
                                                                              ? "O m??ximo de pontos para este atributo ?? ${widget.pontuacoes[2].pontuacaoAtributo[3].quantidade_maxima}."
                                                                              : "Carregando..."),
                                                                          actions: [
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                child: Text('Ok')),
                                                                          ],
                                                                        ));
                                                              },
                                                              icon: const Icon(
                                                                  Icons
                                                                      .help_outlined,
                                                                  size: 15,
                                                                  color: Colors
                                                                      .blue),
                                                            ),
                                                          ),
                                                          TextField(
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      r'[0-9]')),
                                                            ],
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller: widget
                                                                .textEditingFormacao[3],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 30,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 320,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        (this
                                                                    .widget
                                                                    .pontuacoes
                                                                    .asMap()
                                                                    .containsKey(
                                                                        1) &&
                                                                this
                                                                    .widget
                                                                    .pontuacoes[
                                                                        1]
                                                                    .pontuacaoAtributo
                                                                    .asMap()
                                                                    .containsKey(
                                                                        3))
                                                            ? widget
                                                                .pontuacoes[1]
                                                                .pontuacaoAtributo[
                                                                    3]
                                                                .nome
                                                            : "Carregando...",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      constraints:
                                                          BoxConstraints(
                                                              minHeight: 40),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            alignment: Alignment
                                                                .topRight,
                                                            height: 10,
                                                            width: 50,
                                                            child: IconButton(
                                                              onPressed: () {
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder: (_) =>
                                                                        AlertDialog(
                                                                          title:
                                                                              Text(
                                                                            "M??ximo de pontos:",
                                                                          ),
                                                                          content: Text((this.widget.pontuacoes.asMap().containsKey(1) && this.widget.pontuacoes[1].pontuacaoAtributo.asMap().containsKey(3))
                                                                              ? "O m??ximo de pontos para este atributo ?? ${widget.pontuacoes[1].pontuacaoAtributo[3].quantidade_maxima}."
                                                                              : "Carregando..."),
                                                                          actions: [
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                child: Text('Ok')),
                                                                          ],
                                                                        ));
                                                              },
                                                              icon: const Icon(
                                                                  Icons
                                                                      .help_outlined,
                                                                  size: 15,
                                                                  color: Colors
                                                                      .blue),
                                                            ),
                                                          ),
                                                          TextField(
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      r'[0-9]')),
                                                            ],
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller: widget
                                                                .textEditingExperiencia[3],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        IntrinsicHeight(
                                          child: Container(
                                            constraints:
                                                BoxConstraints(maxHeight: 100),
                                            child: Row(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 209,
                                                      decoration: BoxDecoration(
                                                        color: Colors.blue[200],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        (this
                                                                .widget
                                                                .pontuacoes
                                                                .asMap()
                                                                .containsKey(0))
                                                            ? widget
                                                                .pontuacoes[0]
                                                                .nome
                                                            : "Carregando...",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 30,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 320,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        (this
                                                                    .widget
                                                                    .pontuacoes
                                                                    .asMap()
                                                                    .containsKey(
                                                                        2) &&
                                                                this
                                                                    .widget
                                                                    .pontuacoes[
                                                                        2]
                                                                    .pontuacaoAtributo
                                                                    .asMap()
                                                                    .containsKey(
                                                                        4))
                                                            ? widget
                                                                .pontuacoes[2]
                                                                .pontuacaoAtributo[
                                                                    4]
                                                                .nome
                                                            : "Carregando...",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      constraints:
                                                          BoxConstraints(
                                                              minHeight: 40),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            alignment: Alignment
                                                                .topRight,
                                                            height: 10,
                                                            width: 50,
                                                            child: IconButton(
                                                              onPressed: () {
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder: (_) =>
                                                                        AlertDialog(
                                                                          title:
                                                                              Text(
                                                                            "M??ximo de pontos:",
                                                                          ),
                                                                          content: Text((this.widget.pontuacoes.asMap().containsKey(2) && this.widget.pontuacoes[2].pontuacaoAtributo.asMap().containsKey(4))
                                                                              ? "O m??ximo de pontos para este atributo ?? ${widget.pontuacoes[2].pontuacaoAtributo[4].quantidade_maxima}."
                                                                              : "Carregando..."),
                                                                          actions: [
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                child: Text('Ok')),
                                                                          ],
                                                                        ));
                                                              },
                                                              icon: const Icon(
                                                                  Icons
                                                                      .help_outlined,
                                                                  size: 15,
                                                                  color: Colors
                                                                      .blue),
                                                            ),
                                                          ),
                                                          TextField(
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      r'[0-9]')),
                                                            ],
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller: widget
                                                                .textEditingFormacao[4],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 402,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        IntrinsicHeight(
                                          child: Container(
                                            constraints:
                                                BoxConstraints(maxHeight: 100),
                                            child: Row(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 103.5,
                                                          height: 19,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "Quantidade",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 8.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 103.5,
                                                          height: 35,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      r'[0-9]')),
                                                            ],
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller: widget
                                                                .textEditingAssiduidade[0],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 8.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 103.5,
                                                          height: 19,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "Limite",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 8.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 103.5,
                                                          height: 35,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            (this
                                                                        .widget
                                                                        .pontuacoes
                                                                        .asMap()
                                                                        .containsKey(
                                                                            0) &&
                                                                    this
                                                                        .widget
                                                                        .pontuacoes[
                                                                            0]
                                                                        .pontuacaoAtributo
                                                                        .asMap()
                                                                        .containsKey(
                                                                            0))
                                                                ? widget
                                                                    .pontuacoes[
                                                                        0]
                                                                    .pontuacaoAtributo[
                                                                        0]
                                                                    .quantidade_maxima
                                                                    .toString()
                                                                : "...",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 8.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 30,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 320,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        (this
                                                                    .widget
                                                                    .pontuacoes
                                                                    .asMap()
                                                                    .containsKey(
                                                                        2) &&
                                                                this
                                                                    .widget
                                                                    .pontuacoes[
                                                                        2]
                                                                    .pontuacaoAtributo
                                                                    .asMap()
                                                                    .containsKey(
                                                                        5))
                                                            ? widget
                                                                .pontuacoes[2]
                                                                .pontuacaoAtributo[
                                                                    5]
                                                                .nome
                                                            : "Carregando...",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      constraints:
                                                          BoxConstraints(
                                                              minHeight: 40),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            alignment: Alignment
                                                                .topRight,
                                                            height: 10,
                                                            width: 50,
                                                            child: IconButton(
                                                              onPressed: () {
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder: (_) =>
                                                                        AlertDialog(
                                                                          title:
                                                                              Text(
                                                                            "M??ximo de pontos:",
                                                                          ),
                                                                          content: Text((this.widget.pontuacoes.asMap().containsKey(2) && this.widget.pontuacoes[2].pontuacaoAtributo.asMap().containsKey(5))
                                                                              ? "O m??ximo de pontos para este atributo ?? ${widget.pontuacoes[2].pontuacaoAtributo[5].quantidade_maxima}"
                                                                              : "Carregando..."),
                                                                          actions: [
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                child: Text('Ok')),
                                                                          ],
                                                                        ));
                                                              },
                                                              icon: const Icon(
                                                                  Icons
                                                                      .help_outlined,
                                                                  size: 15,
                                                                  color: Colors
                                                                      .blue),
                                                            ),
                                                          ),
                                                          TextField(
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      r'[0-9]')),
                                                            ],
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller: widget
                                                                .textEditingFormacao[5],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 402,
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: ind == 0 ? 10 : 5,
                            height: ind == 0 ? 10 : 5,
                            margin: EdgeInsets.symmetric(
                                horizontal: mediaQuery.width * 0.01),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color:
                                    ind == 0 ? Colors.blue : Colors.grey[300]),
                            child: OutlinedButton(
                              onPressed: () {
                                scrollTo(0);
                              },
                              child: Text("teste"),
                            )),
                        Container(
                            width: ind == 1 ? 10 : 5,
                            height: ind == 1 ? 10 : 5,
                            margin: EdgeInsets.symmetric(
                                horizontal: mediaQuery.width * 0.01),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color:
                                    ind == 1 ? Colors.blue : Colors.grey[300]),
                            child: OutlinedButton(
                              onPressed: () {
                                scrollTo(1);
                              },
                              child: Text("teste"),
                            )),
                      ],
                    )
                  ]),
            ),
          ],
        ),
      );
    });
  }
}

class Simulador extends StatefulWidget {
  double valor;
  List<Cargo> cargos;
  List<Pontuacao> pontuacoes;
  List<TextEditingController> textEditingFormacao;
  List<TextEditingController> textEditingExperiencia;
  List<TextEditingController> textEditingAssiduidade;

  var valueNotifierTitulo = ValueNotifier('');
  var valueNotifierTempo = ValueNotifier('');
  TextEditingController resultado;
  TextEditingController resultadoFaixaSalarial;
  Simulador(
      {Key? key,
      required this.valor,
      required this.cargos,
      required this.pontuacoes,
      required this.textEditingFormacao,
      required this.textEditingExperiencia,
      required this.textEditingAssiduidade,
      required this.resultado,
      required this.resultadoFaixaSalarial})
      : super(key: key);
  @override
  @override
  State<StatefulWidget> createState() {
    return _SimuladorState(this.valor);
  }
}

class TitleSimulador extends StatelessWidget {
  TitleSimulador({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AutoSizeText(
      "Simulador",
      textAlign: TextAlign.start,
      maxLines: 2,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 30.0,
        fontWeight: FontWeight.w900,
        fontFamily: 'Santana',
      ),
    );
  }
}

class BotaoVoltar extends StatelessWidget {
  BotaoVoltar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        paginaS = 0;
        Navigator.pushNamed(context, '/sistema');
      },
      child: Container(
        alignment: Alignment.center,
        width: 110.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_back_ios, color: Colors.white, size: 30.0),
            Text(
              "VOLTAR",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
