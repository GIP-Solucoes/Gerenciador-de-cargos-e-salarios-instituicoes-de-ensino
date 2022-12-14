import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gip_solucoes/screens/home_screen/components/controller/sistema_content.dart';

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
                    "Existem cargos com o mesmo t??tulo, por favor, altere para conseguir salvar."),
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
    TextEditingController(text: "Gradua????o"),
    TextEditingController(text: "1 ano"),
    TextEditingController(text: "1 ano"),
    TextEditingController(
        text:
            "Executam servi??os de apoio nas ??reas de recursos humanos, administra????o, finan??as e log??stica; atendem fornecedores e clientes, fornecendo e recebendo informa????es sobre produtos e servi??os; tratam de documentos variados, cumprindo todo o procedimento necess??rio referente aos mesmos."),
    TextEditingController(
        text:
            "Executam servi??os de apoio nas ??reas de recursos humanos, administra????o, finan??as e log??stica; atendem fornecedores e clientes, fornecendo e recebendo informa????es sobre produtos e servi??os; tratam de documentos variados, cumprindo todo o procedimento necess??rio referente aos mesmos."),
  ];
  static List<TextEditingController> controllerlinha2 = [
    TextEditingController(text: "Especializa????o"),
    TextEditingController(text: "1 ano"),
    TextEditingController(text: "1 ano"),
    TextEditingController(
        text:
            "Executam servi??os de apoio nas ??reas de recursos humanos, administra????o, finan??as e log??stica; atendem fornecedores e clientes, fornecendo e recebendo informa????es sobre produtos e servi??os; tratam de documentos variados, cumprindo todo o procedimento necess??rio referente aos mesmos."),
    TextEditingController(
        text:
            "Executam servi??os de apoio nas ??reas de recursos humanos, administra????o, finan??as e log??stica; atendem fornecedores e clientes, fornecendo e recebendo informa????es sobre produtos e servi??os; tratam de documentos variados, cumprindo todo o procedimento necess??rio referente aos mesmos."),
  ];
  static List<TextEditingController> controllerlinha3 = [
    TextEditingController(text: "Mestrado"),
    TextEditingController(text: "2 anos"),
    TextEditingController(text: "2 anos"),
    TextEditingController(
        text:
            "Executam servi??os de apoio nas ??reas de recursos humanos, administra????o, finan??as e log??stica; atendem fornecedores e clientes, fornecendo e recebendo informa????es sobre produtos e servi??os; tratam de documentos variados, cumprindo todo o procedimento necess??rio referente aos mesmos; preparam relat??rios e planilhas."),
    TextEditingController(
        text:
            "Executam servi??os de apoio nas ??reas de recursos humanos, administra????o, finan??as e log??stica; atendem fornecedores e clientes, fornecendo e recebendo informa????es sobre produtos e servi??os; tratam de documentos variados, cumprindo todo o procedimento necess??rio referente aos mesmos; preparam relat??rios e planilhas."),
  ];
  static List<TextEditingController> controllerlinha4 = [
    TextEditingController(text: "Doutorado"),
    TextEditingController(text: "3 anos"),
    TextEditingController(text: "3 anos"),
    TextEditingController(
        text:
            "Desenvolvem e implantam sistemas informatizados dimensionando requisitos e funcionalidade dos sistemas, especificando sua arquitetura, escolhendo ferramentas de desenvolvimento, especificando programas, codificando aplicativos. Prestam suporte t??cnico ao cliente, elaboram documenta????o t??cnica."),
    TextEditingController(
        text:
            "Desenvolvem e implantam sistemas informatizados dimensionando requisitos e funcionalidade dos sistemas, especificando sua arquitetura, escolhendo ferramentas de desenvolvimento, especificando programas, codificando aplicativos. Prestam suporte t??cnico ao cliente, elaboram documenta????o t??cnica."),
  ];
  static List<TextEditingController> controllerlinha5 = [
    TextEditingController(text: "Livre Doc??ncia"),
    TextEditingController(text: "4 anos"),
    TextEditingController(text: "3 anos"),
    TextEditingController(
        text:
            "Desenvolvem e implantam sistemas informatizados dimensionando requisitos e funcionalidade dos sistemas, especificando sua arquitetura, escolhendo ferramentas de desenvolvimento, especificando programas, codificando aplicativos. Administram ambiente informatizado, prestam suporte t??cnico ao cliente, elaboram documenta????o t??cnica."),
    TextEditingController(
        text:
            "Desenvolvem e implantam sistemas informatizados dimensionando requisitos e funcionalidade dos sistemas, especificando sua arquitetura, escolhendo ferramentas de desenvolvimento, especificando programas, codificando aplicativos. Administram ambiente informatizado, prestam suporte t??cnico ao cliente, elaboram documenta????o t??cnica."),
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
        width: (mediaQuery.width * this.valor)+(mediaQuery.width * 0.02),
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
                            width: (mediaQuery.width * this.valor),
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
                                              "T??tulo",
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
                                              "Tempo Experi??ncia",
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
                                              "Tempo M??nimo\nde casa",
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
                                              "Descri????o",
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
                                              "Compet??ncias",
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
                                          width: 1205,
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
                                                  child: IntrinsicHeight(
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
                                                          child:
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
                                                            ),
                                                          ),
                                                        ),

                                                        Container(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,

                                                          width: 150,
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
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                                ],
                              ),
                            ),
                            
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          BotaoTabelasalarial(),
                          
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
                        ],
                      )
                    ])),
          ],
        ),
      );
    });
  }
}
