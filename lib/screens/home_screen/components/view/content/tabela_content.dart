import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Cargo.dart';
import 'package:gip_solucoes/screens/home_screen/components/controller/sistema_content.dart';

List<bool> verificadoresCargo = [];
List<List<bool>> verificadoresIntervalo = [];
List<List<bool>> verificadoresValor = [];
final keyTabela = GlobalKey<_StateTabela>();

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

class Tabela extends StatefulWidget {
  double valor;
  double quantidadeFaixas;
  List<int> deletados = [];
  List<int> adicionados = [];

  List<TextEditingController> textEditingCargos;
  List<List<TextEditingController>> textEditingIntervalos;
  List<List<TextEditingController>> textEditingValores;

  Tabela(
      {Key? key,
      required this.valor,
      required this.quantidadeFaixas,
      required this.textEditingCargos,
      required this.textEditingIntervalos,
      required this.textEditingValores})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _StateTabela(this.valor);
  }
}

class TitleTabela extends StatelessWidget {
  TitleTabela({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AutoSizeText(
      "Tabela Salarial",
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
        paginaS = 4;
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

class BotaoSalvar extends StatefulWidget {
  String instituicao;
  List<Cargo> display_list_cargos;
  BotaoSalvar(
      {Key? key, required this.instituicao, required this.display_list_cargos})
      : super(key: key);

  @override
  State<BotaoSalvar> createState() => _BotaoSalvarState();
}

class _BotaoSalvarState extends State<BotaoSalvar> {
  salvar() {
    CollectionReference cargos = FirebaseFirestore.instance.collection('Cargo');
    cargos
        .where('instituicao', isEqualTo: widget.instituicao)
        .orderBy('grau')
        .get()
        .then((QuerySnapshot q) {
      int contar = 0;
      int contarAlterar = 0;
      q.docs.forEach((element) {
        var e = element.reference;
        if (keyTabela
            .currentState!.widget.textEditingCargos[contar].text.isNotEmpty) {
          e.update({
            "nome":
                keyTabela.currentState!.widget.textEditingCargos[contar].text
          });
        }

        CollectionReference faixas = e.collection('FaixaSalarial');
        if (keyTabela.currentState!.widget.adicionados.isNotEmpty) {
          faixas.add({
            "final_intervalo": double.parse(keyTabela
                .currentState!
                .widget
                .textEditingIntervalos[contar]
                    [keyTabela.currentState!.widget.adicionados[0]]
                .text
                .replaceAll(',', '.')),
            "valor": double.parse(keyTabela
                .currentState!
                .widget
                .textEditingValores[contar]
                    [keyTabela.currentState!.widget.adicionados[0]]
                .text
                .replaceAll(',', '.')),
          });
        }
        contar++;
        faixas.orderBy('final_intervalo').get().then((QuerySnapshot q) {
          if (keyTabela.currentState!.widget.deletados.isNotEmpty) {
            int contadorRemover = 0;
            q.docs.forEach((elementt) {
              if (contadorRemover ==
                  keyTabela.currentState!.widget.deletados[0]) {
                var ee = elementt.reference;
                ee.delete();
              }
              contadorRemover++;
            });
          }
          int contadorAlterar = 0;

          q.docs.forEach((elementt) {
            var eee = elementt.reference;
            if (keyTabela
                .currentState!
                .widget
                .textEditingIntervalos[contarAlterar][contadorAlterar]
                .text
                .isNotEmpty) {
              eee.update({
                "final_intervalo": double.parse(keyTabela.currentState!.widget
                    .textEditingIntervalos[contarAlterar][contadorAlterar].text
                    .replaceAll(',', '.'))
              });
            }
            if (keyTabela
                .currentState!
                .widget
                .textEditingValores[contarAlterar][contadorAlterar]
                .text
                .isNotEmpty) {
              eee.update({
                "valor": double.parse(keyTabela.currentState!.widget
                    .textEditingValores[contarAlterar][contadorAlterar].text
                    .replaceAll(',', '.'))
              });
            }
            contadorAlterar++;
          });
          contarAlterar++;
        });
      });
    }).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(e),
        duration: Duration(seconds: 5),
      ));
    });
    bool verificador_vazios = false;
    keyTabela.currentState!.widget.textEditingCargos.forEach((element) {
      if (element.text.isEmpty) verificador_vazios = true;
    });
    keyTabela.currentState!.widget.textEditingIntervalos.forEach((element) {
      element.forEach((elementt) {
        if (elementt.text.isEmpty) verificador_vazios = true;
      });
    });
    keyTabela.currentState!.widget.textEditingValores.forEach((element) {
      element.forEach((elementt) {
        if (elementt.text.isEmpty) verificador_vazios = true;
      });
    });
    if (verificador_vazios == true) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text("Preencha todos os campo para poder salvar!"),
        duration: Duration(seconds: 5),
      ));
    } else {
      bool verificador_alteracao = false;
      verificadoresCargo.forEach((element) {
        if (element == true) verificador_alteracao = true;
      });
      verificadoresIntervalo.forEach((element) {
        element.forEach((elementt) {
          if (elementt == true) verificador_alteracao = true;
        });
      });
      verificadoresValor.forEach((element) {
        element.forEach((elementt) {
          if (elementt == true) verificador_alteracao = true;
        });
      });
      if (verificador_alteracao == false &&
          keyTabela.currentState!.widget.adicionados.isEmpty &&
          keyTabela.currentState!.widget.deletados.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text("Nenhum dado foi alterado!"),
          duration: Duration(seconds: 5),
        ));
      } else {
        for (int i = 0; i < widget.display_list_cargos.length;i++)
          pegar_id_cargo(i);
        paginaS = 0;
        Navigator.pushNamed(context, '/sistema');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text("Dados salvos com sucesso!"),
          duration: Duration(seconds: 5),
        ));
      }
    }
  }

  pegar_id_cargo(int index) {
    CollectionReference cargosS =
        FirebaseFirestore.instance.collection('Cargo');
    cargosS
        .where('instituicao', isEqualTo: widget.instituicao)
        .orderBy('grau')
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((elementt) {
        if (widget.display_list_cargos[index].titulo == elementt['titulo']) {
          DocumentReference _documentReference = elementt.reference;
          get_salario_ideal(index, _documentReference.id);
        }
      });
    });
  }

  Future<void> alterar_usuarios(int index, double valor) async {
    CollectionReference usuarios =
        FirebaseFirestore.instance.collection('Usuario');
    DocumentSnapshot u =
        await usuarios.doc(widget.display_list_cargos[index].usuario_id).get();
    var reference = u.reference;
    reference.update({"salario_ideal": valor});
  }

  Future<void> get_salario_ideal(int index, String cargoP) async {
    CollectionReference cargos = FirebaseFirestore.instance.collection('Cargo');
    String string_cargo = cargoP;
    DocumentSnapshot carg = await cargos.doc(string_cargo).get();
    CollectionReference faixassalarias =
        carg.reference.collection('FaixaSalarial');
    faixassalarias
        .orderBy('final_intervalo', descending: true)
        .get()
        .then((QuerySnapshot q) {
      int contador = 0;

      q.docs.forEach((element) {
        if (contador == 0) {
          alterar_usuarios(index, element['valor']);
        } else if (element['final_intervalo'] >=
            widget.display_list_cargos[index].pontuacao) {
          alterar_usuarios(index, element['valor']);
        }

        contador++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        salvar();
      },
      child: Container(
        alignment: Alignment.center,
        width: 110.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_back_ios, color: Colors.white, size: 30.0),
            Text(
              "SALVAR",
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

class BotaoCargos extends StatelessWidget {
  BotaoCargos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        paginaS = 4;
        Navigator.pushNamed(context, '/sistema');
      },
      child: Container(
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
            Icon(Icons.shopping_bag, color: Colors.white, size: 15.0),
            Text(
              " DADOS DOS CARGOS",
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

class BotaoNovafaixasalarial extends StatefulWidget {
  BotaoNovafaixasalarial({
    Key? key,
  }) : super(key: key);

  @override
  State<BotaoNovafaixasalarial> createState() => _BotaoNovafaixasalarialState();
}

class _BotaoNovafaixasalarialState extends State<BotaoNovafaixasalarial> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (keyTabela.currentState!.widget.adicionados.isNotEmpty ||
            keyTabela.currentState!.widget.deletados.isNotEmpty) {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text(
                      "Uma adição por vez!",
                    ),
                    content: Text(
                        "Você já removeu/adicionou uma faixa. Por favor, salve as alterações para adicionar outra faixa."),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Ok')),
                    ],
                  ));
        } else {
          TextEditingController textEditingBase = TextEditingController();
          List<TextEditingController> textEditingControllerInterv = [];
          List<TextEditingController> textEditingControllerVal = [];
          keyTabela.currentState!.widget.textEditingCargos.forEach(
            (element) {
              textEditingControllerInterv.add(TextEditingController());
              textEditingControllerVal.add(TextEditingController());
            },
          );
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text(
                      "Nova faixa salarial",
                    ),
                    content: Column(
                      children: [
                        Container(
                            height: 450,
                            width: 500,
                            child: ListView.builder(
                                itemCount: keyTabela.currentState!.widget
                                    .textEditingCargos.length,
                                itemBuilder: (context, index) => Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          keyTabela.currentState!.widget
                                              .textEditingCargos[index].text,
                                        ),
                                        Row(
                                          children: [
                                            Text("Final do intervalo: "),
                                            Flexible(
                                              child: TextField(
                                                  inputFormatters: <
                                                      TextInputFormatter>[
                                                    FilteringTextInputFormatter
                                                        .allow(RegExp(
                                                            r'[0-9]+[,.]{0,1}[0-9]*')),
                                                    TextInputFormatter
                                                        .withFunction(
                                                      (oldValue, newValue) =>
                                                          newValue.copyWith(
                                                        text: newValue.text
                                                            .replaceAll(
                                                                '.', ','),
                                                      ),
                                                    ),
                                                  ],
                                                  controller:
                                                      textEditingControllerInterv
                                                              .asMap()
                                                              .containsKey(
                                                                  index)
                                                          ? textEditingControllerInterv[
                                                              index]
                                                          : textEditingBase),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Valor: "),
                                            Flexible(
                                              child: TextField(
                                                  inputFormatters: <
                                                      TextInputFormatter>[
                                                    FilteringTextInputFormatter
                                                        .allow(RegExp(
                                                            r'[0-9]+[,.]{0,1}[0-9]*')),
                                                    TextInputFormatter
                                                        .withFunction(
                                                      (oldValue, newValue) =>
                                                          newValue.copyWith(
                                                        text: newValue.text
                                                            .replaceAll(
                                                                '.', ','),
                                                      ),
                                                    ),
                                                  ],
                                                  controller:
                                                      textEditingControllerVal
                                                              .asMap()
                                                              .containsKey(
                                                                  index)
                                                          ? textEditingControllerVal[
                                                              index]
                                                          : textEditingBase),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )))
                      ],
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancelar')),
                      TextButton(
                          onPressed: () {
                            int contt = 0;
                            keyTabela.currentState!.widget.textEditingIntervalos
                                .forEach((element) {
                              setState(() {
                                element.add(textEditingControllerInterv[contt]);
                              });

                              contt++;
                            });
                            contt = 0;
                            keyTabela.currentState!.widget.textEditingValores
                                .forEach((element) {
                              setState(() {
                                element.add(textEditingControllerVal[contt]);
                              });

                              contt++;
                            });
                            keyTabela.currentState!
                                .aumentar_quantidade_faixas();
                            keyTabela.currentState!.adicionar_faixa((keyTabela
                                    .currentState!
                                    .widget
                                    .textEditingValores[0]
                                    .length -
                                1));
                            Navigator.of(context).pop();
                          },
                          child: Text('Ok')),
                    ],
                  ));
        }
      },
      child: Container(
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
            Icon(Icons.add_circle, color: Colors.white, size: 15.0),
            Text(
              " NOVA FAIXA SALARIAL",
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

class _StateTabela extends State<Tabela> {
  void aumentar_quantidade_faixas() {
    setState(() {
      widget.quantidadeFaixas++;
    });
  }

  void adicionar_faixa(int indice) {
    setState(
      () {
        widget.adicionados.add(indice);
      },
    );
  }

  double valor = 0.63;
  _StateTabela(double valor) {
    this.valor = valor;
  }
  final List<GlobalKey> categorias = [
    GlobalKey(),
    GlobalKey(),
  ];
  int ind = 0;
  late ScrollController scrollCont;
  BuildContext? tabContext;
  double mediaQueryx = 0;

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
    super.initState();
  }

  changeTabs() {
    late RenderBox box;
    for (var i = 0; i < categorias.length; i++) {
      box = categorias[i].currentContext!.findRenderObject() as RenderBox;
      Offset position = box.localToGlobal(Offset.zero);
      if (scrollCont.offset >= (position.dx - (mediaQueryx * 0.15)))
        setState(() {
          ind = i;
        });
    }
  }

  static List<TextEditingController> controller = [
    TextEditingController(text: "Professor Graduado"),
    TextEditingController(text: "Professor Especialista"),
    TextEditingController(text: "Professor Mestre"),
    TextEditingController(text: "Professor Doutor"),
    TextEditingController(text: "Professor Livre Docente"),
  ];
  static List<TextEditingController> controllerlinha1 = [
    TextEditingController(text: "0"),
    TextEditingController(text: "10"),
    TextEditingController(text: "20"),
    TextEditingController(text: "30"),
    TextEditingController(text: "40"),
    TextEditingController(text: "50"),
  ];
  double linha11 = double.parse(controllerlinha1[1].text) + 1;
  double linha12 = double.parse(controllerlinha1[2].text) + 1;
  double linha13 = double.parse(controllerlinha1[3].text) + 1;
  double linha14 = double.parse(controllerlinha1[4].text) + 1;
  static List<TextEditingController> controllerlinha2 = [
    TextEditingController(text: "50"),
    TextEditingController(text: "60"),
    TextEditingController(text: "70"),
    TextEditingController(text: "80"),
    TextEditingController(text: "90"),
    TextEditingController(text: "100"),
  ];
  double linha21 = double.parse(controllerlinha2[1].text) + 1;
  double linha22 = double.parse(controllerlinha2[2].text) + 1;
  double linha23 = double.parse(controllerlinha2[3].text) + 1;
  double linha24 = double.parse(controllerlinha2[4].text) + 1;
  static List<TextEditingController> controllerlinha3 = [
    TextEditingController(text: "100"),
    TextEditingController(text: "110"),
    TextEditingController(text: "120"),
    TextEditingController(text: "130"),
    TextEditingController(text: "140"),
    TextEditingController(text: "150"),
  ];
  double linha31 = double.parse(controllerlinha3[1].text) + 1;
  double linha32 = double.parse(controllerlinha3[2].text) + 1;
  double linha33 = double.parse(controllerlinha3[3].text) + 1;
  double linha34 = double.parse(controllerlinha3[4].text) + 1;
  static List<TextEditingController> controllerlinha4 = [
    TextEditingController(text: "150"),
    TextEditingController(text: "160"),
    TextEditingController(text: "170"),
    TextEditingController(text: "180"),
    TextEditingController(text: "190"),
    TextEditingController(text: "200"),
  ];
  double linha41 = double.parse(controllerlinha4[1].text) + 1;
  double linha42 = double.parse(controllerlinha4[2].text) + 1;
  double linha43 = double.parse(controllerlinha4[3].text) + 1;
  double linha44 = double.parse(controllerlinha4[4].text) + 1;

  static List<TextEditingController> controllerlinha5 = [
    TextEditingController(text: "200"),
    TextEditingController(text: "210"),
    TextEditingController(text: "220"),
    TextEditingController(text: "230"),
    TextEditingController(text: "240"),
    TextEditingController(text: "250"),
  ];
  double linha51 = double.parse(controllerlinha5[1].text) + 1;
  double linha52 = double.parse(controllerlinha5[2].text) + 1;
  double linha53 = double.parse(controllerlinha5[3].text) + 1;
  double linha54 = double.parse(controllerlinha5[4].text) + 1;

  static List<TextEditingController> controllerlinha11 = [
    TextEditingController(text: "45,71"),
    TextEditingController(text: "47,49"),
    TextEditingController(text: "49,34"),
    TextEditingController(text: "51,26"),
    TextEditingController(text: "53,26"),
    TextEditingController(text: "55,34"),
  ];
  static List<TextEditingController> controllerlinha22 = [
    TextEditingController(text: "53,26"),
    TextEditingController(text: "55,34"),
    TextEditingController(text: "57,50"),
    TextEditingController(text: "62,07"),
    TextEditingController(text: "64,49"),
    TextEditingController(text: "67,01"),
  ];
  static List<TextEditingController> controllerlinha33 = [
    TextEditingController(text: "62,07"),
    TextEditingController(text: "64,49"),
    TextEditingController(text: "67,01"),
    TextEditingController(text: "69,62"),
    TextEditingController(text: "72,34"),
    TextEditingController(text: "75,16"),
  ];
  static List<TextEditingController> controllerlinha44 = [
    TextEditingController(text: "72,34"),
    TextEditingController(text: "75,16"),
    TextEditingController(text: "78,09"),
    TextEditingController(text: "81,13"),
    TextEditingController(text: "84,30"),
    TextEditingController(text: "87,59"),
  ];
  static List<TextEditingController> controllerlinha55 = [
    TextEditingController(text: "84,30"),
    TextEditingController(text: "87,59"),
    TextEditingController(text: "91,00"),
    TextEditingController(text: "94,55"),
    TextEditingController(text: "98,24"),
    TextEditingController(text: "102,07"),
  ];

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

  bool verificar(int index) {
    bool verificador = true;
    widget.adicionados.forEach((element) {
      print(element);
      if (index == element) verificador = false;
    });
    return verificador;
  }

  @override
  Widget build(BuildContext context) {
    int quantidadel = 2;
    final mediaQuery = MediaQuery.of(context).size;
    mediaQueryx = mediaQuery.width;
    return Builder(builder: (BuildContext context) {
      tabContext = context;
      return Container(
        height: 400,
        width: (mediaQuery.width * valor) + (mediaQuery.width * 0.02),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: (mediaQuery.width * valor),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        width: 209.0,
                                        height: 50.0,
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
                                              "Nome do cargo",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 2,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            width: widget.quantidadeFaixas != 0
                                                ? ((132 *
                                                        widget
                                                            .quantidadeFaixas) -
                                                    2)
                                                : (132 *
                                                    widget.quantidadeFaixas),
                                            height: 22.0,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  textAlign: TextAlign.center,
                                                  "Faixas de Salário",
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
                                            height: 2,
                                          ),
                                          Container(
                                              height: 30,
                                              width: (132 *
                                                  widget.quantidadeFaixas),
                                              child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: widget
                                                    .quantidadeFaixas
                                                    .round(),
                                                itemBuilder: (context, index) =>
                                                    Row(
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 130.0,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.blue[300],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          verificar((index)) ==
                                                                  true
                                                              ? Text(
                                                                  conversor(
                                                                      index),
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
                                                                )
                                                              : Text(
                                                                  "-",
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
                                                                )
                                                        ],
                                                      ),
                                                    ),
                                                    if (index !=
                                                        (widget.quantidadeFaixas -
                                                            1))
                                                      SizedBox(
                                                        width: 2,
                                                      )
                                                  ],
                                                ),
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  widget.textEditingCargos.length == 0
                                      ? Container(
                                          height: 250,
                                          width:
                                              (mediaQuery.width * this.valor) -
                                                  211,
                                          child: Center(
                                              child: Text("Carregando...")))
                                      : Container(
                                          height: 250,
                                          width: 209 +
                                              ((132 * widget.quantidadeFaixas)),
                                          child: ListView.builder(
                                            itemCount:
                                                widget.textEditingCargos.length,
                                            itemBuilder: (context, index) =>
                                                Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 2),
                                              child: Container(
                                                constraints: BoxConstraints(
                                                    maxHeight: 96),
                                                child: IntrinsicHeight(
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        constraints:
                                                            BoxConstraints(
                                                                maxHeight: 96),
                                                        width: 209.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        child: TextField(
                                                          onChanged: (value) {
                                                            verificadoresCargo[
                                                                index] = true;
                                                          },
                                                          maxLines: null,
                                                          controller: widget
                                                                  .textEditingCargos[
                                                              index],
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 250,
                                                        width: (132 *
                                                            widget
                                                                .quantidadeFaixas),
                                                        child: ListView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount: widget
                                                              .quantidadeFaixas
                                                              .round(),
                                                          itemBuilder: (context,
                                                                  indexx) =>
                                                              Container(
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                                    2, 0, 0, 0),
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  child: Container(
                                                                      alignment: Alignment.center,
                                                                      width: 130,
                                                                      decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .grey[400],
                                                                        borderRadius:
                                                                            BorderRadius.circular(5.0),
                                                                      ),
                                                                      child: Row(
                                                                        children: [
                                                                          indexx == 0
                                                                              ? Text(
                                                                                  "  DE 0 A ",
                                                                                  style: TextStyle(
                                                                                    color: Colors.black,
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                )
                                                                              : verificar((indexx)) == true
                                                                                  ? Text(
                                                                                      "  DE ${widget.textEditingIntervalos[index][indexx - 1].text} A ",
                                                                                      style: TextStyle(
                                                                                        color: Colors.black,
                                                                                        fontSize: 16.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                    )
                                                                                  : Text(
                                                                                      "  DE - A ",
                                                                                      style: TextStyle(
                                                                                        color: Colors.black,
                                                                                        fontSize: 16.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                    ),
                                                                          Flexible(
                                                                            child:
                                                                                TextField(
                                                                              inputFormatters: <TextInputFormatter>[
                                                                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]+[,.]{0,1}[0-9]*')),
                                                                                TextInputFormatter.withFunction(
                                                                                  (oldValue, newValue) => newValue.copyWith(
                                                                                    text: newValue.text.replaceAll('.', ','),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                              controller: widget.textEditingIntervalos[index][indexx],
                                                                              maxLines: 1,
                                                                              style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: 16.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                              onChanged: (value) => {
                                                                                setState(
                                                                                  () {
                                                                                    verificadoresIntervalo[index][indexx] = true;
                                                                                    if (indexx != 0) {
                                                                                      widget.textEditingIntervalos[index][indexx];
                                                                                    }
                                                                                  },
                                                                                )
                                                                              },
                                                                            ),
                                                                          )
                                                                        ],
                                                                      )),
                                                                ),
                                                                Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  width: 130,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0),
                                                                  ),
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        "R\$ ",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              16.0,
                                                                        ),
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            TextField(
                                                                          onChanged:
                                                                              (value) {
                                                                            verificadoresValor[index][indexx] =
                                                                                true;
                                                                          },
                                                                          inputFormatters: <
                                                                              TextInputFormatter>[
                                                                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]+[,.]{0,1}[0-9]*')),
                                                                            TextInputFormatter.withFunction(
                                                                              (oldValue, newValue) => newValue.copyWith(
                                                                                text: newValue.text.replaceAll('.', ','),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          controller:
                                                                              widget.textEditingValores[index][indexx],
                                                                          maxLines:
                                                                              1,
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 211.0,
                                        height: 20,
                                      ),
                                      Container(
                                          height: 30,
                                          width:
                                              (132 * widget.quantidadeFaixas),
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: widget.quantidadeFaixas
                                                  .round(),
                                              itemBuilder:
                                                  (context, indexx) =>
                                                      Row(children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 130,
                                                          child: IconButton(
                                                            icon: const Icon(
                                                                Icons.cancel),
                                                            color: Colors.red,
                                                            onPressed: () {
                                                              if (widget
                                                                      .adicionados
                                                                      .isEmpty &&
                                                                  widget
                                                                      .deletados
                                                                      .isEmpty) {
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder: (_) =>
                                                                        AlertDialog(
                                                                          title:
                                                                              Text(
                                                                            "Confirmação de remoção",
                                                                          ),
                                                                          content:
                                                                              Text("Tem certeza que deseja remover esta faixa de salário? (É necessário clicar em \"Ok\" e em seguida clicar em \"SALVAR\" para confirmar a remoção.)"),
                                                                          actions: [
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                child: Text('Cancelar')),
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  setState(() {
                                                                                    widget.deletados.add(indexx);
                                                                                    widget.quantidadeFaixas--;
                                                                                    widget.textEditingIntervalos.forEach((element) {
                                                                                      element.removeAt(indexx);
                                                                                    });
                                                                                    widget.textEditingValores.forEach((element) {
                                                                                      element.removeAt(indexx);
                                                                                    });
                                                                                  });
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                child: Text('Ok')),
                                                                          ],
                                                                        ));
                                                              } else {
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder: (_) =>
                                                                        AlertDialog(
                                                                          title:
                                                                              Text(
                                                                            "Uma remoção por vez!",
                                                                          ),
                                                                          content:
                                                                              Text("Você já removeu/adicionou uma faixa, por favor, salve as alterações para remover outra faixa."),
                                                                          actions: [
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                child: Text('Ok')),
                                                                          ],
                                                                        ));
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                        if (indexx !=
                                                            widget
                                                                .quantidadeFaixas)
                                                          SizedBox(
                                                            width: 2,
                                                          ),
                                                      ]))),
                                    ],
                                  ), 
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            BotaoCargos(),
                            SizedBox(
                              width: 5,
                            ),
                            BotaoNovafaixasalarial(),
                          ],
                        ),
                      )
                    ])),
          ],
        ),
      );
    });
  }
}
