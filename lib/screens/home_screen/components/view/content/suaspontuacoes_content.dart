import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Cargo.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Pontuacao.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Usuario.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/sistema_content.dart';
import 'package:intl/intl.dart';

class _SuaspontuacoesState extends State<Suaspontuacoes> {
  int statusCont = 1;
  double mediaQueryx = 0;
  double valor = 0.63;
  _SuaspontuacoesState(double valor) {
    this.valor = valor;
  }
  static List<TextEditingController> controllerl1 = [
    TextEditingController(text: "0"),
    TextEditingController(text: "3"),
    TextEditingController(text: "20"),
    TextEditingController(text: "40"),
    TextEditingController(text: "60"),
    TextEditingController(text: "6"),
    TextEditingController(text: "1"),
    TextEditingController(text: "2"),
    TextEditingController(text: "3"),
    TextEditingController(text: "4"),
  ];
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
        width: 1000,
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
                          width: (mediaQuery.width * this.valor) - 40,
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
                                            (this.widget.pontuacoes.asMap().containsKey(2))?widget.pontuacoes[2].nome:"Carregando...",
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
                                      child: Text(
                                        "Qtde",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
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
                                            (this.widget.pontuacoes.asMap().containsKey(1))?widget.pontuacoes[1].nome:"Carregando...",
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
                                      child: Text(
                                        "Qtde",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 157,
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
                                            "Data de admissão",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
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
                                                      width: 209,
                                                      decoration: BoxDecoration(
                                                        color: Colors.blue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        "Seu cargo",
                                                        textAlign:
                                                            TextAlign.center,
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
                                                        (this.widget.pontuacoes.asMap().containsKey(2) && this.widget.pontuacoes[2].pontuacaoAtributo.asMap().containsKey(0))?widget.pontuacoes[2].pontuacaoAtributo[0].nome:"Carregando...",
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
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        (this.widget.pontuacoes.asMap().containsKey(2) && this.widget.pontuacoes[2].pontuacaoAtributo.asMap().containsKey(0))?widget.pontuacoes[2].pontuacaoAtributo[0].valor.toString().replaceAll('.', ','):"...",
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
                                                            height: 20,
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
                                                                            "Máximo de pontos:",
                                                                          ),
                                                                          content:
                                                                              Text((this.widget.pontuacoes.asMap().containsKey(2) && this.widget.pontuacoes[2].pontuacaoAtributo.asMap().containsKey(0))?"O máximo de pontos para este atributo é "+widget.pontuacoes[2].pontuacaoAtributo[0].quantidade_maxima.toString().replaceAll('.', ',')+".":"Carregando..."),
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
                                                          Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            this.widget.usuario.quantidade_aprovacao_concurso.toString().replaceAll('.', ','),
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
                                                        (this.widget.pontuacoes.asMap().containsKey(1) && this.widget.pontuacoes[1].pontuacaoAtributo.asMap().containsKey(0))?widget.pontuacoes[1].pontuacaoAtributo[0].nome:"Carregando...",
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
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        (this.widget.pontuacoes.asMap().containsKey(1) && this.widget.pontuacoes[1].pontuacaoAtributo.asMap().containsKey(0))?widget.pontuacoes[1].pontuacaoAtributo[0].valor.toString().replaceAll('.', ','):"...",
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
                                                            height: 20,
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
                                                                            "Máximo de pontos:",
                                                                          ),
                                                                          content:
                                                                              Text(
                                                                                (this.widget.pontuacoes.asMap().containsKey(1) && this.widget.pontuacoes[1].pontuacaoAtributo.asMap().containsKey(0))?"O máximo de pontos para este atributo é "+widget.pontuacoes[1].pontuacaoAtributo[0].quantidade_maxima.toString().replaceAll('.', ',')+".":"Carregando..."),
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
                                                          Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            this.widget.usuario.quantidade_livros.toString().replaceAll('.', ','),
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
                                                      width: 157,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        DateFormat("dd/MM/yyyy").format(this.widget.usuario.data_admissao)
                                                        ,
                                                        textAlign:
                                                            TextAlign.center,
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
                                                        this.widget.cargo.titulo,
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
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        this.widget.cargo.valor_pontuacao.toString().replaceAll('.', ','),
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
                                                        (this.widget.pontuacoes.asMap().containsKey(2) && this.widget.pontuacoes[2].pontuacaoAtributo.asMap().containsKey(1))?widget.pontuacoes[2].pontuacaoAtributo[1].nome:"Carregando...",
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
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        (this.widget.pontuacoes.asMap().containsKey(2) && this.widget.pontuacoes[2].pontuacaoAtributo.asMap().containsKey(1))?widget.pontuacoes[2].pontuacaoAtributo[1].valor.toString().replaceAll('.', ','):"...",
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
                                                            height: 20,
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
                                                                            "Máximo de pontos:",
                                                                          ),
                                                                          content:
                                                                              Text(
                                                                                (
                                                                                  this.widget.pontuacoes.asMap().containsKey(2) && this.widget.pontuacoes[2].pontuacaoAtributo.asMap().containsKey(1))?"O máximo de pontos para este atributo é "+widget.pontuacoes[2].pontuacaoAtributo[1].valor.toString().replaceAll('.', ',')+".":"Carregando..."),
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
                                                          Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            this.widget.usuario.quantidade_stricto_sensu.toString().replaceAll('.', ','),
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
                                                        (this.widget.pontuacoes.asMap().containsKey(1) && this.widget.pontuacoes[1].pontuacaoAtributo.asMap().containsKey(1))?widget.pontuacoes[1].pontuacaoAtributo[1].nome.toString().replaceAll('.', ','):"Carregando...",
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
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        (this.widget.pontuacoes.asMap().containsKey(1) && this.widget.pontuacoes[1].pontuacaoAtributo.asMap().containsKey(1))?widget.pontuacoes[1].pontuacaoAtributo[1].valor.toString().replaceAll('.', ','):"...",
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
                                                            height: 20,
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
                                                                            "Máximo de pontos:",
                                                                          ),
                                                                          content:
                                                                              Text(
                                                                                (
                                                                                  
                                                                                  this.widget.pontuacoes.asMap().containsKey(1) && this.widget.pontuacoes[1].pontuacaoAtributo.asMap().containsKey(1))?"O máximo de pontos para este atributo é "+widget.pontuacoes[1].pontuacaoAtributo[1].quantidade_maxima.toString().replaceAll('.', ',')+".":"Carregando..."),
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
                                                          Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            this.widget.usuario.quantidade_professor_universidade_publica.toString().replaceAll('.', ','),
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
                                                      width: 157,
                                                      decoration: BoxDecoration(
                                                        color: Colors.blue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        "Tempo de serviço",
                                                        textAlign:
                                                            TextAlign.center,
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
                                                        color: Colors.blue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        "Próximo cargo",
                                                        textAlign:
                                                            TextAlign.center,
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
                                                        (this.widget.pontuacoes.asMap().containsKey(2) && this.widget.pontuacoes[2].pontuacaoAtributo.asMap().containsKey(2))?widget.pontuacoes[2].pontuacaoAtributo[2].nome:"Carregando...",
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
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        (this.widget.pontuacoes.asMap().containsKey(2) && this.widget.pontuacoes[2].pontuacaoAtributo.asMap().containsKey(2))?widget.pontuacoes[2].pontuacaoAtributo[2].valor.toString().replaceAll('.', ','):"...",
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
                                                            height: 20,
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
                                                                            "Máximo de pontos:",
                                                                          ),
                                                                          content:
                                                                              Text(
                                                                                (this.widget.pontuacoes.asMap().containsKey(2) && this.widget.pontuacoes[2].pontuacaoAtributo.asMap().containsKey(2))?"O máximo de pontos para este atributo é "+widget.pontuacoes[2].pontuacaoAtributo[2].quantidade_maxima.toString().replaceAll('.', ',')+".":"Carregando..."),
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
                                                          Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            this.widget.usuario.quantidade_cursos_aperfeicoamento.toString().replaceAll('.', ','),
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
                                                        (this.widget.pontuacoes.asMap().containsKey(1) && this.widget.pontuacoes[1].pontuacaoAtributo.asMap().containsKey(2))?widget.pontuacoes[1].pontuacaoAtributo[2].nome:"Carregando...",
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
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        (this.widget.pontuacoes.asMap().containsKey(1) && this.widget.pontuacoes[1].pontuacaoAtributo.asMap().containsKey(2))?widget.pontuacoes[1].pontuacaoAtributo[2].valor.toString().replaceAll('.', ','):"...",
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
                                                            height: 20,
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
                                                                            "Máximo de pontos:",
                                                                          ),
                                                                          content:
                                                                              Text(
                                                                                (this.widget.pontuacoes.asMap().containsKey(1) && this.widget.pontuacoes[1].pontuacaoAtributo.asMap().containsKey(2))?"O máximo de pontos para este atributo é "+widget.pontuacoes[1].pontuacaoAtributo[2].quantidade_maxima.toString().replaceAll('.', ',')+".":"Carregando..."),
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
                                                          Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            this.widget.usuario.quantidade_pesquisas_aprovadas.toString().replaceAll('.', ','),
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
                                                      width: 157,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        this.widget.quantidade_anos.toString()+" ano(s) e "+this.widget.quantidade_meses.toString()+" mes(es)",
                                                        textAlign:
                                                            TextAlign.center,
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
                                                        this.widget.titulo_cargo,
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
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        this.widget.valor_cargo.toString().replaceAll('.', ','),
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
                                                        (this.widget.pontuacoes.asMap().containsKey(2) && this.widget.pontuacoes[2].pontuacaoAtributo.asMap().containsKey(3))?widget.pontuacoes[2].pontuacaoAtributo[3].nome:"Carregando...",
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
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        (this.widget.pontuacoes.asMap().containsKey(2) && this.widget.pontuacoes[2].pontuacaoAtributo.asMap().containsKey(3))?widget.pontuacoes[2].pontuacaoAtributo[3].valor.toString().replaceAll('.', ','):"...",
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
                                                            height: 20,
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
                                                                            "Máximo de pontos:",
                                                                          ),
                                                                          content:
                                                                              Text(
                                                                                (this.widget.pontuacoes.asMap().containsKey(2) && this.widget.pontuacoes[2].pontuacaoAtributo.asMap().containsKey(3))?"O máximo de pontos para este atributo é "+widget.pontuacoes[2].pontuacaoAtributo[3].quantidade_maxima.toString().replaceAll('.', ',')+".":"Carregando..."),
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
                                                          Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            this.widget.usuario.quantidade_cursos_extensao_cultural.toString().replaceAll('.', ','),
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
                                                        (this.widget.pontuacoes.asMap().containsKey(1) && this.widget.pontuacoes[1].pontuacaoAtributo.asMap().containsKey(3))?widget.pontuacoes[1].pontuacaoAtributo[3].nome:"Carregando...",
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
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        (this.widget.pontuacoes.asMap().containsKey(1) && this.widget.pontuacoes[1].pontuacaoAtributo.asMap().containsKey(3))?widget.pontuacoes[1].pontuacaoAtributo[3].valor.toString().replaceAll('.', ','):"...",
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
                                                            height: 20,
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
                                                                            "Máximo de pontos:",
                                                                          ),
                                                                          content:
                                                                              Text(
                                                                                (this.widget.pontuacoes.asMap().containsKey(1) && this.widget.pontuacoes[1].pontuacaoAtributo.asMap().containsKey(3))?"O máximo de pontos para este atributo é "+widget.pontuacoes[1].pontuacaoAtributo[3].quantidade_maxima.toString().replaceAll('.', ',')+".":"Carregando..."),
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
                                                          Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            this.widget.usuario.quantidade_trabalhos_cientificos_revista.toString().replaceAll('.', ','),
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
                                                      width: 157,
                                                      decoration: BoxDecoration(
                                                        color: Colors.blue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: Text(
                                                        "Pontuação",
                                                        textAlign:
                                                            TextAlign.center,
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
                                                        (this.widget.pontuacoes.asMap().containsKey(0))?widget.pontuacoes[0].nome:"Carregando...",
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
                                                        (this.widget.pontuacoes.asMap().containsKey(2) && this.widget.pontuacoes[2].pontuacaoAtributo.asMap().containsKey(4))?widget.pontuacoes[2].pontuacaoAtributo[4].nome:"Carregando...",
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
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        (this.widget.pontuacoes.asMap().containsKey(2) && this.widget.pontuacoes[2].pontuacaoAtributo.asMap().containsKey(4))?widget.pontuacoes[2].pontuacaoAtributo[4].valor.toString().replaceAll('.', ','):"...",
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
                                                            height: 20,
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
                                                                            "Máximo de pontos:",
                                                                          ),
                                                                          content:
                                                                              Text(
                                                                                (this.widget.pontuacoes.asMap().containsKey(2) && this.widget.pontuacoes[2].pontuacaoAtributo.asMap().containsKey(4))?"O máximo de pontos para este atributo é "+widget.pontuacoes[2].pontuacaoAtributo[4].quantidade_maxima.toString().replaceAll('.', ',')+".":"Carregando..."),
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
                                                          Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            this.widget.usuario.quantidade_outros_cursos_realizados.toString().replaceAll('.', ','),
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
                                                      width: 484,
                                                    ),
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
                                                        this.widget.soma.toString().replaceAll('.', ','),
                                                        textAlign:
                                                            TextAlign.center,
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
                                                    Column(
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 68,
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
                                                          width: 68,
                                                          height: 28,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            this.widget.usuario.quantidade_faltas.toString().replaceAll('.', ','),
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
                                                      width: 2.5,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 68,
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
                                                          width: 68,
                                                          height: 28,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            (this.widget.pontuacoes.asMap().containsKey(0) && this.widget.pontuacoes[0].pontuacaoAtributo.asMap().containsKey(0))?widget.pontuacoes[0].pontuacaoAtributo[0].quantidade_maxima.toString().replaceAll('.', ','):"...",
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
                                                      width: 2.5,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 68,
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
                                                            "Valor",
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
                                                          width: 68,
                                                          height: 28,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            (this.widget.pontuacoes.asMap().containsKey(0) && this.widget.pontuacoes[0].pontuacaoAtributo.asMap().containsKey(0))?widget.pontuacoes[0].pontuacaoAtributo[0].valor.toString().replaceAll('.', ','):"...",
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
                                                        (this.widget.pontuacoes.asMap().containsKey(2) && this.widget.pontuacoes[2].pontuacaoAtributo.asMap().containsKey(5))?widget.pontuacoes[2].pontuacaoAtributo[5].nome:"Carregando...",
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
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        (this.widget.pontuacoes.asMap().containsKey(2) && this.widget.pontuacoes[2].pontuacaoAtributo.asMap().containsKey(5))?widget.pontuacoes[2].pontuacaoAtributo[5].valor.toString().replaceAll('.', ','):"...",
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
                                                            height: 20,
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
                                                                            "Máximo de pontos:",
                                                                          ),
                                                                          content:
                                                                              Text(
                                                                                (this.widget.pontuacoes.asMap().containsKey(2) && this.widget.pontuacoes[2].pontuacaoAtributo.asMap().containsKey(5))?"O máximo de pontos para este atributo é "+widget.pontuacoes[2].pontuacaoAtributo[5].quantidade_maxima.toString().replaceAll('.', ',')+".":"Carregando..."),
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
                                                          Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            this.widget.usuario.quantidade_variaveis.toString().replaceAll('.', ','),
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
                                                      width: 641,
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

class Suaspontuacoes extends StatefulWidget {
  double valor;
  Cargo cargo;
  double valor_cargo;
  String titulo_cargo;
  Usuario usuario;
  double quantidade_anos;
  double quantidade_meses;
  double soma;
  List<Pontuacao> pontuacoes;
  Suaspontuacoes({Key? key, required this.valor,required this.cargo,required this.valor_cargo,required this.titulo_cargo,required this.usuario,required this.quantidade_anos,required this.quantidade_meses,required this.pontuacoes,required this.soma}) : super(key: key);
  @override
  @override
  State<StatefulWidget> createState() {
    return _SuaspontuacoesState(this.valor);
  }
}

class TitleSuaspontuacoes extends StatelessWidget {
  double tamanho;
  TitleSuaspontuacoes({Key? key, required this.tamanho}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: tamanho,
      child: const AutoSizeText(
        "Suas Pontuações",
        textAlign: TextAlign.start,
        maxLines: 2,
        style: TextStyle(
          color: Colors.blue,
          fontSize: 30.0,
          fontWeight: FontWeight.w900,
          fontFamily: 'Santana',
        ),
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
        paginaS = 2;
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
