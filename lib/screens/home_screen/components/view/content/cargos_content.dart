import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/sistema_content.dart';

//import 'package:my_portfolio/models/name_color.dart';
List<bool> nomes = [];
List<bool> titulos = [];
List<bool> experiencias = [];
List<bool> casas = [];
List<bool> descricoes = [];
List<bool> competencias = [];

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

class Cargos extends StatefulWidget {
  double valor;
  List<TextEditingController> editingControllerNomes;
  List<TextEditingController> editingControllerTitulos;
  List<TextEditingController> editingControllerTempoExperiencia;
  List<TextEditingController> editingControllerTempoMinimo;
  List<TextEditingController> editingControllerDescricoes;
  List<TextEditingController> editingControllerCompetencias;
  Cargos(
      {Key? key,
      required this.valor,
      required this.editingControllerNomes,
      required this.editingControllerTitulos,
      required this.editingControllerTempoExperiencia,
      required this.editingControllerTempoMinimo,
      required this.editingControllerDescricoes,
      required this.editingControllerCompetencias})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StateCargos(this.valor);
  }
}

class TitleCargos extends StatelessWidget {
  double tamanho;
  TitleCargos({Key? key, required this.tamanho}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: tamanho,
      child: const AutoSizeText(
        "Dados dos Cargos",
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
            const Icon(Icons.arrow_back_ios, color: Colors.white, size: 30.0),
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
  List<TextEditingController> nomess;
  List<TextEditingController> tituloss;
  List<TextEditingController> descricoess;
  List<TextEditingController> competenciass;
  List<TextEditingController> experienciass;
  List<TextEditingController> casass;
  BotaoSalvar(
      {Key? key,
      required this.instituicao,
      required this.nomess,
      required this.tituloss,
      required this.descricoess,
      required this.competenciass,
      required this.experienciass,
      required this.casass})
      : super(key: key);

  @override
  State<BotaoSalvar> createState() => _BotaoSalvarState();
}

class _BotaoSalvarState extends State<BotaoSalvar> {
  alterar_cargos() {
    int contador = 0;
    List<String> titulosss;
    CollectionReference cargos = FirebaseFirestore.instance.collection('Cargo');
    cargos
        .where('instituicao', isEqualTo: widget.instituicao)
        .orderBy('grau')
        .get()
        .then((QuerySnapshot q) {
      titulosss = [];
      q.docs.forEach((element) {
        titulosss.add(element["titulo"]);
      });
      CollectionReference cargos2 =
          FirebaseFirestore.instance.collection('Cargo');
      cargos2
          .where('instituicao', isEqualTo: widget.instituicao)
          .orderBy('grau')
          .get()
          .then((QuerySnapshot q) {
        bool testador = false;
        q.docs.forEach((elementt) {
          var eee = elementt.reference;
          if (nomes[contador] == true &&
              widget.nomess[contador].text.isNotEmpty) {
            eee.update({"nome": widget.nomess[contador].text});
          }
          if (casas[contador] == true &&
              widget.casass[contador].text.isNotEmpty) {
            eee.update(
                {"tempo_empresa": double.parse(widget.casass[contador].text)});
          }
          if (experiencias[contador] == true &&
              widget.experienciass[contador].text.isNotEmpty) {
            eee.update({
              "tempo_experiencia":
                  double.parse(widget.experienciass[contador].text)
            });
          }
          if (descricoes[contador] == true &&
              widget.descricoess[contador].text.isNotEmpty) {
            eee.update({"descricao": widget.descricoess[contador].text});
          }
          if (competencias[contador] == true &&
              widget.competenciass[contador].text.isNotEmpty) {
            eee.update({"competencias": widget.competenciass[contador].text});
          }
          if (titulos[contador] == true &&
              widget.tituloss[contador].text.isNotEmpty) {
            titulosss.forEach((element) {
              if (element == widget.tituloss[contador].text) testador = true;
            });
            if (testador == false)
              eee.update({"titulo": widget.tituloss[contador].text});
          }
          contador++;
        });
        int count = 0;
        bool verificar_alteracao = false;
        bool verificar_vazios = false;
        casas.forEach((elementk) {
          if (elementk == true) {
            verificar_alteracao = true;
          }
        });
        competencias.forEach((elementk) {
          if (elementk == true) {
            verificar_alteracao = true;
          }
        });
        experiencias.forEach((elementk) {
          if (elementk == true) {
            verificar_alteracao = true;
          }
        });
        descricoes.forEach((elementk) {
          if (elementk == true) {
            verificar_alteracao = true;
          }
        });
        nomes.forEach((elementk) {
          if (elementk == true) {
            verificar_alteracao = true;
          }
        });
        titulos.forEach((elementk) {
          if (elementk == true) {
            verificar_alteracao = true;
          }
        });
        widget.casass.forEach((element) {
          print(element.text);
          if (element.text.isEmpty) verificar_vazios = true;
        });
        widget.competenciass.forEach((element) {
          if (element.text.isEmpty) verificar_vazios = true;
        });
        widget.descricoess.forEach((element) {
          if (element.text.isEmpty) verificar_vazios = true;
        });
        widget.experienciass.forEach((element) {
          if (element.text.isEmpty) verificar_vazios = true;
        });
        widget.nomess.forEach((element) {
          if (element.text.isEmpty) verificar_vazios = true;
        });
        widget.tituloss.forEach((element) {
          if (element.text.isEmpty) verificar_vazios = true;
        });
        if (verificar_alteracao == false) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text("Nenhum campo foi alterado!"),
            duration: Duration(seconds: 5),
          ));
        } else {
          if (verificar_vazios == true) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text("Preencha todos os campos antes de salvar!"),
              duration: Duration(seconds: 5),
            ));
          } else {
            if (testador == true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                    "Existem cargos com o mesmo título, por favor, altere para conseguir salvar."),
                duration: Duration(seconds: 5),
              ));
            } else {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: Text(
                          "Dados salvos",
                        ),
                        content: Text("Dados salvos com sucesso!"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                paginaS = 0;
                                Navigator.popAndPushNamed(context, '/sistema');
                              },
                              child: Text('Ok')),
                        ],
                      ));
            }
          }
        }
      });
    }).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(e),
        duration: Duration(seconds: 5),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => alterar_cargos(),
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
            const Icon(Icons.arrow_back_ios, color: Colors.white, size: 30.0),
            const Text(
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

class BotaoTabelasalarial extends StatelessWidget {
  BotaoTabelasalarial({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        paginaS = 9;
        Navigator.pushNamed(context, '/sistema');
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
      ),
    );
  }
}

class _StateCargos extends State<Cargos> {
  double valor = 0.63;
  _StateCargos(double valor) {
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
        width: (mediaQuery.width * this.valor)+(mediaQuery.width * 0.02),
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
                            width: (mediaQuery.width * this.valor),
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
                                              "Título",
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
                                        key: categorias[1],
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
                                              "Tempo Experiência",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 8.0,
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
                                              "Tempo Mínimo\nde casa",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 8.0,
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
                                        width: 313.5,
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
                                              "Descrição",
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
                                        width: 313.5,
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
                                              "Competências",
                                              textAlign: TextAlign.center,
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
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  widget.editingControllerNomes.length == 0
                                      ? Container(
                                          height: 250,
                                          width:
                                              (mediaQuery.width * this.valor),
                                          child: Center(
                                              child: Text("Carregando...")))
                                      : Container(
                                          height: 250,
                                          width: 1159.5,
                                          child: ListView.builder(
                                            itemCount: widget
                                                .editingControllerNomes.length,
                                            itemBuilder: (context, index) =>
                                                Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 2),
                                              child: Container(
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
                                                            onChanged:
                                                                (value) =>
                                                                    setState(
                                                                        () {
                                                              nomes[index] =
                                                                  true;
                                                            }),
                                                            maxLines: null,
                                                            controller: widget
                                                                    .editingControllerNomes[
                                                                index],
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

                                                          width: 104.5,
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
                                                            onChanged:
                                                                (value) =>
                                                                    setState(
                                                                        () {
                                                              titulos[index] =
                                                                  true;
                                                            }),
                                                            controller: widget
                                                                    .editingControllerTitulos[
                                                                index],
                                                            maxLines: null,
                                                            //maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ), //)

                                                        //],),

                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          //height: 40.0,
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
                                                              Expanded(
                                                                child:
                                                                    TextField(
                                                                  inputFormatters: <
                                                                      TextInputFormatter>[
                                                                    FilteringTextInputFormatter
                                                                        .allow(RegExp(
                                                                            r'[0-9]')),
                                                                  ],
                                                                  onChanged:
                                                                      (value) =>
                                                                          setState(
                                                                              () {
                                                                    experiencias[
                                                                            index] =
                                                                        true;
                                                                    widget
                                                                        .editingControllerTempoExperiencia[
                                                                            index]
                                                                        .text;
                                                                  }),
                                                                  controller:
                                                                      widget.editingControllerTempoExperiencia[
                                                                          index],
                                                                  maxLines:
                                                                      null,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        16.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(widget
                                                                      .editingControllerTempoExperiencia[
                                                                          index]
                                                                      .text
                                                                      .isNotEmpty
                                                                  ? double.parse(widget
                                                                              .editingControllerTempoExperiencia[index]
                                                                              .text) >
                                                                          1
                                                                      ? "anos"
                                                                      : "ano"
                                                                  : "ano"),
                                                            ],
                                                          ),
                                                        ),

                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          height: 40.0,
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
                                                              Expanded(
                                                                child:
                                                                    TextField(
                                                                  onChanged:
                                                                      (value) =>
                                                                          setState(
                                                                              () {
                                                                    casas[index] =
                                                                        true;
                                                                    widget
                                                                        .editingControllerTempoMinimo[
                                                                            index]
                                                                        .text;
                                                                  }),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  inputFormatters: <
                                                                      TextInputFormatter>[
                                                                    FilteringTextInputFormatter
                                                                        .allow(RegExp(
                                                                            r'[0-9]')),
                                                                  ],
                                                                  controller:
                                                                      widget.editingControllerTempoMinimo[
                                                                          index],
                                                                  maxLines:
                                                                      null,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        16.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(widget
                                                                      .editingControllerTempoMinimo[
                                                                          index]
                                                                      .text
                                                                      .isNotEmpty
                                                                  ? double.parse(widget
                                                                              .editingControllerTempoMinimo[index]
                                                                              .text) >
                                                                          1
                                                                      ? "anos"
                                                                      : "ano"
                                                                  : "ano"),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 313.5,
                                                          //height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            onChanged:
                                                                (value) =>
                                                                    setState(
                                                                        () {
                                                              descricoes[
                                                                  index] = true;
                                                            }),
                                                            controller: widget
                                                                    .editingControllerDescricoes[
                                                                index],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 8.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 313.5,
                                                          //height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            onChanged:
                                                                (value) =>
                                                                    setState(
                                                                        () {
                                                              competencias[
                                                                  index] = true;
                                                            }),
                                                            controller: widget
                                                                    .editingControllerCompetencias[
                                                                index],
                                                            maxLines: null,
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
                                                  )),
                                            ),
                                          ),
                                        ),
                                  /*
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
                                                      alignment:
                                                          Alignment.center,
                                                      width: 104.5,
                                                      //height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: TextField(
                                                        controller:
                                                            controllerlinha1[1],
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
                                                      width: 104.5,
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: TextField(
                                                        controller:
                                                            controllerlinha1[2],
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
                                                      width: 313.5,
                                                      //height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: TextField(
                                                        controller:
                                                            controllerlinha1[3],
                                                        maxLines: null,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 8.0,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 313.5,
                                                      //height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: TextField(
                                                        controller:
                                                            controllerlinha1[4],
                                                        maxLines: null,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 8.0,
                                                        ),
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
                                                            controller[1],
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
                                                            controllerlinha2[0],
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
                                                      alignment:
                                                          Alignment.center,
                                                      width: 104.5,
                                                      //height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: TextField(
                                                        controller:
                                                            controllerlinha2[1],
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
                                                      width: 104.5,
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: TextField(
                                                        controller:
                                                            controllerlinha2[2],
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
                                                      width: 313.5,
                                                      //height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: TextField(
                                                        controller:
                                                            controllerlinha2[3],
                                                        maxLines: null,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 8.0,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 313.5,
                                                      //height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: TextField(
                                                        controller:
                                                            controllerlinha2[4],
                                                        maxLines: null,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 8.0,
                                                        ),
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
                                                            controller[2],
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
                                                            controllerlinha3[0],
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
                                                      alignment:
                                                          Alignment.center,
                                                      width: 104.5,
                                                      //height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: TextField(
                                                        controller:
                                                            controllerlinha3[1],
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
                                                      width: 104.5,
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: TextField(
                                                        controller:
                                                            controllerlinha3[2],
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
                                                      width: 313.5,
                                                      //height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: TextField(
                                                        controller:
                                                            controllerlinha3[3],
                                                        maxLines: null,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 8.0,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 313.5,
                                                      //height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: TextField(
                                                        controller:
                                                            controllerlinha3[4],
                                                        maxLines: null,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 8.0,
                                                        ),
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
                                                            controller[3],
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
                                                            controllerlinha4[0],
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
                                                      alignment:
                                                          Alignment.center,
                                                      width: 104.5,
                                                      //height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: TextField(
                                                        controller:
                                                            controllerlinha4[1],
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
                                                      width: 104.5,
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: TextField(
                                                        controller:
                                                            controllerlinha4[2],
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
                                                      width: 313.5,
                                                      //height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: TextField(
                                                        controller:
                                                            controllerlinha4[3],
                                                        maxLines: null,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 8.0,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 313.5,
                                                      //height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: TextField(
                                                        controller:
                                                            controllerlinha4[4],
                                                        maxLines: null,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 8.0,
                                                        ),
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
                                                            controller[4],
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
                                                            controllerlinha5[0],
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
                                                      alignment:
                                                          Alignment.center,
                                                      width: 104.5,
                                                      //height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: TextField(
                                                        controller:
                                                            controllerlinha5[1],
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
                                                      width: 104.5,
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: TextField(
                                                        controller:
                                                            controllerlinha5[2],
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
                                                      width: 313.5,
                                                      //height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: TextField(
                                                        controller:
                                                            controllerlinha5[3],
                                                        maxLines: null,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 8.0,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 313.5,
                                                      //height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                      child: TextField(
                                                        controller:
                                                            controllerlinha5[4],
                                                        maxLines: null,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 8.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                          SizedBox(height: 2),
                                        ],
                                      )))*/
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
                          /*SizedBox(
                            width: (mediaQuery.width * 0.3),
                          ),*/
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
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
                            ),
                          ),
                          //],),
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
