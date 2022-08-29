import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
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

class Tabela extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StateTabela();
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
    return Container(
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

class BotaoTabelasalarial extends StatelessWidget {
  BotaoTabelasalarial({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text(
            "Tabela Salarial",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              // fontWeight: FontWeight.bold,
            ),
          ),
          Icon(Icons.attach_money, color: Colors.white, size: 30.0),
        ],
      ),
    );
  }
}

class _StateTabela extends State<Tabela> {
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
  double linha1 = 10;
  static List<TextEditingController> controllerlinha2 = [
    TextEditingController(text: "50"),
    TextEditingController(text: "60"),
    TextEditingController(text: "70"),
    TextEditingController(text: "80"),
    TextEditingController(text: "90"),
    TextEditingController(text: "100"),
  ];
  static List<TextEditingController> controllerlinha3 = [
    TextEditingController(text: "100"),
    TextEditingController(text: "110"),
    TextEditingController(text: "120"),
    TextEditingController(text: "130"),
    TextEditingController(text: "140"),
    TextEditingController(text: "150"),
  ];
  static List<TextEditingController> controllerlinha4 = [
    TextEditingController(text: "150"),
    TextEditingController(text: "160"),
    TextEditingController(text: "170"),
    TextEditingController(text: "180"),
    TextEditingController(text: "190"),
    TextEditingController(text: "200"),
  ];
  static List<TextEditingController> controllerlinha5 = [
    TextEditingController(text: "200"),
    TextEditingController(text: "210"),
    TextEditingController(text: "220"),
    TextEditingController(text: "230"),
    TextEditingController(text: "240"),
    TextEditingController(text: "250"),
  ];
  static List<TextEditingController> controllerlinha11 = [];
  static List<TextEditingController> controllerlinha22 = [];
  static List<TextEditingController> controllerlinha33 = [];
  static List<TextEditingController> controllerlinha44 = [];
  static List<TextEditingController> controllerlinha55 = [];
  /*controller[0].text = "Professor Graduado";
    controller[1].text = "Professor Especialista";
    controller[2].text = "Professor Mestre";
    controller[3].text = "Professor Doutor";
    controller[4].text = "Professor Livre Docente";*/
  _StateTabela({
    Key? key,
  });
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
                    vertical: 15.0, horizontal: mediaQuery.width * 0.01),
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
                            width: (mediaQuery.width * 0.63),
                            //height: 40,
                            child: SingleChildScrollView(
                              controller: scrollCont,
                              //padding: EdgeInsets.symmetric(
                              //vertical: 10.0, horizontal: mediaQuery.width * 0.1),
                              scrollDirection: Axis.horizontal,
                              child: Column(
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
                                                height: 26.0,
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
                                                      maxHeight: 100),
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
                                                                  "  DE $linha1 A ",
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
                                                                    //maxLines: 3,
                                                                    maxLines:
                                                                        null,
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
                                                        child: TextField(
                                                          textAlign:
                                                              TextAlign.center,
                                                          controller:
                                                              controllerlinha1[
                                                                  0],
                                                          //maxLines: 3,
                                                          maxLines: null,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16.0,
                                                          ),
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
                                                                  "  DE 0 A ",
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
                                                                    //maxLines: 3,
                                                                    maxLines:
                                                                        null,
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
                                                        child: TextField(
                                                          textAlign:
                                                              TextAlign.center,
                                                          controller:
                                                              controllerlinha1[
                                                                  0],
                                                          //maxLines: 3,
                                                          maxLines: null,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16.0,
                                                          ),
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
                                                                  "  DE 0 A ",
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
                                                                    //maxLines: 3,
                                                                    maxLines:
                                                                        null,
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
                                                        child: TextField(
                                                          textAlign:
                                                              TextAlign.center,
                                                          controller:
                                                              controllerlinha1[
                                                                  0],
                                                          //maxLines: 3,
                                                          maxLines: null,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16.0,
                                                          ),
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
                                                                  "  DE 0 A ",
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
                                                                    //maxLines: 3,
                                                                    maxLines:
                                                                        null,
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
                                                        child: TextField(
                                                          textAlign:
                                                              TextAlign.center,
                                                          controller:
                                                              controllerlinha1[
                                                                  0],
                                                          //maxLines: 3,
                                                          maxLines: null,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16.0,
                                                          ),
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
                                                                  "  DE 0 A ",
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
                                                                    //maxLines: 3,
                                                                    maxLines:
                                                                        null,
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
                                                        child: TextField(
                                                          textAlign:
                                                              TextAlign.center,
                                                          controller:
                                                              controllerlinha1[
                                                                  0],
                                                          //maxLines: 3,
                                                          maxLines: null,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16.0,
                                                          ),
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
                                                        maxHeight: 100),
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
                                                                    "  DE 0 A ",
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
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          null,
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
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerlinha1[
                                                                    0],
                                                            //maxLines: 3,
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
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
                                                                    "  DE 0 A ",
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
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          null,
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
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerlinha1[
                                                                    0],
                                                            //maxLines: 3,
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
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
                                                                    "  DE 0 A ",
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
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          null,
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
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerlinha1[
                                                                    0],
                                                            //maxLines: 3,
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
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
                                                                    "  DE 0 A ",
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
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          null,
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
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerlinha1[
                                                                    0],
                                                            //maxLines: 3,
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
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
                                                                    "  DE 0 A ",
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
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          null,
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
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerlinha1[
                                                                    0],
                                                            //maxLines: 3,
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
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
                                                        maxHeight: 100),
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
                                                                    "  DE 0 A ",
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
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          null,
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
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerlinha1[
                                                                    0],
                                                            //maxLines: 3,
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
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
                                                                    "  DE 0 A ",
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
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          null,
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
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerlinha1[
                                                                    0],
                                                            //maxLines: 3,
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
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
                                                                    "  DE 0 A ",
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
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          null,
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
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerlinha1[
                                                                    0],
                                                            //maxLines: 3,
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
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
                                                                    "  DE 0 A ",
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
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          null,
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
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerlinha1[
                                                                    0],
                                                            //maxLines: 3,
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
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
                                                                    "  DE 0 A ",
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
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          null,
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
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerlinha1[
                                                                    0],
                                                            //maxLines: 3,
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
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
                                                        maxHeight: 100),
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
                                                                    "  DE 0 A ",
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
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          null,
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
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerlinha1[
                                                                    0],
                                                            //maxLines: 3,
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
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
                                                                    "  DE 0 A ",
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
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          null,
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
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerlinha1[
                                                                    0],
                                                            //maxLines: 3,
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
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
                                                                    "  DE 0 A ",
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
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          null,
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
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerlinha1[
                                                                    0],
                                                            //maxLines: 3,
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
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
                                                                    "  DE 0 A ",
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
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          null,
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
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerlinha1[
                                                                    0],
                                                            //maxLines: 3,
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
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
                                                                    "  DE 0 A ",
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
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          null,
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
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerlinha1[
                                                                    0],
                                                            //maxLines: 3,
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
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
                                                        maxHeight: 100),
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
                                                                    "  DE 0 A ",
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
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          null,
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
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerlinha1[
                                                                    0],
                                                            //maxLines: 3,
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
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
                                                                    "  DE 0 A ",
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
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          null,
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
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerlinha1[
                                                                    0],
                                                            //maxLines: 3,
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
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
                                                                    "  DE 0 A ",
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
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          null,
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
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerlinha1[
                                                                    0],
                                                            //maxLines: 3,
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
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
                                                                    "  DE 0 A ",
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
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          null,
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
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerlinha1[
                                                                    0],
                                                            //maxLines: 3,
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
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
                                                                    "  DE 0 A ",
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
                                                                      //maxLines: 3,
                                                                      maxLines:
                                                                          null,
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
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerlinha1[
                                                                    0],
                                                            //maxLines: 3,
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
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
                                        ],
                                      )))
                                ],
                              ),
                            ),
                            //height: double.infinity,
                          ),
                          //  ],)
                          //Row(children: [
                          //Row(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          //children: [

                          //],//)

                          //],)
                        ],
                      ),
                      //Row(
                      // mainAxisAlignment:MainAxisAlignment.start,
                      //children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          BotaoTabelasalarial(),
                          //Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          //children: [
                          SizedBox(
                            width: (mediaQuery.width * 0.3) - 160,
                          ),
                          Container(
                              width: ind == 0 ? 10 : 5,
                              height: ind == 0 ? 10 : 5,
                              margin: EdgeInsets.symmetric(
                                  horizontal: mediaQuery.width * 0.01),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: ind == 0
                                      ? Colors.blue
                                      : Colors.grey[300]),
                              child: OutlinedButton(
                                onPressed: () {
                                  scrollTo(0);
                                },
                                child: Text("teste"),
                              )),
                          //],),
                          Container(
                              width: ind == 1 ? 10 : 5,
                              height: ind == 1 ? 10 : 5,
                              margin: EdgeInsets.symmetric(
                                  horizontal: mediaQuery.width * 0.01),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: ind == 1
                                      ? Colors.blue
                                      : Colors.grey[300]),
                              child: OutlinedButton(
                                onPressed: () {
                                  scrollTo(1);
                                },
                                child: Text("teste"),
                              )),
                        ],
                      )
                      //],)
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
