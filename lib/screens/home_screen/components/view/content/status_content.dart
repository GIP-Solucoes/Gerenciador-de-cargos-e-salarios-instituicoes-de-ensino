import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/pontuacoes_content.dart';
import 'package:gip_solucoes/screens/home_screen/components/controller/sistema_content.dart';

List<bool> verificadoresNome = [];
List<bool> vertificadoresTipo = [];
final keyStatus = GlobalKey<_StateStatus>();

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

class Status extends StatefulWidget {
  List<int> adicionados = [];
  List<int> deletados = [];
  List<TextEditingController> textEditingNomes;
  List<bool> textEditingTipos;
  String instituicao;
  double valor;
  Status(
      {Key? key,
      required this.valor,
      required this.instituicao,
      required this.textEditingNomes,
      required this.textEditingTipos})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _StateStatus(this.valor);
  }
}

class TitleStatus extends StatelessWidget {
  TitleStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AutoSizeText(
      "Status",
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
        paginaS = 5;
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
  BotaoSalvar({Key? key, required this.instituicao}) : super(key: key);

  @override
  State<BotaoSalvar> createState() => _BotaoSalvarState();
}

class _BotaoSalvarState extends State<BotaoSalvar> {
  salvar() {
    CollectionReference status =
        FirebaseFirestore.instance.collection('SituacaoAdmissional');
    if (keyStatus.currentState!.widget.adicionados.isNotEmpty) {
      keyStatus.currentState!.widget.adicionados.forEach((element) {
        status.add({
          "instituicao": keyStatus.currentState!.widget.instituicao,
          "calcula_valor":
              keyStatus.currentState!.widget.textEditingTipos[element],
          "nome": keyStatus.currentState!.widget.textEditingNomes[element].text,
        });
      });
    }
    status
        .where('instituicao', isEqualTo: widget.instituicao)
        .get()
        .then((QuerySnapshot q) {
      int contar = 0;
      int contarAlterar = 0;
      q.docs.forEach((element) {
        var e = element.reference;

        if (keyStatus.currentState!.widget.deletados.isNotEmpty) {
          int contadorRemover = 0;
          q.docs.forEach((elementt) {
            if (contadorRemover ==
                keyStatus.currentState!.widget.deletados[0]) {
              var ee = elementt.reference;
              ee.delete();
            }
            contadorRemover++;
          });
        }
        if (keyStatus
            .currentState!.widget.textEditingNomes[contar].text.isNotEmpty) {
          e.update({
            "nome":
                keyStatus.currentState!.widget.textEditingNomes[contar].text,
            "calcula_valor":
                keyStatus.currentState!.widget.textEditingTipos[contar]
          });
        }
        contar++;
      });
    }).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(e),
        duration: Duration(seconds: 5),
      ));
    });
    bool verificador_vazios = false;
    keyStatus.currentState!.widget.textEditingNomes.forEach((element) {
      if (element.text.isEmpty) verificador_vazios = true;
    });
    if (verificador_vazios == true) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text("Preencha todos os campo para poder salvar!"),
        duration: Duration(seconds: 5),
      ));
    } else {
      bool verificador_alteracao = false;
      verificadoresNome.forEach((element) {
        if (element == true) verificador_alteracao = true;
      });
      vertificadoresTipo.forEach((element) {
        if (element == true) verificador_alteracao = true;
      });
      if (verificador_alteracao == false &&
          keyStatus.currentState!.widget.adicionados.isEmpty &&
          keyStatus.currentState!.widget.deletados.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text("Nenhum dado foi alterado!"),
          duration: Duration(seconds: 5),
        ));
      } else {
        paginaS = 5;
        Navigator.pushNamed(context, '/sistema');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text("Dados salvos com sucesso!"),
          duration: Duration(seconds: 5),
        ));
      }
    }
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

class BotaoNovostatus extends StatefulWidget {
  BotaoNovostatus({
    Key? key,
  }) : super(key: key);

  @override
  State<BotaoNovostatus> createState() => _BotaoNovostatusState();
}

class _BotaoNovostatusState extends State<BotaoNovostatus> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (keyStatus.currentState!.widget.deletados.isNotEmpty) {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text(
                      "Uma remoção por vez!",
                    ),
                    content: Text(
                        "Você já removeu uma faixa. Por favor, salve as alterações para adicionar uma faixa."),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Ok')),
                    ],
                  ));
        } else {
          TextEditingController nome = TextEditingController();
          final dropValueCadastro = ValueNotifier('');
          List<String> dropOpcoes = ['Considera', 'Não considera'];
          bool tipo = true;
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text(
                      "Nova situação adminissional",
                    ),
                    content: Container(
                      height: 250,
                      width: 250,
                      child: Column(
                        children: [
                          Row(children: [
                            Text("Nome: "),
                            Flexible(
                              child: TextField(
                                controller: nome,
                              ),
                            ),
                          ]),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text("Tipo: "),
                              ValueListenableBuilder(
                                  valueListenable: dropValueCadastro,
                                  builder:
                                      (BuildContext context, String value, _) {
                                    return DropdownButton<String>(
                                      hint: Text(
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                          ),
                                          dropOpcoes[0]),
                                      value: (value.isEmpty) ? null : value,
                                      onChanged: (escolha) {
                                        dropValueCadastro.value =
                                            escolha.toString();
                                        setState(() {
                                          if (escolha.toString() ==
                                              'Considera') {
                                            tipo = true;
                                          } else {
                                            tipo = false;
                                          }
                                        });
                                      },
                                      items: dropOpcoes
                                          .map((op) => DropdownMenuItem(
                                                value: op,
                                                child: Text(op),
                                              ))
                                          .toList(),
                                    );
                                  }),
                            ],
                          )
                        ],
                      ),
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
                            keyStatus.currentState!.adicionar_status(keyStatus
                                .currentState!.widget.textEditingNomes.length);
                            setState(() {
                              keyStatus.currentState!.widget.textEditingNomes
                                  .add(TextEditingController(text: nome.text));
                              keyStatus.currentState!.widget.textEditingTipos
                                  .add(tipo);
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text('Ok')),
                    ],
                  ));
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 160.0,
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
              " NOVO STATUS",
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

class _StateStatus extends State<Status> {
  double valor = 0.63;

  void adicionar_status(int value) {
    setState(() {
      widget.adicionados.add(value);
    });
  }

  void deletar_status(int value) {
    setState(() {
      widget.deletados.add(value);
    });
  }

  _StateStatus(double valor) {
    this.valor = valor;
  }
  int ind = 0;
  late ScrollController scrollCont;
  BuildContext? tabContext;
  double mediaQueryx = 0;

  @override
  void initState() {
    super.initState();
  }

  static List<TextEditingController> controllercoluna1 = [
    TextEditingController(text: "Ativo"),
    TextEditingController(text: "Inativo"),
    TextEditingController(text: "Afastado"),
  ];
  final dropValueBase = ValueNotifier('');
  final dropOpcoes = [
    'Considera',
    'Não considera',
  ];

  @override
  Widget build(BuildContext context) {
    int quantidadel = 2;
    final mediaQuery = MediaQuery.of(context).size;
    mediaQueryx = mediaQuery.width;
    return Builder(builder: (BuildContext context) {
      tabContext = context;
      return Container(
        height: 400,
        width: 600,
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
                    vertical: 15.0, horizontal: mediaQuery.width * 0.01),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            constraints: BoxConstraints(maxWidth: 570),
                            width: valor,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 44,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            width: 209.0,
                                            height: 40.0,
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
                                                  "Nome",
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
                                          Container(
                                            alignment: Alignment.center,
                                            width: 150,
                                            height: 40.0,
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
                                                  "Tipo",
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
                                            width: 2,
                                          ),
                                          SizedBox(
                                            height: 40,
                                            width: 137,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Container(
                                          height: 250,
                                          width: 500,
                                          child: ListView.builder(
                                              itemCount: widget
                                                  .textEditingNomes.length,
                                              itemBuilder: (context, index) =>
                                                  IntrinsicHeight(
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
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
                                                              setState(() {
                                                                verificadoresNome[
                                                                        index] =
                                                                    true;
                                                              });
                                                            },
                                                            maxLines: null,
                                                            controller: widget
                                                                    .textEditingNomes[
                                                                index],
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width: 150,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
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
                                                                ValueListenableBuilder(
                                                                    valueListenable:
                                                                        ValueNotifier(
                                                                            ''),
                                                                    builder: (BuildContext
                                                                            context,
                                                                        String
                                                                            value,
                                                                        _) {
                                                                      return DropdownButton<
                                                                          String>(
                                                                        hint: Text(
                                                                            textAlign: TextAlign.center,
                                                                            style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 16.0,
                                                                            ),
                                                                            widget.textEditingTipos[index] == true ? dropOpcoes[0] : dropOpcoes[1]),
                                                                        value: (value.isEmpty)
                                                                            ? null
                                                                            : value,
                                                                        onChanged:
                                                                            (escolha) {
                                                                          if (value
                                                                              .isNotEmpty)
                                                                            value =
                                                                                escolha.toString();
                                                                          setState(
                                                                              () {
                                                                            vertificadoresTipo[index] =
                                                                                true;
                                                                            if (escolha.toString() ==
                                                                                'Considera') {
                                                                              widget.textEditingTipos[index] = true;
                                                                            } else {
                                                                              widget.textEditingTipos[index] = false;
                                                                            }
                                                                          });
                                                                        },
                                                                        items: dropOpcoes
                                                                            .map((op) => DropdownMenuItem(
                                                                                  value: op,
                                                                                  child: Text(op),
                                                                                ))
                                                                            .toList(),
                                                                      );
                                                                    }),
                                                              ],
                                                            )),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 40,
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
                                                                              Text("Tem certeza que deseja remover esta situação adminissional? (É necessário clicar em \"Ok\" e em seguida clicar em \"SALVAR\" para confirmar a remoção. Lembrando que se você fizer isso, se existirirem colaboradores registrados com este campo ficarão sem situação admissional.)"),
                                                                          actions: [
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                child: Text('Cancelar')),
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  deletar_status(index);
                                                                                  setState(() {
                                                                                    widget.textEditingNomes.removeAt(index);
                                                                                    widget.textEditingTipos.removeAt(index);
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
                                                                              Text("Você já removeu/adicionou uma situação adminissional, por favor, salve as alterações para remover outra situação adminissional."),
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
                                                      ],
                                                    ),
                                                  )))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: valor,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BotaoNovostatus(),
                                SizedBox(
                                  width: valor * 0.2,
                                ),
                                BotaoSalvar(
                                  instituicao: widget.instituicao,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ])),
          ],
        ),
      );
    });
  }
}
