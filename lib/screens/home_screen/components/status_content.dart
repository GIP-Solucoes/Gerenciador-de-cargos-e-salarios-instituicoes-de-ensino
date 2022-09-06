import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/name_color.dart';
import 'package:google_fonts/google_fonts.dart';

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
  final List<GlobalKey> categorias = [
    GlobalKey(),
    GlobalKey(),
  ];
  int ind = 0;
  late ScrollController scrollCont;
  BuildContext? tabContext;
  double mediaQueryx=0;

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
      if (scrollCont.offset >= (position.dx-(mediaQueryx*0.15)))
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
    TextEditingController(text: "Graduação"),
    TextEditingController(text: "1 ano"),
    TextEditingController(text: "1 ano"),
    TextEditingController(
        text:
            "Executam serviços de apoio nas áreas de recursos humanos, administração, finanças e logística; atendem fornecedores e clientes, fornecendo e recebendo informações sobre produtos e serviços; tratam de documentos variados, cumprindo todo o procedimento necessário referente aos mesmos."),
    TextEditingController(
        text:
            "Executam serviços de apoio nas áreas de recursos humanos, administração, finanças e logística; atendem fornecedores e clientes, fornecendo e recebendo informações sobre produtos e serviços; tratam de documentos variados, cumprindo todo o procedimento necessário referente aos mesmos."),
  ];
  static List<TextEditingController> controllerlinha2 = [
    TextEditingController(text: "Especialização"),
    TextEditingController(text: "1 ano"),
    TextEditingController(text: "1 ano"),
    TextEditingController(
        text:
            "Executam serviços de apoio nas áreas de recursos humanos, administração, finanças e logística; atendem fornecedores e clientes, fornecendo e recebendo informações sobre produtos e serviços; tratam de documentos variados, cumprindo todo o procedimento necessário referente aos mesmos."),
    TextEditingController(
        text:
            "Executam serviços de apoio nas áreas de recursos humanos, administração, finanças e logística; atendem fornecedores e clientes, fornecendo e recebendo informações sobre produtos e serviços; tratam de documentos variados, cumprindo todo o procedimento necessário referente aos mesmos."),
  ];
  static List<TextEditingController> controllerlinha3 = [
    TextEditingController(text: "Mestrado"),
    TextEditingController(text: "2 anos"),
    TextEditingController(text: "2 anos"),
    TextEditingController(
        text:
            "Executam serviços de apoio nas áreas de recursos humanos, administração, finanças e logística; atendem fornecedores e clientes, fornecendo e recebendo informações sobre produtos e serviços; tratam de documentos variados, cumprindo todo o procedimento necessário referente aos mesmos; preparam relatórios e planilhas."),
    TextEditingController(
        text:
            "Executam serviços de apoio nas áreas de recursos humanos, administração, finanças e logística; atendem fornecedores e clientes, fornecendo e recebendo informações sobre produtos e serviços; tratam de documentos variados, cumprindo todo o procedimento necessário referente aos mesmos; preparam relatórios e planilhas."),
  ];
  static List<TextEditingController> controllerlinha4 = [
    TextEditingController(text: "Doutorado"),
    TextEditingController(text: "3 anos"),
    TextEditingController(text: "3 anos"),
    TextEditingController(
        text:
            "Desenvolvem e implantam sistemas informatizados dimensionando requisitos e funcionalidade dos sistemas, especificando sua arquitetura, escolhendo ferramentas de desenvolvimento, especificando programas, codificando aplicativos. Prestam suporte técnico ao cliente, elaboram documentação técnica."),
    TextEditingController(
        text:
            "Desenvolvem e implantam sistemas informatizados dimensionando requisitos e funcionalidade dos sistemas, especificando sua arquitetura, escolhendo ferramentas de desenvolvimento, especificando programas, codificando aplicativos. Prestam suporte técnico ao cliente, elaboram documentação técnica."),
  ];
  static List<TextEditingController> controllerlinha5 = [
    TextEditingController(text: "Livre Docência"),
    TextEditingController(text: "4 anos"),
    TextEditingController(text: "3 anos"),
    TextEditingController(
        text:
            "Desenvolvem e implantam sistemas informatizados dimensionando requisitos e funcionalidade dos sistemas, especificando sua arquitetura, escolhendo ferramentas de desenvolvimento, especificando programas, codificando aplicativos. Administram ambiente informatizado, prestam suporte técnico ao cliente, elaboram documentação técnica."),
    TextEditingController(
        text:
            "Desenvolvem e implantam sistemas informatizados dimensionando requisitos e funcionalidade dos sistemas, especificando sua arquitetura, escolhendo ferramentas de desenvolvimento, especificando programas, codificando aplicativos. Administram ambiente informatizado, prestam suporte técnico ao cliente, elaboram documentação técnica."),
  ];
  /*controller[0].text = "Professor Graduado";
    controller[1].text = "Professor Especialista";
    controller[2].text = "Professor Mestre";
    controller[3].text = "Professor Doutor";
    controller[4].text = "Professor Livre Docente";*/
  _StateResultados({
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
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Column(children: [
                          SizedBox(
                            width: (mediaQuery.width * 0.63)/1.75,
                            //height: 40,
                            child: SingleChildScrollView(
                              controller: scrollCont,
                              //padding: EdgeInsets.symmetric(
                              //vertical: 10.0, horizontal: mediaQuery.width * 0.1),
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
                                            key: categorias[0],
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
                                            width: 104.5,
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
                                                          decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(5.0),
                                                          ),
                                                          child:
                                                              //Row(

                                                              //children: [
                                                              TextField(
                                                            maxLines: null,
                                                            controller:
                                                                controller[0],
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
                                                        /*Expanded(child:*/ Container(
                                                          alignment:
                                                              Alignment.center,

                                                          width: 104.5,
                                                          //height: 300,
                                                          //height: _key1.currentContext.size!.height,
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerlinha1[0],
                                                            maxLines: null,
                                                            //maxLines: null,
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ), //)

                                                        //],),

                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                alignment: Alignment.center,
                                                width: 40,
                                                child: IconButton(
                                                  icon: const Icon(Icons.cancel),
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
                                                          decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(5.0),
                                                          ),
                                                          child:
                                                              //Row(

                                                              //children: [
                                                              TextField(
                                                            maxLines: null,
                                                            controller:
                                                                controller[0],
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
                                                        /*Expanded(child:*/ Container(
                                                          alignment:
                                                              Alignment.center,

                                                          width: 104.5,
                                                          //height: 300,
                                                          //height: _key1.currentContext.size!.height,
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerlinha1[0],
                                                            maxLines: null,
                                                            //maxLines: null,
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ), //)

                                                        //],),

                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                alignment: Alignment.center,
                                                width: 40,
                                                child: IconButton(
                                                  icon: const Icon(Icons.cancel),
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
                                                          decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(5.0),
                                                          ),
                                                          child:
                                                              //Row(

                                                              //children: [
                                                              TextField(
                                                            maxLines: null,
                                                            controller:
                                                                controller[0],
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
                                                        /*Expanded(child:*/ Container(
                                                          alignment:
                                                              Alignment.center,

                                                          width: 104.5,
                                                          //height: 300,
                                                          //height: _key1.currentContext.size!.height,
                                                          //constraints: BoxConstraints(maxHeight: 50),
                                                          decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerlinha1[0],
                                                            maxLines: null,
                                                            //maxLines: null,
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ), //)

                                                        //],),

                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                alignment: Alignment.center,
                                                width: 40,
                                                child: IconButton(
                                                  icon: const Icon(Icons.cancel),
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
