import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/name_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/sistema_content.dart';

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

class Resultados extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StateResultados();
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

class BotaoNovostatus extends StatelessWidget {
  BotaoNovostatus({
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
          Icon(Icons.add_circle, color: Colors.white, size: 15.0),
          Text(
            " NOVO STATUS",
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

class _StateResultados extends State<Resultados> {
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
  final dropValue = ValueNotifier('');
  final dropOpcoes = [
    'Considera',
    'Não considera',
  ];

  _StateResultados({
    Key? key,
  });

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
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: (mediaQuery.width * 0.63) / 1.75,
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
                                                //Row(

                                                //children: [
                                                Text(
                                                  "Nome",
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
                                            width: 40,
                                            height: 40,
                                          ),
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
                                              Container(
                                                  constraints: BoxConstraints(
                                                      maxHeight: 100),
                                                  //key: _key1,
                                                  child: IntrinsicHeight(
                                                    child: Row(
                                                      //mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          //width: 209.0,
                                                          //height: 40.0,
                                                          width: 209.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child:
                                                              //Row(

                                                              //children: [
                                                              TextField(
                                                            maxLines: null,
                                                            controller:
                                                                controllercoluna1[
                                                                    0],
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                                                        /*Expanded(child:*/ Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width: 150,
                                                            //height: 300,
                                                            //height: _key1.currentContext.size!.height,
                                                            //constraints: BoxConstraints(maxHeight: 50),
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
                                                                        dropValue,
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
                                                                            dropOpcoes[0]),
                                                                        value: (value.isEmpty)
                                                                            ? null
                                                                            : value,
                                                                        onChanged:
                                                                            (escolha) {
                                                                          dropValue.value =
                                                                              escolha.toString();
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
                                                            )), //)

                                                        //],),

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
                                                            onPressed: () {},
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                              SizedBox(height: 2),
                                              Container(
                                                  constraints: BoxConstraints(
                                                      maxHeight: 100),
                                                  //key: _key1,
                                                  child: IntrinsicHeight(
                                                    child: Row(
                                                      //mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          //width: 209.0,
                                                          //height: 40.0,
                                                          width: 209.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child:
                                                              //Row(

                                                              //children: [
                                                              TextField(
                                                            maxLines: null,
                                                            controller:
                                                                controllercoluna1[
                                                                    1],
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                                                        /*Expanded(child:*/ Container(
                                                          alignment:
                                                              Alignment.center,

                                                          width: 150,
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
                                                          child:
                                                              ValueListenableBuilder(
                                                                  valueListenable:
                                                                      dropValue,
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
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                          ),
                                                                          dropOpcoes[1]),
                                                                      value: (value
                                                                              .isEmpty)
                                                                          ? null
                                                                          : value,
                                                                      onChanged:
                                                                          (escolha) {
                                                                        dropValue.value =
                                                                            escolha.toString();
                                                                      },
                                                                      items: dropOpcoes
                                                                          .map((op) => DropdownMenuItem(
                                                                                value: op,
                                                                                child: Text(op),
                                                                              ))
                                                                          .toList(),
                                                                    );
                                                                  }),
                                                        ), //)

                                                        //],),

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
                                                            onPressed: () {},
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Container(
                                                  constraints: BoxConstraints(
                                                      maxHeight: 100),
                                                  //key: _key1,
                                                  child: IntrinsicHeight(
                                                    child: Row(
                                                      //mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          //width: 209.0,
                                                          //height: 40.0,
                                                          width: 209.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child:
                                                              //Row(

                                                              //children: [
                                                              TextField(
                                                            maxLines: null,
                                                            controller:
                                                                controllercoluna1[
                                                                    2],
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                                                        /*Expanded(child:*/ Container(
                                                          alignment:
                                                              Alignment.center,

                                                          width: 150,
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
                                                          child:
                                                              ValueListenableBuilder(
                                                                  valueListenable:
                                                                      dropValue,
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
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                          ),
                                                                          dropOpcoes[0]),
                                                                      value: (value
                                                                              .isEmpty)
                                                                          ? null
                                                                          : value,
                                                                      onChanged:
                                                                          (escolha) {
                                                                        dropValue.value =
                                                                            escolha.toString();
                                                                      },
                                                                      items: dropOpcoes
                                                                          .map((op) => DropdownMenuItem(
                                                                                value: op,
                                                                                child: Text(op),
                                                                              ))
                                                                          .toList(),
                                                                    );
                                                                  }),
                                                        ), //)

                                                        //],),

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
                                                            onPressed: () {},
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                            ],
                                          )))
                                    ],
                                  ),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BotaoNovostatus(),
                          //Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          //children: [
                          BotaoSalvar(),
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
