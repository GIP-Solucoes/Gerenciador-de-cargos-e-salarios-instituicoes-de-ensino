import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/name_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/sistema_content.dart';
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

class Tabela extends StatefulWidget {
  double valor;
  Tabela({
    Key? key,required this.valor
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
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
                // fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BotaoSalvar extends StatelessWidget {
  BotaoSalvar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              // fontWeight: FontWeight.bold,
            ),
          ),
        ],
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
                // fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BotaoNovafaixasalarial extends StatelessWidget {
  BotaoNovafaixasalarial({
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
          Icon(Icons.add_circle, color: Colors.white, size: 15.0),
          Text(
            " NOVA FAIXA SALARIAL",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _StateTabela extends State<Tabela> {
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
    scrollCont = ScrollController();
    scrollCont.addListener(changeTabs);
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
  /*final whatIDo = [
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
      iconData: Icons.file_copy, //file copy
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
  ];*/
  @override
  Widget build(BuildContext context) {
    int quantidadel = 2;
    final mediaQuery = MediaQuery.of(context).size;
    mediaQueryx = mediaQuery.width;
    return Builder(builder: (BuildContext context) {
      tabContext = context;
      return Container(
        height: 400,
        width: 1000,
        //margin: const EdgeInsets.all(20),
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
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Column(children: [
                          SizedBox(
                            width: (mediaQuery.width * valor),
                            //height: 40,
                            child: SingleChildScrollView(
                              controller: scrollCont,
                              //padding: EdgeInsets.symmetric(
                              //vertical: 10.0, horizontal: mediaQuery.width * 0.1),
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        key: categorias[0],
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
                                            //Row(

                                            //children: [
                                            Text(
                                              "Nome do cargo",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                                // fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            //],
                                            //),
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
                                            width: (132 * 5) - 2,
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
                                                    // fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                key: categorias[1],
                                                alignment: Alignment.center,
                                                width: 130.0,
                                                height: 30.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue[300],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "A",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        // fontWeight: FontWeight.bold,
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
                                                width: 130.0,
                                                height: 30.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue[300],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "B",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        // fontWeight: FontWeight.bold,
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
                                                width: 130.0,
                                                height: 30.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue[300],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "C",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        // fontWeight: FontWeight.bold,
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
                                                width: 130.0,
                                                height: 30.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue[300],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "D",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold,

                                                        // fontWeight: FontWeight.bold,
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
                                                width: 130.0,
                                                height: 30.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue[300],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "E",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold,

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

                                      /*SizedBox(
                                        width: 2,
                                      ),*/
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  SizedBox(
                                      height: 250,
                                      child: SingleChildScrollView(
                                          child: Column(
                                        children: [
                                          //Container(
                                          //height: 100,
                                          //key: _key1,
                                          /*child: */ IntrinsicHeight(
                                            child: Row(
                                              //mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Container(
                                                  alignment: Alignment.center,
                                                  //width: 209.0,
                                                  //height: 40.0,
                                                  constraints: BoxConstraints(
                                                      maxHeight: 95),
                                                  width: 209.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  child:
                                                      //Row(

                                                      //children: [
                                                      TextField(
                                                    maxLines: null,
                                                    controller: controller[0],
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.0,

                                                      //fontWeight: FontWeight.bold,
                                                      // fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  //],
                                                  //),
                                                ),
                                                Container(
                                                  width: 2,
                                                ),
                                                //Column(children: [
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        //constraints: BoxConstraints(maxHeight: 50),
                                                        child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width: 130,
                                                            //height: _key1.currentContext.size!.height,
                                                            // constraints: BoxConstraints(maxHeight: 50),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .grey[400],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  "  DE ",
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
                                                                Flexible(
                                                                  child:
                                                                      TextField(
                                                                    controller:
                                                                        controllerlinha1[
                                                                            0],
                                                                    maxLines: 1,
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
                                                                ),
                                                                Text(
                                                                  " A ",
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
                                                                Flexible(
                                                                  child:
                                                                      TextField(
                                                                    controller:
                                                                        controllerlinha1[
                                                                            1],
                                                                    maxLines: 1,
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
                                                                    onChanged:
                                                                        (value) =>
                                                                            {
                                                                      setState(
                                                                        () {
                                                                          linha11 =
                                                                              double.parse(controllerlinha1[1].text) + 1;
                                                                        },
                                                                      )
                                                                    },
                                                                  ),
                                                                )
                                                                /**/
                                                              ],
                                                            )),
                                                      ),
                                                      Container(
                                                        alignment:
                                                            Alignment.center,

                                                        width: 130,
                                                        //height: 300,
                                                        //height: _key1.currentContext.size!.height,
                                                        //constraints: BoxConstraints(maxHeight: 50),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "R\$ ",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16.0,
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: TextField(
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                controller:
                                                                    controllerlinha11[
                                                                        0],
                                                                maxLines: 1,
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
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
                                                //)

                                                //],),

                                                SizedBox(
                                                  width: 2,
                                                ),
                                                Container(
                                                  //constraints: BoxConstraints(maxHeight: 100),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width: 130,
                                                            //height: _key1.currentContext.size!.height,
                                                            // constraints: BoxConstraints(maxHeight: 50),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .grey[400],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  "  DE $linha11 A ",
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
                                                                Flexible(
                                                                  child:
                                                                      TextField(
                                                                    controller:
                                                                        controllerlinha1[
                                                                            2],
                                                                    maxLines: 1,
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
                                                                    onChanged:
                                                                        (value) =>
                                                                            {
                                                                      setState(
                                                                        () {
                                                                          linha12 =
                                                                              double.parse(controllerlinha1[2].text) + 1;
                                                                        },
                                                                      )
                                                                    },
                                                                  ),
                                                                )
                                                                /**/
                                                              ],
                                                            )),
                                                      ),
                                                      Container(
                                                        alignment:
                                                            Alignment.center,

                                                        width: 130,
                                                        //height: 300,
                                                        //height: _key1.currentContext.size!.height,
                                                        //constraints: BoxConstraints(maxHeight: 50),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "R\$ ",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16.0,
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: TextField(
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                controller:
                                                                    controllerlinha11[
                                                                        1],
                                                                maxLines: 1,
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
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

                                                SizedBox(
                                                  width: 2,
                                                ),
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width: 130,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .grey[400],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  "  DE $linha12 A ",
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
                                                                Flexible(
                                                                  child:
                                                                      TextField(
                                                                    controller:
                                                                        controllerlinha1[
                                                                            3],
                                                                    maxLines: 1,
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
                                                                    onChanged:
                                                                        (value) =>
                                                                            {
                                                                      setState(
                                                                        () {
                                                                          linha13 =
                                                                              double.parse(controllerlinha1[3].text) + 1;
                                                                        },
                                                                      )
                                                                    },
                                                                  ),
                                                                )
                                                                /**/
                                                              ],
                                                            )),
                                                      ),
                                                      Container(
                                                        alignment:
                                                            Alignment.center,

                                                        width: 130,
                                                        //height: 300,
                                                        //height: _key1.currentContext.size!.height,
                                                        //constraints: BoxConstraints(maxHeight: 50),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "R\$ ",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16.0,
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: TextField(
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                controller:
                                                                    controllerlinha11[
                                                                        2],
                                                                maxLines: 1,
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
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
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                Container(
                                                  //constraints: BoxConstraints(maxHeight: 100),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        //constraints: BoxConstraints(maxHeight: 50),
                                                        child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width: 130,
                                                            //height: _key1.currentContext.size!.height,
                                                            // constraints: BoxConstraints(maxHeight: 50),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .grey[400],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  "  DE $linha13 A ",
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
                                                                Flexible(
                                                                  child:
                                                                      TextField(
                                                                    controller:
                                                                        controllerlinha1[
                                                                            4],
                                                                    maxLines: 1,
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
                                                                    onChanged:
                                                                        (value) =>
                                                                            {
                                                                      setState(
                                                                        () {
                                                                          linha14 =
                                                                              double.parse(controllerlinha1[4].text) + 1;
                                                                        },
                                                                      )
                                                                    },
                                                                  ),
                                                                )
                                                                /**/
                                                              ],
                                                            )),
                                                      ),
                                                      Container(
                                                        alignment:
                                                            Alignment.center,

                                                        width: 130,
                                                        //height: 300,
                                                        //height: _key1.currentContext.size!.height,
                                                        //constraints: BoxConstraints(maxHeight: 50),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "R\$ ",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16.0,
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: TextField(
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                controller:
                                                                    controllerlinha11[
                                                                        3],
                                                                maxLines: 1,
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
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
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                Container(
                                                  //constraints: BoxConstraints(maxHeight: 100),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        //constraints: BoxConstraints(maxHeight: 50),
                                                        child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width: 130,
                                                            //height: _key1.currentContext.size!.height,
                                                            // constraints: BoxConstraints(maxHeight: 50),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .grey[400],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  "  DE $linha14 A ",
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
                                                                Flexible(
                                                                  child:
                                                                      TextField(
                                                                    controller:
                                                                        controllerlinha1[
                                                                            5],
                                                                    maxLines: 1,
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
                                                                )
                                                                /**/
                                                              ],
                                                            )),
                                                      ),
                                                      Container(
                                                        alignment:
                                                            Alignment.center,

                                                        width: 130,
                                                        //height: 300,
                                                        //height: _key1.currentContext.size!.height,
                                                        //constraints: BoxConstraints(maxHeight: 50),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "R\$ ",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16.0,
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: TextField(
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                controller:
                                                                    controllerlinha11[
                                                                        4],
                                                                //maxLines: 3,
                                                                maxLines: 1,
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
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
                                              ],
                                            ),
                                          ), //),
                                          SizedBox(height: 2),
                                          Container(
                                            constraints:
                                                BoxConstraints(maxHeight: 100),
                                            //key: _key1,
                                            child: IntrinsicHeight(
                                              child: Row(
                                                //mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    //width: 209.0,
                                                    //height: 40.0,
                                                    constraints: BoxConstraints(
                                                        maxHeight: 95),
                                                    width: 209.0,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    child:
                                                        //Row(

                                                        //children: [
                                                        TextField(
                                                      maxLines: null,
                                                      controller: controller[1],
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16.0,

                                                        //fontWeight: FontWeight.bold,
                                                        // fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    //],
                                                    //),
                                                  ),
                                                  Container(
                                                    width: 2,
                                                  ),
                                                  //Column(children: [
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 130,
                                                              //height: _key1.currentContext.size!.height,
                                                              // constraints: BoxConstraints(maxHeight: 50),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey[400],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "  DE ",
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
                                                                  Flexible(
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          controllerlinha2[
                                                                              0],
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          1,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    " A ",
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
                                                                  Flexible(
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          controllerlinha2[
                                                                              1],
                                                                      maxLines:
                                                                          1,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                      onChanged:
                                                                          (value) =>
                                                                              {
                                                                        setState(
                                                                          () {
                                                                            linha22 =
                                                                                double.parse(controllerlinha2[1].text) + 1;
                                                                          },
                                                                        )
                                                                      },
                                                                    ),
                                                                  )
                                                                  /**/
                                                                ],
                                                              )),
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,

                                                          width: 130,
                                                          //height: 300,
                                                          //height: _key1.currentContext.size!.height,
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "R\$ ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    TextField(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  controller:
                                                                      controllerlinha22[
                                                                          0],
                                                                  //maxLines: 3,
                                                                  maxLines: 1,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
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
                                                  //)

                                                  //],),

                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    //constraints: BoxConstraints(maxHeight: 100),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 130,
                                                              //height: _key1.currentContext.size!.height,
                                                              // constraints: BoxConstraints(maxHeight: 50),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey[400],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "  DE $linha21 A ",
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
                                                                  Flexible(
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          controllerlinha2[
                                                                              2],
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          1,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                      onChanged:
                                                                          (value) =>
                                                                              {
                                                                        setState(
                                                                          () {
                                                                            linha22 =
                                                                                double.parse(controllerlinha2[2].text) + 1;
                                                                          },
                                                                        )
                                                                      },
                                                                    ),
                                                                  )
                                                                  /**/
                                                                ],
                                                              )),
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,

                                                          width: 130,
                                                          //height: 300,
                                                          //height: _key1.currentContext.size!.height,
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "R\$ ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    TextField(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  controller:
                                                                      controllerlinha22[
                                                                          1],
                                                                  //maxLines: 3,
                                                                  maxLines: 1,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
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

                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    //constraints: BoxConstraints(maxHeight: 100),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 130,
                                                              //height: _key1.currentContext.size!.height,
                                                              // constraints: BoxConstraints(maxHeight: 50),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey[400],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "  DE $linha22 A ",
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
                                                                  Flexible(
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          controllerlinha2[
                                                                              3],
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          1,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                      onChanged:
                                                                          (value) =>
                                                                              {
                                                                        setState(
                                                                          () {
                                                                            linha23 =
                                                                                double.parse(controllerlinha2[3].text) + 1;
                                                                          },
                                                                        )
                                                                      },
                                                                    ),
                                                                  )
                                                                  /**/
                                                                ],
                                                              )),
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,

                                                          width: 130,
                                                          //height: 300,
                                                          //height: _key1.currentContext.size!.height,
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "R\$ ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    TextField(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  controller:
                                                                      controllerlinha22[
                                                                          2],
                                                                  //maxLines: 3,
                                                                  maxLines: 1,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
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
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    //constraints: BoxConstraints(maxHeight: 100),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 130,
                                                              //height: _key1.currentContext.size!.height,
                                                              // constraints: BoxConstraints(maxHeight: 50),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey[400],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "  DE $linha23 A ",
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
                                                                  Flexible(
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          controllerlinha2[
                                                                              4],
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          1,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                      onChanged:
                                                                          (value) =>
                                                                              {
                                                                        setState(
                                                                          () {
                                                                            linha24 =
                                                                                double.parse(controllerlinha2[4].text) + 1;
                                                                          },
                                                                        )
                                                                      },
                                                                    ),
                                                                  )
                                                                  /**/
                                                                ],
                                                              )),
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,

                                                          width: 130,
                                                          //height: 300,
                                                          //height: _key1.currentContext.size!.height,
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "R\$ ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    TextField(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  controller:
                                                                      controllerlinha22[
                                                                          3],
                                                                  //maxLines: 3,
                                                                  maxLines: 1,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
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
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    //constraints: BoxConstraints(maxHeight: 100),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 130,
                                                              //height: _key1.currentContext.size!.height,
                                                              // constraints: BoxConstraints(maxHeight: 50),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey[400],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "  DE $linha24 A ",
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
                                                                  Flexible(
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          controllerlinha2[
                                                                              5],
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          1,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  )
                                                                  /**/
                                                                ],
                                                              )),
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,

                                                          width: 130,
                                                          //height: 300,
                                                          //height: _key1.currentContext.size!.height,
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "R\$ ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    TextField(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  controller:
                                                                      controllerlinha22[
                                                                          4],
                                                                  //maxLines: 3,
                                                                  maxLines: 1,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 2),
                                          Container(
                                            constraints:
                                                BoxConstraints(maxHeight: 100),
                                            //key: _key1,
                                            child: IntrinsicHeight(
                                              child: Row(
                                                //mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    //width: 209.0,
                                                    //height: 40.0,
                                                    constraints: BoxConstraints(
                                                        maxHeight: 95),
                                                    width: 209.0,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    child:
                                                        //Row(

                                                        //children: [
                                                        TextField(
                                                      maxLines: null,
                                                      controller: controller[2],
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16.0,

                                                        //fontWeight: FontWeight.bold,
                                                        // fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    //],
                                                    //),
                                                  ),
                                                  Container(
                                                    width: 2,
                                                  ),
                                                  //Column(children: [
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 130,
                                                              //height: _key1.currentContext.size!.height,
                                                              // constraints: BoxConstraints(maxHeight: 50),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey[400],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "  DE ",
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
                                                                  Flexible(
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          controllerlinha3[
                                                                              0],
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          1,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    " A ",
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
                                                                  Flexible(
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          controllerlinha3[
                                                                              1],
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          1,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                      onChanged:
                                                                          (value) =>
                                                                              {
                                                                        setState(
                                                                          () {
                                                                            linha31 =
                                                                                double.parse(controllerlinha3[1].text) + 1;
                                                                          },
                                                                        )
                                                                      },
                                                                    ),
                                                                  )
                                                                  /**/
                                                                ],
                                                              )),
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,

                                                          width: 130,
                                                          //height: 300,
                                                          //height: _key1.currentContext.size!.height,
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "R\$ ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    TextField(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  controller:
                                                                      controllerlinha33[
                                                                          0],
                                                                  //maxLines: 3,
                                                                  maxLines: 1,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
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
                                                  //)

                                                  //],),

                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    //constraints: BoxConstraints(maxHeight: 100),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 130,
                                                              //height: _key1.currentContext.size!.height,
                                                              // constraints: BoxConstraints(maxHeight: 50),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey[400],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "  DE $linha31 A ",
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
                                                                  Flexible(
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          controllerlinha3[
                                                                              2],
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          1,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                      onChanged:
                                                                          (value) =>
                                                                              {
                                                                        setState(
                                                                          () {
                                                                            linha32 =
                                                                                double.parse(controllerlinha3[2].text) + 1;
                                                                          },
                                                                        )
                                                                      },
                                                                    ),
                                                                  )
                                                                  /**/
                                                                ],
                                                              )),
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,

                                                          width: 130,
                                                          //height: 300,
                                                          //height: _key1.currentContext.size!.height,
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "R\$ ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    TextField(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  controller:
                                                                      controllerlinha33[
                                                                          1],
                                                                  //maxLines: 3,
                                                                  maxLines: 1,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
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

                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    //constraints: BoxConstraints(maxHeight: 100),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 130,
                                                              //height: _key1.currentContext.size!.height,
                                                              // constraints: BoxConstraints(maxHeight: 50),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey[400],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "  DE $linha32 A ",
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
                                                                  Flexible(
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          controllerlinha3[
                                                                              3],
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          1,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                      onChanged:
                                                                          (value) =>
                                                                              {
                                                                        setState(
                                                                          () {
                                                                            linha33 =
                                                                                double.parse(controllerlinha3[3].text) + 1;
                                                                          },
                                                                        )
                                                                      },
                                                                    ),
                                                                  )
                                                                  /**/
                                                                ],
                                                              )),
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,

                                                          width: 130,
                                                          //height: 300,
                                                          //height: _key1.currentContext.size!.height,
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "R\$ ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    TextField(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  controller:
                                                                      controllerlinha33[
                                                                          2],
                                                                  maxLines: 1,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
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
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    //constraints: BoxConstraints(maxHeight: 100),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 130,
                                                              //height: _key1.currentContext.size!.height,
                                                              // constraints: BoxConstraints(maxHeight: 50),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey[400],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "  DE $linha33 A ",
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
                                                                  Flexible(
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          controllerlinha3[
                                                                              4],
                                                                      maxLines:
                                                                          1,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                      onChanged:
                                                                          (value) =>
                                                                              {
                                                                        setState(
                                                                          () {
                                                                            linha34 =
                                                                                double.parse(controllerlinha3[4].text) + 1;
                                                                          },
                                                                        )
                                                                      },
                                                                    ),
                                                                  )
                                                                  /**/
                                                                ],
                                                              )),
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,

                                                          width: 130,
                                                          //height: 300,
                                                          //height: _key1.currentContext.size!.height,
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "R\$ ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    TextField(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  controller:
                                                                      controllerlinha33[
                                                                          3],
                                                                  maxLines: 1,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
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
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    //constraints: BoxConstraints(maxHeight: 100),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 130,
                                                              //height: _key1.currentContext.size!.height,
                                                              // constraints: BoxConstraints(maxHeight: 50),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey[400],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "  DE $linha34 A ",
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
                                                                  Flexible(
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          controllerlinha3[
                                                                              5],
                                                                      maxLines:
                                                                          1,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  )
                                                                  /**/
                                                                ],
                                                              )),
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,

                                                          width: 130,
                                                          //height: 300,
                                                          //height: _key1.currentContext.size!.height,
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "R\$ ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    TextField(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  controller:
                                                                      controllerlinha33[
                                                                          4],
                                                                  maxLines: 1,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 2),
                                          Container(
                                            constraints:
                                                BoxConstraints(maxHeight: 100),
                                            //key: _key1,
                                            child: IntrinsicHeight(
                                              child: Row(
                                                //mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    //width: 209.0,
                                                    //height: 40.0,
                                                    constraints: BoxConstraints(
                                                        maxHeight: 95),
                                                    width: 209.0,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    child: TextField(
                                                      maxLines: null,
                                                      controller: controller[3],
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16.0,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 2,
                                                  ),
                                                  //Column(children: [
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 130,
                                                              //height: _key1.currentContext.size!.height,
                                                              // constraints: BoxConstraints(maxHeight: 50),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey[400],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "  DE ",
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
                                                                  Flexible(
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          controllerlinha4[
                                                                              0],
                                                                      maxLines:
                                                                          1,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    " A ",
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
                                                                  Flexible(
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          controllerlinha4[
                                                                              1],
                                                                      maxLines:
                                                                          1,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                      onChanged:
                                                                          (value) =>
                                                                              {
                                                                        setState(
                                                                          () {
                                                                            linha41 =
                                                                                double.parse(controllerlinha4[1].text) + 1;
                                                                          },
                                                                        )
                                                                      },
                                                                    ),
                                                                  )
                                                                  /**/
                                                                ],
                                                              )),
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,

                                                          width: 130,
                                                          //height: 300,
                                                          //height: _key1.currentContext.size!.height,
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "R\$ ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    TextField(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  controller:
                                                                      controllerlinha44[
                                                                          0],
                                                                  maxLines: 1,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
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
                                                  //)

                                                  //],),

                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    //constraints: BoxConstraints(maxHeight: 100),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 130,
                                                              //height: _key1.currentContext.size!.height,
                                                              // constraints: BoxConstraints(maxHeight: 50),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey[400],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "  DE $linha41 A ",
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
                                                                  Flexible(
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          controllerlinha4[
                                                                              2],
                                                                      maxLines:
                                                                          1,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                      onChanged:
                                                                          (value) =>
                                                                              {
                                                                        setState(
                                                                          () {
                                                                            linha42 =
                                                                                double.parse(controllerlinha4[2].text) + 1;
                                                                          },
                                                                        )
                                                                      },
                                                                    ),
                                                                  )
                                                                  /**/
                                                                ],
                                                              )),
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,

                                                          width: 130,
                                                          //height: 300,
                                                          //height: _key1.currentContext.size!.height,
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "R\$ ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    TextField(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  controller:
                                                                      controllerlinha44[
                                                                          1],
                                                                  maxLines: 1,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
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

                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    //constraints: BoxConstraints(maxHeight: 100),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 130,
                                                              //height: _key1.currentContext.size!.height,
                                                              // constraints: BoxConstraints(maxHeight: 50),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey[400],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "  DE $linha42 A ",
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
                                                                  Flexible(
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          controllerlinha4[
                                                                              3],
                                                                      maxLines:
                                                                          1,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                      onChanged:
                                                                          (value) =>
                                                                              {
                                                                        setState(
                                                                          () {
                                                                            linha43 =
                                                                                double.parse(controllerlinha4[3].text) + 1;
                                                                          },
                                                                        )
                                                                      },
                                                                    ),
                                                                  )
                                                                  /**/
                                                                ],
                                                              )),
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,

                                                          width: 130,
                                                          //height: 300,
                                                          //height: _key1.currentContext.size!.height,
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "R\$ ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    TextField(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  controller:
                                                                      controllerlinha44[
                                                                          2],
                                                                  maxLines: 1,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
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
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    //constraints: BoxConstraints(maxHeight: 100),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 130,
                                                              //height: _key1.currentContext.size!.height,
                                                              // constraints: BoxConstraints(maxHeight: 50),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey[400],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "  DE $linha43 A ",
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
                                                                  Flexible(
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          controllerlinha4[
                                                                              4],
                                                                      maxLines:
                                                                          1,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                      onChanged:
                                                                          (value) =>
                                                                              {
                                                                        setState(
                                                                          () {
                                                                            linha44 =
                                                                                double.parse(controllerlinha4[4].text) + 1;
                                                                          },
                                                                        )
                                                                      },
                                                                    ),
                                                                  )
                                                                  /**/
                                                                ],
                                                              )),
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,

                                                          width: 130,
                                                          //height: 300,
                                                          //height: _key1.currentContext.size!.height,
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "R\$ ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    TextField(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  controller:
                                                                      controllerlinha44[
                                                                          3],
                                                                  maxLines: 1,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
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
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    //constraints: BoxConstraints(maxHeight: 100),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 130,
                                                              //height: _key1.currentContext.size!.height,
                                                              // constraints: BoxConstraints(maxHeight: 50),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey[400],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "  DE $linha44 A ",
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
                                                                  Flexible(
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          controllerlinha4[
                                                                              5],
                                                                      maxLines:
                                                                          1,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  )
                                                                  /**/
                                                                ],
                                                              )),
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,

                                                          width: 130,
                                                          //height: 300,
                                                          //height: _key1.currentContext.size!.height,
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "R\$ ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    TextField(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  controller:
                                                                      controllerlinha44[
                                                                          4],
                                                                  maxLines: 1,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 2),
                                          Container(
                                            constraints:
                                                BoxConstraints(maxHeight: 100),
                                            //key: _key1,
                                            child: IntrinsicHeight(
                                              child: Row(
                                                //mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    //width: 209.0,
                                                    //height: 40.0,
                                                    constraints: BoxConstraints(
                                                        maxHeight: 95),
                                                    width: 209.0,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    child:
                                                        //Row(

                                                        //children: [
                                                        TextField(
                                                      maxLines: null,
                                                      controller: controller[4],
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16.0,

                                                        //fontWeight: FontWeight.bold,
                                                        // fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    //],
                                                    //),
                                                  ),
                                                  Container(
                                                    width: 2,
                                                  ),
                                                  //Column(children: [
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 130,
                                                              //height: _key1.currentContext.size!.height,
                                                              // constraints: BoxConstraints(maxHeight: 50),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey[400],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "  DE ",
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
                                                                  Flexible(
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          controllerlinha5[
                                                                              0],
                                                                      maxLines:
                                                                          1,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    " A ",
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
                                                                  Flexible(
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          controllerlinha5[
                                                                              1],
                                                                      maxLines:
                                                                          1,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                      onChanged:
                                                                          (value) =>
                                                                              {
                                                                        setState(
                                                                          () {
                                                                            linha51 =
                                                                                double.parse(controllerlinha5[1].text) + 1;
                                                                          },
                                                                        )
                                                                      },
                                                                    ),
                                                                  )
                                                                  /**/
                                                                ],
                                                              )),
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,

                                                          width: 130,
                                                          //height: 300,
                                                          //height: _key1.currentContext.size!.height,
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "R\$ ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    TextField(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  controller:
                                                                      controllerlinha55[
                                                                          0],
                                                                  maxLines: 1,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
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
                                                  //)

                                                  //],),

                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    //constraints: BoxConstraints(maxHeight: 100),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 130,
                                                              //height: _key1.currentContext.size!.height,
                                                              // constraints: BoxConstraints(maxHeight: 50),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey[400],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "  DE $linha51 A ",
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
                                                                  Flexible(
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          controllerlinha5[
                                                                              2],
                                                                      maxLines:
                                                                          1,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                      onChanged:
                                                                          (value) =>
                                                                              {
                                                                        setState(
                                                                          () {
                                                                            linha52 =
                                                                                double.parse(controllerlinha5[2].text) + 1;
                                                                          },
                                                                        )
                                                                      },
                                                                    ),
                                                                  )
                                                                  /**/
                                                                ],
                                                              )),
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,

                                                          width: 130,
                                                          //height: 300,
                                                          //height: _key1.currentContext.size!.height,
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "R\$ ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    TextField(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  controller:
                                                                      controllerlinha55[
                                                                          1],
                                                                  maxLines: 1,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
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

                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    //constraints: BoxConstraints(maxHeight: 100),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 130,
                                                              //height: _key1.currentContext.size!.height,
                                                              // constraints: BoxConstraints(maxHeight: 50),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey[400],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "  DE $linha52 A ",
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
                                                                  Flexible(
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          controllerlinha5[
                                                                              3],
                                                                      maxLines:
                                                                          1,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                      onChanged:
                                                                          (value) =>
                                                                              {
                                                                        setState(
                                                                          () {
                                                                            linha53 =
                                                                                double.parse(controllerlinha5[3].text) + 1;
                                                                          },
                                                                        )
                                                                      },
                                                                    ),
                                                                  )
                                                                  /**/
                                                                ],
                                                              )),
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,

                                                          width: 130,
                                                          //height: 300,
                                                          //height: _key1.currentContext.size!.height,
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "R\$ ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    TextField(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  controller:
                                                                      controllerlinha55[
                                                                          2],
                                                                  maxLines: 1,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
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
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    //constraints: BoxConstraints(maxHeight: 100),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 130,
                                                              //height: _key1.currentContext.size!.height,
                                                              // constraints: BoxConstraints(maxHeight: 50),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey[400],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "  DE $linha53 A ",
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
                                                                  Flexible(
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          controllerlinha5[
                                                                              4],
                                                                      maxLines:
                                                                          1,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                      onChanged:
                                                                          (value) =>
                                                                              {
                                                                        setState(
                                                                          () {
                                                                            linha54 =
                                                                                double.parse(controllerlinha5[4].text) + 1;
                                                                          },
                                                                        )
                                                                      },
                                                                    ),
                                                                  )
                                                                  /**/
                                                                ],
                                                              )),
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,

                                                          width: 130,
                                                          //height: 300,
                                                          //height: _key1.currentContext.size!.height,
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "R\$ ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    TextField(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  controller:
                                                                      controllerlinha55[
                                                                          3],
                                                                  maxLines: 1,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
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
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    //constraints: BoxConstraints(maxHeight: 100),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 130,
                                                              //height: _key1.currentContext.size!.height,
                                                              // constraints: BoxConstraints(maxHeight: 50),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey[400],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "  DE $linha54 A ",
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
                                                                  Flexible(
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          controllerlinha5[
                                                                              5],
                                                                      maxLines:
                                                                          1,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  )
                                                                  /**/
                                                                ],
                                                              )),
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,

                                                          width: 130,
                                                          //height: 300,
                                                          //height: _key1.currentContext.size!.height,
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "R\$ ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    TextField(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  controller:
                                                                      controllerlinha55[
                                                                          4],
                                                                  maxLines: 1,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ))),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 211.0,
                                        height: 20,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 130,
                                        child: IconButton(
                                          icon: const Icon(Icons.cancel),
                                          color: Colors.red,
                                          onPressed: () {},
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 130,
                                        child: IconButton(
                                          icon: const Icon(Icons.cancel),
                                          color: Colors.red,
                                          onPressed: () {},
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 130,
                                        child: IconButton(
                                          icon: const Icon(Icons.cancel),
                                          color: Colors.red,
                                          onPressed: () {},
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 130,
                                        child: IconButton(
                                          icon: const Icon(Icons.cancel),
                                          color: Colors.red,
                                          onPressed: () {},
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 130,
                                        child: IconButton(
                                          icon: const Icon(Icons.cancel),
                                          color: Colors.red,
                                          onPressed: () {},
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: (mediaQuery.width * 0.3) - 160,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ])),
            /*const SizedBox(
                height: 20,
              ),*/
          ],
        ),
      );
    });
  }
}
