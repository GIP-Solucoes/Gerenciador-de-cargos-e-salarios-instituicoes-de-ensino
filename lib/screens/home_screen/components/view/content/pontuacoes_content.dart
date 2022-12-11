import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Cargo.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Pontuacao.dart';
import 'package:gip_solucoes/screens/home_screen/components/controller/sistema_content.dart';

List<bool> verificadoresTitulo = [false, false, false, false, false];
List<bool> verificadoresAssiduidade = [false, false];
List<bool> verificadoresFormacao = [false, false, false, false, false, false];
List<bool> verificadoresExperiencia = [false, false, false, false];
List<bool> verificadoresFormacaoQtde = [
  false,
  false,
  false,
  false,
  false,
  false
];
List<bool> verificadoresExperienciaQtde = [false, false, false, false];
bool verificadorTempo = false;

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

class BotaoSalvar extends StatefulWidget {
  String instituicao;
  List<Cargo> display_list_cargos;
  List<TextEditingController> textEditingTitulo;
  List<TextEditingController> textEditingAssiduidade;
  List<TextEditingController> textEditingFormacao;
  List<TextEditingController> textEditingExperiencia;
  List<TextEditingController> textEditingFormacaoQtde;
  List<TextEditingController> textEditingExperienciaQtde;
  List<TextEditingController> textEditingTempoCasa;
  BotaoSalvar(
      {Key? key,
      required this.instituicao,
      required this.textEditingTitulo,
      required this.textEditingAssiduidade,
      required this.textEditingFormacao,
      required this.textEditingExperiencia,
      required this.textEditingTempoCasa,
      required this.textEditingFormacaoQtde,
      required this.textEditingExperienciaQtde,
      required this.display_list_cargos})
      : super(key: key);

  @override
  State<BotaoSalvar> createState() => _BotaoSalvarState();
}

class _BotaoSalvarState extends State<BotaoSalvar> {
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
 Future<void> alterar_usuarios(int index,double valor)async{
CollectionReference usuarios =
          FirebaseFirestore.instance.collection('Usuario');
          DocumentSnapshot u = await usuarios
              .doc(widget.display_list_cargos[index].usuario_id)
              .get();
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
      
      q.docs.forEach((element){
        if (contador == 0) {
          alterar_usuarios(index,element['valor']);
        } else if (element['final_intervalo'] >=
            widget.display_list_cargos[index].pontuacao) {
          alterar_usuarios(index,element['valor']);
        }

        contador++;
      });
    });
  }

  alterar_pontuacoes() {
    int contador = 0;
    CollectionReference cargos = FirebaseFirestore.instance.collection('Cargo');
    cargos
        .where('instituicao', isEqualTo: widget.instituicao)
        .orderBy('grau')
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((element) {
        var e = element.reference;
        if (verificadoresTitulo[contador] != false) {
          if (widget.textEditingTitulo[contador].text.isNotEmpty)
            e.update({
              "valor_pontuacao": double.parse(
                  widget.textEditingTitulo[contador].text.replaceAll(',', '.'))
            });
        }
        contador++;
      });
      CollectionReference pontuacos =
          FirebaseFirestore.instance.collection('Pontuacao');
      pontuacos
          .where('instituicao', isEqualTo: widget.instituicao)
          .get()
          .then((QuerySnapshot q) {
        q.docs.forEach((elementt) {
          DocumentReference _documentReference = elementt.reference;
          CollectionReference _collectionReference =
              _documentReference.collection('PontuacaoAtributo');
          _collectionReference.orderBy('nome').get().then((QuerySnapshot q) {
            int contador2 = 0;
            q.docs.forEach((elementtt) {
              var ee = elementtt.reference;
              if (elementt["nome"] == "Assiduidade") {
                if (verificadoresAssiduidade[0] != false) {
                  if (widget.textEditingAssiduidade[0].text.isNotEmpty)
                    ee.update({
                      "quantidade_maxima": double.parse(widget
                          .textEditingAssiduidade[0].text
                          .replaceAll(',', '.'))
                    });
                }
                if (verificadoresAssiduidade[1] != false) {
                  if (widget.textEditingAssiduidade[1].text.isNotEmpty)
                    ee.update({
                      "valor": double.parse(widget
                          .textEditingAssiduidade[1].text
                          .replaceAll(',', '.'))
                    });
                }
              } else if (elementt["nome"] == "Experiência") {
                if (verificadoresExperiencia[contador2] != false) {
                  if (widget.textEditingExperiencia[contador2].text.isNotEmpty)
                    ee.update({
                      "valor": double.parse(widget
                          .textEditingExperiencia[contador2].text
                          .replaceAll(',', '.'))
                    });
                }
                if (verificadoresExperienciaQtde[contador2] != false) {
                  if (widget
                      .textEditingExperienciaQtde[contador2].text.isNotEmpty)
                    ee.update({
                      "quantidade_maxima": double.parse(widget
                          .textEditingExperienciaQtde[contador2].text
                          .replaceAll(',', '.'))
                    });
                }
              } else if (elementt["nome"] ==
                  "Pontuação de Formação Acadêmica") {
                if (verificadoresFormacao[contador2] != false) {
                  if (widget.textEditingFormacao[contador2].text.isNotEmpty)
                    ee.update({
                      "valor": double.parse(widget
                          .textEditingFormacao[contador2].text
                          .replaceAll(',', '.'))
                    });
                }
                if (verificadoresFormacaoQtde[contador2] != false) {
                  if (widget.textEditingFormacaoQtde[contador2].text.isNotEmpty)
                    ee.update({
                      "quantidade_maxima": double.parse(widget
                          .textEditingFormacaoQtde[contador2].text
                          .replaceAll(',', '.'))
                    });
                }
              } else {
                if (verificadorTempo != false) {
                  if (widget.textEditingTempoCasa[0].text.isNotEmpty) {
                    ee.update({
                      "valor": double.parse(widget.textEditingTempoCasa[0].text
                          .replaceAll(',', '.'))
                    });
                  }
                }
              }
              contador2++;
            });
          });
        });
      }).catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(e),
          duration: Duration(seconds: 5),
        ));
      });
    }).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(e),
        duration: Duration(seconds: 5),
      ));
    });
    bool verificar_alteracao = false;
    verificadoresTitulo.forEach((element) {
      if (element == true) {
        verificar_alteracao = true;
      }
    });
    verificadoresFormacao.forEach((element) {
      if (element == true) {
        verificar_alteracao = true;
      }
    });
    verificadoresFormacaoQtde.forEach((element) {
      if (element == true) {
        verificar_alteracao = true;
      }
    });
    verificadoresExperiencia.forEach((element) {
      if (element == true) {
        verificar_alteracao = true;
      }
    });
    verificadoresExperienciaQtde.forEach((element) {
      if (element == true) {
        verificar_alteracao = true;
      }
    });
    if (verificadorTempo == true) {
      verificar_alteracao = true;
    }
    verificadoresAssiduidade.forEach((element) {
      if (element == true) {
        verificar_alteracao = true;
      }
    });
    if (verificar_alteracao != false) {
      bool verificar_vazios = false;
      widget.textEditingAssiduidade.forEach((element) {
        if (element.text.isEmpty) verificar_vazios = true;
      });
      widget.textEditingTitulo.forEach((element) {
        if (element.text.isEmpty) verificar_vazios = true;
      });
      widget.textEditingFormacao.forEach((element) {
        if (element.text.isEmpty) verificar_vazios = true;
      });
      widget.textEditingFormacaoQtde.forEach((element) {
        if (element.text.isEmpty) verificar_vazios = true;
      });
      widget.textEditingExperiencia.forEach((element) {
        if (element.text.isEmpty) verificar_vazios = true;
      });
      widget.textEditingExperienciaQtde.forEach((element) {
        if (element.text.isEmpty) verificar_vazios = true;
      });
      widget.textEditingTempoCasa.forEach((element) {
        if (element.text.isEmpty) verificar_vazios = true;
      });
      if (verificar_vazios == false) {
        for(int i=0;i<widget.display_list_cargos.length;i++)
            pegar_id_cargo(i);
        
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text(
                    "Dados salvos",
                  ),
                  content: Text("Os dados foram salvos com sucesso!"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          paginaS = 0;
                          Navigator.popAndPushNamed(context, '/sistema');
                        },
                        child: Text('Ok')),
                  ],
                ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text("Há espaço(s) vazio(s)!"),
          duration: Duration(seconds: 5),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text("Nenhum dado foi alterado!"),
        duration: Duration(seconds: 5),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => alterar_pontuacoes(),
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

class _PontuacoesState extends State<Pontuacoes> {
  int statusCont = 1;
  double mediaQueryx = 0;
  double valor = 0.63;
  _PontuacoesState(double valor) {
    this.valor = valor;
  }
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
      if (scrollCont.offset >= (position.dx - (mediaQueryx * 0.15)))
        setState(() {
          ind = i;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    mediaQueryx = mediaQuery.width;
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
                          //height: 40,
                          child: SingleChildScrollView(
                            controller: scrollCont,
                            scrollDirection: Axis.horizontal,
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
                                            "Pontuação de Título",
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
                                                    .containsKey(2))
                                                ? this.widget.pontuacoes[2].nome
                                                : "...",
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
                                            "Valor",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Un.",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.bold,
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
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Máx.",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.bold,
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
                                                    .containsKey(1))
                                                ? this.widget.pontuacoes[1].nome
                                                : "...",
                                            textAlign: TextAlign.center,
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
                                            "Valor",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Un.",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.bold,
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
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Máx.",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.bold,
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
                                      width: 104.5,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue[200],
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        (this
                                                .widget
                                                .pontuacoes
                                                .asMap()
                                                .containsKey(3))
                                            ? this.widget.pontuacoes[3].nome
                                            : "...",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 8.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 104.5,
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
                                            textAlign: TextAlign.center,
                                            "Valor\npontuação",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                SizedBox(
                                    height: 299,
                                    child: SingleChildScrollView(
                                        child: Column(
                                      children: [
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
                                                      width: 157,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        widget.cargos.isEmpty
                                                            ? "..."
                                                            : widget.cargos[0]
                                                                .titulo,
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
                                                      child: TextField(
                                                        onChanged: (value) {
                                                          verificadoresTitulo[
                                                              0] = true;
                                                        },
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]+[,.]{0,1}[0-9]*')),
                                                          TextInputFormatter
                                                              .withFunction(
                                                            (oldValue,
                                                                    newValue) =>
                                                                newValue
                                                                    .copyWith(
                                                              text: newValue
                                                                  .text
                                                                  .replaceAll(
                                                                      '.', ','),
                                                            ),
                                                          ),
                                                        ],
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesTitulo
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesTitulo[0],
                                                        maxLines: null,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
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
                                                                        0))
                                                            ? this
                                                                .widget
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
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]+[,.]{0,1}[0-9]*')),
                                                          TextInputFormatter
                                                              .withFunction(
                                                            (oldValue,
                                                                    newValue) =>
                                                                newValue
                                                                    .copyWith(
                                                              text: newValue
                                                                  .text
                                                                  .replaceAll(
                                                                      '.', ','),
                                                            ),
                                                          ),
                                                        ],
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesFormacao
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesFormacao[0],
                                                        onChanged: (value) {
                                                          verificadoresFormacao[
                                                              0] = true;
                                                        },
                                                        maxLines: null,
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
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]')),
                                                        ],
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesFormacaoQtde
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesFormacaoQtde[0],
                                                        onChanged: (value) {
                                                          verificadoresFormacaoQtde[
                                                              0] = true;
                                                        },
                                                        maxLines: null,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
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
                                                            ? this
                                                                .widget
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
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]+[,.]{0,1}[0-9]*')),
                                                          TextInputFormatter
                                                              .withFunction(
                                                            (oldValue,
                                                                    newValue) =>
                                                                newValue
                                                                    .copyWith(
                                                              text: newValue
                                                                  .text
                                                                  .replaceAll(
                                                                      '.', ','),
                                                            ),
                                                          ),
                                                        ],
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesExperiencia
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesExperiencia[0],
                                                        onChanged: (value) {
                                                          verificadoresExperiencia[
                                                              0] = true;
                                                        },
                                                        maxLines: null,
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
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]')),
                                                        ],
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesExperienciaQtde
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesExperienciaQtde[0],
                                                        onChanged: (value) {
                                                          verificadoresExperienciaQtde[
                                                              0] = true;
                                                        },
                                                        maxLines: null,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 30,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 104.5,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        "1 ano",
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
                                                      width: 104.5,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      constraints:
                                                          BoxConstraints(
                                                              minHeight: 40),
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]+[,.]{0,1}[0-9]*')),
                                                          TextInputFormatter
                                                              .withFunction(
                                                            (oldValue,
                                                                    newValue) =>
                                                                newValue
                                                                    .copyWith(
                                                              text: newValue
                                                                  .text
                                                                  .replaceAll(
                                                                      '.', ','),
                                                            ),
                                                          ),
                                                        ],
                                                        onChanged: (value) {
                                                          verificadorTempo =
                                                              true;
                                                          setState(() {
                                                            if (value.isEmpty) {
                                                              for (int i = 0;
                                                                  i <
                                                                      widget
                                                                          .pontuacoesTempoCasa
                                                                          .length;
                                                                  i++) {
                                                                if (i != 0) {
                                                                  widget
                                                                      .pontuacoesTempoCasa[
                                                                          i]
                                                                      .text = "";
                                                                }
                                                              }
                                                            } else {
                                                              for (int i = 0;
                                                                  i <
                                                                      widget
                                                                          .pontuacoesTempoCasa
                                                                          .length;
                                                                  i++) {
                                                                if (i != 0) {
                                                                  widget
                                                                      .pontuacoesTempoCasa[
                                                                          i]
                                                                      .text = (double.parse(value.replaceAll(
                                                                              ',',
                                                                              '.')) *
                                                                          (i +
                                                                              1))
                                                                      .toString()
                                                                      .replaceAll(
                                                                          '.',
                                                                          ',');
                                                                }
                                                              }
                                                            }
                                                          });
                                                        },
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesTempoCasa
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesTempoCasa[0],
                                                        maxLines: null,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
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
                                                      width: 157,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        widget.cargos.isEmpty
                                                            ? "..."
                                                            : widget.cargos[1]
                                                                .titulo,
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
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]+[,.]{0,1}[0-9]*')),
                                                          TextInputFormatter
                                                              .withFunction(
                                                            (oldValue,
                                                                    newValue) =>
                                                                newValue
                                                                    .copyWith(
                                                              text: newValue
                                                                  .text
                                                                  .replaceAll(
                                                                      '.', ','),
                                                            ),
                                                          ),
                                                        ],
                                                        onChanged: (value) {
                                                          verificadoresTitulo[
                                                              1] = true;
                                                        },
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesTitulo
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesTitulo[1],
                                                        maxLines: null,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
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
                                                                        1))
                                                            ? this
                                                                .widget
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
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]+[,.]{0,1}[0-9]*')),
                                                          TextInputFormatter
                                                              .withFunction(
                                                            (oldValue,
                                                                    newValue) =>
                                                                newValue
                                                                    .copyWith(
                                                              text: newValue
                                                                  .text
                                                                  .replaceAll(
                                                                      '.', ','),
                                                            ),
                                                          ),
                                                        ],
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesFormacao
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesFormacao[1],
                                                        onChanged: (value) {
                                                          verificadoresFormacao[
                                                              1] = true;
                                                        },
                                                        maxLines: null,
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
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]')),
                                                        ],
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesFormacaoQtde
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesFormacaoQtde[1],
                                                        onChanged: (value) {
                                                          verificadoresFormacaoQtde[
                                                              1] = true;
                                                        },
                                                        maxLines: null,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
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
                                                            ? this
                                                                .widget
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
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]+[,.]{0,1}[0-9]*')),
                                                          TextInputFormatter
                                                              .withFunction(
                                                            (oldValue,
                                                                    newValue) =>
                                                                newValue
                                                                    .copyWith(
                                                              text: newValue
                                                                  .text
                                                                  .replaceAll(
                                                                      '.', ','),
                                                            ),
                                                          ),
                                                        ],
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesExperiencia
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesExperiencia[1],
                                                        onChanged: (value) {
                                                          verificadoresExperiencia[
                                                              1] = true;
                                                        },
                                                        maxLines: null,
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
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]')),
                                                        ],
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesExperienciaQtde
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesExperienciaQtde[1],
                                                        onChanged: (value) {
                                                          verificadoresExperienciaQtde[
                                                              1] = true;
                                                        },
                                                        maxLines: null,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 30,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 104.5,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        "2 anos",
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
                                                      width: 104.5,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      constraints:
                                                          BoxConstraints(
                                                              minHeight: 40),
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]+[,.]{0,1}[0-9]*')),
                                                          TextInputFormatter
                                                              .withFunction(
                                                            (oldValue,
                                                                    newValue) =>
                                                                newValue
                                                                    .copyWith(
                                                              text: newValue
                                                                  .text
                                                                  .replaceAll(
                                                                      '.', ','),
                                                            ),
                                                          ),
                                                        ],
                                                        onChanged: (value) {
                                                          setState(() {
                                                            verificadorTempo =
                                                                true;
                                                            if (value.isEmpty) {
                                                              for (int i = 0;
                                                                  i <
                                                                      widget
                                                                          .pontuacoesTempoCasa
                                                                          .length;
                                                                  i++) {
                                                                if (i != 1) {
                                                                  widget
                                                                      .pontuacoesTempoCasa[
                                                                          i]
                                                                      .text = "";
                                                                }
                                                              }
                                                            } else {
                                                              for (int i = 0;
                                                                  i <
                                                                      widget
                                                                          .pontuacoesTempoCasa
                                                                          .length;
                                                                  i++) {
                                                                if (i != 1) {
                                                                  widget
                                                                      .pontuacoesTempoCasa[
                                                                          i]
                                                                      .text = (double.parse(value.replaceAll(
                                                                              ',',
                                                                              '.')) *
                                                                          (i +
                                                                              1))
                                                                      .toString()
                                                                      .replaceAll(
                                                                          '.',
                                                                          ',');
                                                                }
                                                              }
                                                            }
                                                          });
                                                        },
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesTempoCasa
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesTempoCasa[1],
                                                        maxLines: null,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
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
                                                      width: 157,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        widget.cargos.isEmpty
                                                            ? "..."
                                                            : widget.cargos[2]
                                                                .titulo,
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
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]+[,.]{0,1}[0-9]*')),
                                                          TextInputFormatter
                                                              .withFunction(
                                                            (oldValue,
                                                                    newValue) =>
                                                                newValue
                                                                    .copyWith(
                                                              text: newValue
                                                                  .text
                                                                  .replaceAll(
                                                                      '.', ','),
                                                            ),
                                                          ),
                                                        ],
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesTitulo
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesTitulo[2],
                                                        onChanged: (value) {
                                                          verificadoresTitulo[
                                                              2] = true;
                                                        },
                                                        maxLines: null,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
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
                                                                        2))
                                                            ? this
                                                                .widget
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
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]+[,.]{0,1}[0-9]*')),
                                                          TextInputFormatter
                                                              .withFunction(
                                                            (oldValue,
                                                                    newValue) =>
                                                                newValue
                                                                    .copyWith(
                                                              text: newValue
                                                                  .text
                                                                  .replaceAll(
                                                                      '.', ','),
                                                            ),
                                                          ),
                                                        ],
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesFormacao
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesFormacao[2],
                                                        onChanged: (value) {
                                                          verificadoresFormacao[
                                                              2] = true;
                                                        },
                                                        maxLines: null,
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
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]')),
                                                        ],
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesFormacaoQtde
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesFormacaoQtde[2],
                                                        onChanged: (value) {
                                                          verificadoresFormacaoQtde[
                                                              2] = true;
                                                        },
                                                        maxLines: null,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
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
                                                            ? this
                                                                .widget
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
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]+[,.]{0,1}[0-9]*')),
                                                          TextInputFormatter
                                                              .withFunction(
                                                            (oldValue,
                                                                    newValue) =>
                                                                newValue
                                                                    .copyWith(
                                                              text: newValue
                                                                  .text
                                                                  .replaceAll(
                                                                      '.', ','),
                                                            ),
                                                          ),
                                                        ],
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesExperiencia
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesExperiencia[2],
                                                        onChanged: (value) {
                                                          verificadoresExperiencia[
                                                              2] = true;
                                                        },
                                                        maxLines: null,
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
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]')),
                                                        ],
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesExperienciaQtde
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesExperienciaQtde[2],
                                                        onChanged: (value) {
                                                          verificadoresExperienciaQtde[
                                                              2] = true;
                                                        },
                                                        maxLines: null,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 30,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 104.5,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        "3 anos",
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
                                                      width: 104.5,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      constraints:
                                                          BoxConstraints(
                                                              minHeight: 40),
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]+[,.]{0,1}[0-9]*')),
                                                          TextInputFormatter
                                                              .withFunction(
                                                            (oldValue,
                                                                    newValue) =>
                                                                newValue
                                                                    .copyWith(
                                                              text: newValue
                                                                  .text
                                                                  .replaceAll(
                                                                      '.', ','),
                                                            ),
                                                          ),
                                                        ],
                                                        onChanged: (value) {
                                                          setState(() {
                                                            verificadorTempo =
                                                                true;
                                                            if (value.isEmpty) {
                                                              for (int i = 0;
                                                                  i <
                                                                      widget
                                                                          .pontuacoesTempoCasa
                                                                          .length;
                                                                  i++) {
                                                                if (i != 2) {
                                                                  widget
                                                                      .pontuacoesTempoCasa[
                                                                          i]
                                                                      .text = "";
                                                                }
                                                              }
                                                            } else {
                                                              for (int i = 0;
                                                                  i <
                                                                      widget
                                                                          .pontuacoesTempoCasa
                                                                          .length;
                                                                  i++) {
                                                                if (i != 2) {
                                                                  widget
                                                                      .pontuacoesTempoCasa[
                                                                          i]
                                                                      .text = (double.parse(value.replaceAll(
                                                                              ',',
                                                                              '.')) *
                                                                          (i +
                                                                              1))
                                                                      .toString()
                                                                      .replaceAll(
                                                                          '.',
                                                                          ',');
                                                                }
                                                              }
                                                            }
                                                          });
                                                        },
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesTempoCasa
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesTempoCasa[2],
                                                        maxLines: null,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
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
                                                      width: 157,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        widget.cargos.isEmpty
                                                            ? "..."
                                                            : widget.cargos[3]
                                                                .titulo,
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
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]+[,.]{0,1}[0-9]*')),
                                                          TextInputFormatter
                                                              .withFunction(
                                                            (oldValue,
                                                                    newValue) =>
                                                                newValue
                                                                    .copyWith(
                                                              text: newValue
                                                                  .text
                                                                  .replaceAll(
                                                                      '.', ','),
                                                            ),
                                                          ),
                                                        ],
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesTitulo
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesTitulo[3],
                                                        onChanged: (value) {
                                                          verificadoresTitulo[
                                                              3] = true;
                                                        },
                                                        maxLines: null,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
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
                                                                        3))
                                                            ? this
                                                                .widget
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
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]+[,.]{0,1}[0-9]*')),
                                                          TextInputFormatter
                                                              .withFunction(
                                                            (oldValue,
                                                                    newValue) =>
                                                                newValue
                                                                    .copyWith(
                                                              text: newValue
                                                                  .text
                                                                  .replaceAll(
                                                                      '.', ','),
                                                            ),
                                                          ),
                                                        ],
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesFormacao
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesFormacao[3],
                                                        onChanged: (value) {
                                                          verificadoresFormacao[
                                                              3] = true;
                                                        },
                                                        maxLines: null,
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
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]')),
                                                        ],
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesFormacaoQtde
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesFormacaoQtde[3],
                                                        onChanged: (value) {
                                                          verificadoresFormacaoQtde[
                                                              3] = true;
                                                        },
                                                        maxLines: null,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
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
                                                            ? this
                                                                .widget
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
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]+[,.]{0,1}[0-9]*')),
                                                          TextInputFormatter
                                                              .withFunction(
                                                            (oldValue,
                                                                    newValue) =>
                                                                newValue
                                                                    .copyWith(
                                                              text: newValue
                                                                  .text
                                                                  .replaceAll(
                                                                      '.', ','),
                                                            ),
                                                          ),
                                                        ],
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesExperiencia
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesExperiencia[3],
                                                        onChanged: (value) {
                                                          verificadoresExperiencia[
                                                              3] = true;
                                                        },
                                                        maxLines: null,
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
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]')),
                                                        ],
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesExperienciaQtde
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesExperienciaQtde[3],
                                                        onChanged: (value) {
                                                          verificadoresExperienciaQtde[
                                                              3] = true;
                                                        },
                                                        maxLines: null,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 30,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 104.5,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        "4 anos",
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
                                                      width: 104.5,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      constraints:
                                                          BoxConstraints(
                                                              minHeight: 40),
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]+[,.]{0,1}[0-9]*')),
                                                          TextInputFormatter
                                                              .withFunction(
                                                            (oldValue,
                                                                    newValue) =>
                                                                newValue
                                                                    .copyWith(
                                                              text: newValue
                                                                  .text
                                                                  .replaceAll(
                                                                      '.', ','),
                                                            ),
                                                          ),
                                                        ],
                                                        onChanged: (value) {
                                                          setState(() {
                                                            verificadorTempo =
                                                                true;
                                                            verificadorTempo =
                                                                true;
                                                            if (value.isEmpty) {
                                                              for (int i = 0;
                                                                  i <
                                                                      widget
                                                                          .pontuacoesTempoCasa
                                                                          .length;
                                                                  i++) {
                                                                if (i != 3) {
                                                                  widget
                                                                      .pontuacoesTempoCasa[
                                                                          i]
                                                                      .text = "";
                                                                }
                                                              }
                                                            } else {
                                                              for (int i = 0;
                                                                  i <
                                                                      widget
                                                                          .pontuacoesTempoCasa
                                                                          .length;
                                                                  i++) {
                                                                if (i != 3) {
                                                                  widget
                                                                      .pontuacoesTempoCasa[
                                                                          i]
                                                                      .text = (double.parse(value.replaceAll(
                                                                              ',',
                                                                              '.')) *
                                                                          (i +
                                                                              1))
                                                                      .toString()
                                                                      .replaceAll(
                                                                          '.',
                                                                          ',');
                                                                }
                                                              }
                                                            }
                                                          });
                                                        },
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesTempoCasa
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesTempoCasa[3],
                                                        maxLines: null,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
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
                                                      width: 157,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        widget.cargos.isEmpty
                                                            ? "..."
                                                            : widget.cargos[4]
                                                                .titulo,
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
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]+[,.]{0,1}[0-9]*')),
                                                          TextInputFormatter
                                                              .withFunction(
                                                            (oldValue,
                                                                    newValue) =>
                                                                newValue
                                                                    .copyWith(
                                                              text: newValue
                                                                  .text
                                                                  .replaceAll(
                                                                      '.', ','),
                                                            ),
                                                          ),
                                                        ],
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesTitulo
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesTitulo[4],
                                                        onChanged: (value) {
                                                          verificadoresTitulo[
                                                              4] = true;
                                                        },
                                                        maxLines: null,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
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
                                                            ? this
                                                                .widget
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
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]+[,.]{0,1}[0-9]*')),
                                                          TextInputFormatter
                                                              .withFunction(
                                                            (oldValue,
                                                                    newValue) =>
                                                                newValue
                                                                    .copyWith(
                                                              text: newValue
                                                                  .text
                                                                  .replaceAll(
                                                                      '.', ','),
                                                            ),
                                                          ),
                                                        ],
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesFormacao
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesFormacao[4],
                                                        onChanged: (value) {
                                                          verificadoresFormacao[
                                                              4] = true;
                                                        },
                                                        maxLines: null,
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
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]')),
                                                        ],
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesFormacaoQtde
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesFormacaoQtde[4],
                                                        onChanged: (value) {
                                                          verificadoresFormacaoQtde[
                                                              4] = true;
                                                        },
                                                        maxLines: null,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 484,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 104.5,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        "5 anos",
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
                                                      width: 104.5,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      constraints:
                                                          BoxConstraints(
                                                              minHeight: 40),
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]+[,.]{0,1}[0-9]*')),
                                                          TextInputFormatter
                                                              .withFunction(
                                                            (oldValue,
                                                                    newValue) =>
                                                                newValue
                                                                    .copyWith(
                                                              text: newValue
                                                                  .text
                                                                  .replaceAll(
                                                                      '.', ','),
                                                            ),
                                                          ),
                                                        ],
                                                        onChanged: (value) {
                                                          setState(() {
                                                            verificadorTempo =
                                                                true;
                                                            if (value.isEmpty) {
                                                              for (int i = 0;
                                                                  i <
                                                                      widget
                                                                          .pontuacoesTempoCasa
                                                                          .length;
                                                                  i++) {
                                                                if (i != 4) {
                                                                  widget
                                                                      .pontuacoesTempoCasa[
                                                                          i]
                                                                      .text = "";
                                                                }
                                                              }
                                                            } else {
                                                              for (int i = 0;
                                                                  i <
                                                                      widget
                                                                          .pontuacoesTempoCasa
                                                                          .length;
                                                                  i++) {
                                                                if (i != 4) {
                                                                  widget
                                                                      .pontuacoesTempoCasa[
                                                                          i]
                                                                      .text = (double.parse(value.replaceAll(
                                                                              ',',
                                                                              '.')) *
                                                                          (i +
                                                                              1))
                                                                      .toString()
                                                                      .replaceAll(
                                                                          '.',
                                                                          ',');
                                                                }
                                                              }
                                                            }
                                                          });
                                                        },
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesTempoCasa
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesTempoCasa[4],
                                                        maxLines: null,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
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
                                                            ? this
                                                                .widget
                                                                .pontuacoes[0]
                                                                .nome
                                                            : "...",
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
                                                                        5))
                                                            ? this
                                                                .widget
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
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]+[,.]{0,1}[0-9]*')),
                                                          TextInputFormatter
                                                              .withFunction(
                                                            (oldValue,
                                                                    newValue) =>
                                                                newValue
                                                                    .copyWith(
                                                              text: newValue
                                                                  .text
                                                                  .replaceAll(
                                                                      '.', ','),
                                                            ),
                                                          ),
                                                        ],
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesFormacao
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesFormacao[5],
                                                        onChanged: (value) {
                                                          verificadoresFormacao[
                                                              5] = true;
                                                        },
                                                        maxLines: null,
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
                                                      child: TextField(
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]')),
                                                        ],
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: widget
                                                                .pontuacoesFormacaoQtde
                                                                .isEmpty
                                                            ? null
                                                            : widget
                                                                .pontuacoesFormacaoQtde[5],
                                                        onChanged: (value) {
                                                          verificadoresFormacaoQtde[
                                                              5] = true;
                                                        },
                                                        maxLines: null,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 695,
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 103.5,
                                                  height: 19,
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  child: Text(
                                                    "Limite",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 8.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 103.5,
                                                  height: 28,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  child: TextField(
                                                    onChanged: (value) {
                                                      verificadoresAssiduidade[
                                                          0] = true;
                                                    },
                                                    inputFormatters: <
                                                        TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .allow(
                                                              RegExp(r'[0-9]')),
                                                    ],
                                                    textAlign: TextAlign.center,
                                                    controller: widget
                                                            .pontuacoesAssiduidade
                                                            .isEmpty
                                                        ? null
                                                        : widget
                                                            .pontuacoesAssiduidade[0],
                                                    maxLines: null,
                                                    style: TextStyle(
                                                      color: Colors.black,
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
                                                  alignment: Alignment.center,
                                                  width: 103.5,
                                                  height: 19,
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  child: Text(
                                                    "Valor",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 8.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 103.5,
                                                  height: 28,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  child: TextField(
                                                    onChanged: (value) {
                                                      verificadoresAssiduidade[
                                                          1] = true;
                                                    },
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
                                                    textAlign: TextAlign.center,
                                                    controller: widget
                                                            .pontuacoesAssiduidade
                                                            .isEmpty
                                                        ? null
                                                        : widget
                                                            .pontuacoesAssiduidade[1],
                                                    maxLines: null,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 8.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 1149,
                                            )
                                          ],
                                        )
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

class Pontuacoes extends StatefulWidget {
  double valor;
  List<TextEditingController> pontuacoesTitulo;
  List<TextEditingController> pontuacoesFormacao;
  List<TextEditingController> pontuacoesExperiencia;
  List<TextEditingController> pontuacoesAssiduidade;
  List<TextEditingController> pontuacoesTempoCasa;

  List<TextEditingController> pontuacoesFormacaoQtde;
  List<TextEditingController> pontuacoesExperienciaQtde;
  List<Cargo> cargos;
  List<Pontuacao> pontuacoes;
  Pontuacoes(
      {Key? key,
      required this.valor,
      required this.pontuacoesTitulo,
      required this.pontuacoesFormacao,
      required this.pontuacoesExperiencia,
      required this.pontuacoesAssiduidade,
      required this.pontuacoesTempoCasa,
      required this.cargos,
      required this.pontuacoes,
      required this.pontuacoesFormacaoQtde,
      required this.pontuacoesExperienciaQtde})
      : super(key: key);
  @override
  @override
  State<StatefulWidget> createState() {
    return _PontuacoesState(this.valor);
  }
}

class TitlePontuacoes extends StatelessWidget {
  TitlePontuacoes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AutoSizeText(
      "Pontuações",
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
