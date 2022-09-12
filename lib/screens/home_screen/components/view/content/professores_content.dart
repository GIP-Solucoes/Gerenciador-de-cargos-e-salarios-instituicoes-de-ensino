import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gip_solucoes/main.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/hero_content.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/name_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/sistema_content.dart';
import 'package:gip_solucoes/screens/home_screen/home_screen.dart';
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

class BotaoNovofuncionario extends StatelessWidget {
  BotaoNovofuncionario({
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
          Icon(Icons.person_add_alt_1, color: Colors.white, size: 15.0),
          Text(
            " NOVO FUNCIONÁRIO",
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

class BotaoPlanilha extends StatelessWidget {
  BotaoPlanilha({
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
          Icon(Icons.file_open, color: Colors.white, size: 15.0),
          Text(
            " ADICIONAR PLANILHA",
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

class BotaoStatus extends StatelessWidget {
  BotaoStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        paginaS = 10;
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
            Icon(Icons.settings, color: Colors.white, size: 15.0),
            Text(
              " GERENCIAR STATUS",
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

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0,
      height: 45.0,
      child: TextField(
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(Icons.search, color: Colors.black, size: 20.0),
          hintText: 'Pesquisar...',
          alignLabelWithHint: true,
          hintStyle: const TextStyle(
            color: Colors.black87,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}

class _ProfessoresState extends State<Professores> {
  int statusCont = 1;
  static List<TextEditingController> controllerl1 = [
    TextEditingController(text: "6876875"),
    TextEditingController(text: "Adriana Carta"),
    TextEditingController(text: "Professor Graduado"),
    TextEditingController(text: "Professor Mestre"),
    TextEditingController(text: "Mestrado"),
    TextEditingController(text: "0"),
    TextEditingController(text: "0"),
    TextEditingController(text: "0"),
    TextEditingController(text: "0"),
    TextEditingController(text: "0"),
    TextEditingController(text: "0"),
    TextEditingController(text: "0"),
    TextEditingController(text: "0"),
    TextEditingController(text: "0"),
    TextEditingController(text: "0"),
    TextEditingController(text: "7"),
    TextEditingController(text: "11/08/14"),
    TextEditingController(text: "Gente boa!"),
  ];
  static List<TextEditingController> controllerl2 = [
    TextEditingController(text: "7652615"),
    TextEditingController(text: "Adriana Naime Pontes Passoni"),
    TextEditingController(text: "Professor Graduado"),
    TextEditingController(text: "Professor Mestre"),
    TextEditingController(text: "Mestrado"),
    TextEditingController(text: "0"),
    TextEditingController(text: "3"),
    TextEditingController(text: "1"),
    TextEditingController(text: "1"),
    TextEditingController(text: "2"),
    TextEditingController(text: "4"),
    TextEditingController(text: "1"),
    TextEditingController(text: "1"),
    TextEditingController(text: "3"),
    TextEditingController(text: "1"),
    TextEditingController(text: "0"),
    TextEditingController(text: "24/03/95"),
    TextEditingController(text: "Chato demais!"),
  ];
  final List<GlobalKey> categorias = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey()
  ];
  final List<GlobalKey> keyAltura = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey()
  ];
  List<Size> sizeAltura = [
    Size(0, 49),
    Size(0, 49),
    Size(0, 49),
    Size(0, 49),
    Size(0, 49),
    Size(0, 49),
    Size(0, 49)
  ];
  int ind = 0;
  late ScrollController scrollCont;
  final dropValue = ValueNotifier('');
  final dropOpcoes = ['Ativo', 'Inativo', 'Afastado'];
  BuildContext? tabContext;
  late ScrollController _scrollControllerOne, _scrollControllerTwo;
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
    for (int i = 0; i < keyAltura.length; i++) atualizaContainer(i);
    _scrollControllerOne = ScrollController();
    _scrollControllerTwo = ScrollController();
    _scrollControllerTwo.addListener(() {
      //_scrollControllerOne.removeListener(scrollTwo);
      scrollOne();
      //_scrollControllerOne.addListener(scrollTwo);
    });
    _scrollControllerOne.addListener(() {
      //_scrollControllerTwo.removeListener(scrollOne);
      scrollTwo();
      //_scrollControllerTwo.addListener(scrollOne);
    });
  }

  void scrollOne() {
    _scrollControllerOne.animateTo(_scrollControllerTwo.offset,
        duration: const Duration(milliseconds: 1), curve: Curves.linear);
  }

  void scrollTwo() {
    _scrollControllerTwo.animateTo(_scrollControllerOne.offset,
        duration: const Duration(milliseconds: 1), curve: Curves.linear);
  }

  @override
  void dispose() {
    _scrollControllerOne.dispose();
    _scrollControllerTwo.dispose();
    super.dispose();
  }

  void atualizaContainer(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      late RenderBox boxx;
      boxx = keyAltura[index].currentContext!.findRenderObject() as RenderBox;
      sizeAltura[index] = boxx.size;
    });
  }

  changeTabs() {
    late RenderBox box;
    for (var i = 0; i < categorias.length; i++) {
      box = categorias[i].currentContext!.findRenderObject() as RenderBox;
      Offset position = box.localToGlobal(Offset.zero);
      if (scrollCont.offset >= position.dx)
        setState(() {
          ind = i;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Builder(builder: (BuildContext context) {
      tabContext = context;

      return Container(
        height: 430,
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [],
                        ),
                        SizedBox(
                          width: 350.0,
                          height: 45.0,
                          child: TextField(
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  style: BorderStyle.none,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  style: BorderStyle.none,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(Icons.search,
                                  color: Colors.black, size: 20.0),
                              hintText: 'Pesquisar...',
                              alignLabelWithHint: true,
                              hintStyle: const TextStyle(
                                color: Colors.black87,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 40,
                              height: 40,
                            ),
                            SizedBox(height: 2),
                            SizedBox(
                              height: 250,
                              child: ScrollConfiguration(
                                behavior: ScrollConfiguration.of(context)
                                    .copyWith(scrollbars: false),
                                child: SingleChildScrollView(
                                  controller: _scrollControllerOne,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            width: 40,
                                            height: sizeAltura[0].height,
                                            child: IconButton(
                                              icon: const Icon(Icons.cancel),
                                              color: Colors.red,
                                              onPressed: () {},
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 2),
                                      Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            width: 40,
                                            height: sizeAltura[1].height,
                                            child: IconButton(
                                              icon: const Icon(Icons.cancel),
                                              color: Colors.red,
                                              onPressed: () {},
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 2),
                                      Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            width: 40,
                                            height: sizeAltura[2].height,
                                            child: IconButton(
                                              icon: const Icon(Icons.cancel),
                                              color: Colors.red,
                                              onPressed: () {},
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 2),
                                      Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            width: 40,
                                            height: sizeAltura[3].height,
                                            child: IconButton(
                                              icon: const Icon(Icons.cancel),
                                              color: Colors.red,
                                              onPressed: () {},
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 2),
                                      Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            width: 40,
                                            height: sizeAltura[4].height,
                                            child: IconButton(
                                              icon: const Icon(Icons.cancel),
                                              color: Colors.red,
                                              onPressed: () {},
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 2),
                                      Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            width: 40,
                                            height: sizeAltura[5].height,
                                            child: IconButton(
                                              icon: const Icon(Icons.cancel),
                                              color: Colors.red,
                                              onPressed: () {},
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 2),
                                      Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            width: 40,
                                            height: sizeAltura[6].height,
                                            child: IconButton(
                                              icon: const Icon(Icons.cancel),
                                              color: Colors.red,
                                              onPressed: () {},
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        //Column(children: [
                        SizedBox(
                          width: (mediaQuery.width * 0.63) - 40,
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
                                    SizedBox(
                                      height: 1,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      key: categorias[0],
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
                                            "Status",
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
                                            "Matrícula",
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
                                      width: 300.0,
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
                                            "Nome Funcionário",
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
                                      width: 209,
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
                                            "Cargo Antigo",
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
                                      width: 209,
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
                                            "Cargo Novo",
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
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 209,
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
                                            textAlign: TextAlign.center,
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
                                            "Aprovação em\nconcurso público",
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
                                            "Créditos de pós\ngraduação",
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
                                            "Cursos de\naperfeiçoamento",
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
                                            "Outros cursos de\ngraduação",
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
                                      key: categorias[2],
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
                                            "Cursos de extensão\ncultural",
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
                                            "Variáveis",
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
                                      width: 104.5,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue[300],
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            "TOTAL\nFormação\nAcadêmica",
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
                                        color: Colors.blue[400],
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            "Livros Publicados",
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
                                      key: categorias[3],
                                      alignment: Alignment.center,
                                      width: 104.5,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue[400],
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            "Pesquisa realizada",
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
                                        color: Colors.blue[400],
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            "Professor de\nuniversidade pública",
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
                                        color: Colors.blue[400],
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            "Trabalhos científicos\npublicados",
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
                                        color: Colors.blue[400],
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            "TOTAL\nExperiência",
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
                                      key: categorias[4],
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
                                            textAlign: TextAlign.center,
                                            "Assiduidade",
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
                                            textAlign: TextAlign.center,
                                            "Data de admissão",
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
                                      width: 209,
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
                                            textAlign: TextAlign.center,
                                            "Observações",
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
                                            textAlign: TextAlign.center,
                                            "PONTUAÇÃO",
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
                                SizedBox(
                                    height: 250,
                                    child: SingleChildScrollView(
                                        controller: _scrollControllerTwo,
                                        child: Column(
                                          children: [
                                            IntrinsicHeight(
                                              child: Container(
                                                key: keyAltura[0],
                                                constraints: BoxConstraints(
                                                    maxHeight: 100),
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
                                                          width: 104.5,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
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
                                                                        setState(
                                                                            () {
                                                                          for (int i = 0;
                                                                              i < 3;
                                                                              i++)
                                                                            if (dropOpcoes[i] ==
                                                                                escolha)
                                                                              setState(() {
                                                                                statusCont = i + 1;
                                                                              });
                                                                        });
                                                                      },
                                                                      items: dropOpcoes
                                                                          .map((op) => DropdownMenuItem(
                                                                                value: op,
                                                                                child: Text(op),
                                                                              ))
                                                                          .toList(),
                                                                    );
                                                                  })
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          constraints:
                                                              BoxConstraints(
                                                                  minHeight:
                                                                      40),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl1[0],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                atualizaContainer(
                                                                    0);
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 300.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl1[1],
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl1[2],
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[3],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[4],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[5],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[6],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[7],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[8],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[9],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[
                                                                    10],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: Colors
                                                                .blue[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[
                                                                    11],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[
                                                                    12],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[
                                                                    13],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[
                                                                    14],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: Colors
                                                                .blue[400],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[
                                                                    15],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[
                                                                    16],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[
                                                                    17],
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
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "26,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                                                key: keyAltura[1],
                                                constraints: BoxConstraints(
                                                    maxHeight: 100),
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
                                                          width: 104.5,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
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
                                                                        setState(
                                                                            () {
                                                                          for (int i = 0;
                                                                              i < 3;
                                                                              i++)
                                                                            if (dropOpcoes[i] ==
                                                                                escolha)
                                                                              setState(() {
                                                                                statusCont = i + 1;
                                                                              });
                                                                        });
                                                                      },
                                                                      items: dropOpcoes
                                                                          .map((op) => DropdownMenuItem(
                                                                                value: op,
                                                                                child: Text(op),
                                                                              ))
                                                                          .toList(),
                                                                    );
                                                                  })
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          constraints:
                                                              BoxConstraints(
                                                                  minHeight:
                                                                      40),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[0],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                atualizaContainer(
                                                                    1);
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 300.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[1],
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[2],
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[3],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[4],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[5],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[6],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[7],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[8],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[9],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    10],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: Colors
                                                                .blue[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    11],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    12],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    13],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    14],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: Colors
                                                                .blue[400],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    15],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    16],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    17],
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
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "26,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                                                key: keyAltura[2],
                                                constraints: BoxConstraints(
                                                    maxHeight: 100),
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
                                                          width: 104.5,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
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
                                                                        setState(
                                                                            () {
                                                                          for (int i = 0;
                                                                              i < 3;
                                                                              i++)
                                                                            if (dropOpcoes[i] ==
                                                                                escolha)
                                                                              setState(() {
                                                                                statusCont = i + 1;
                                                                              });
                                                                        });
                                                                      },
                                                                      items: dropOpcoes
                                                                          .map((op) => DropdownMenuItem(
                                                                                value: op,
                                                                                child: Text(op),
                                                                              ))
                                                                          .toList(),
                                                                    );
                                                                  })
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          constraints:
                                                              BoxConstraints(
                                                                  minHeight:
                                                                      40),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[0],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                atualizaContainer(
                                                                    2);
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 300.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[1],
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[2],
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[3],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[4],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[5],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[6],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[7],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[8],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[9],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    10],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: Colors
                                                                .blue[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    11],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    12],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    13],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    14],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: Colors
                                                                .blue[400],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    15],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    16],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    17],
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
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "26,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                                                key: keyAltura[3],
                                                constraints: BoxConstraints(
                                                    maxHeight: 100),
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
                                                          width: 104.5,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
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
                                                                        setState(
                                                                            () {
                                                                          for (int i = 0;
                                                                              i < 3;
                                                                              i++)
                                                                            if (dropOpcoes[i] ==
                                                                                escolha)
                                                                              setState(() {
                                                                                statusCont = i + 1;
                                                                              });
                                                                        });
                                                                      },
                                                                      items: dropOpcoes
                                                                          .map((op) => DropdownMenuItem(
                                                                                value: op,
                                                                                child: Text(op),
                                                                              ))
                                                                          .toList(),
                                                                    );
                                                                  })
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          constraints:
                                                              BoxConstraints(
                                                                  minHeight:
                                                                      40),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[0],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                atualizaContainer(
                                                                    3);
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 300.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[1],
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[2],
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[3],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[4],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[5],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[6],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[7],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[8],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[9],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    10],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: Colors
                                                                .blue[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    11],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    12],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    13],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    14],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: Colors
                                                                .blue[400],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    15],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    16],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    17],
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
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "26,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                                                key: keyAltura[4],
                                                constraints: BoxConstraints(
                                                    maxHeight: 100),
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
                                                          width: 104.5,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
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
                                                                        setState(
                                                                            () {
                                                                          for (int i = 0;
                                                                              i < 3;
                                                                              i++)
                                                                            if (dropOpcoes[i] ==
                                                                                escolha)
                                                                              setState(() {
                                                                                statusCont = i + 1;
                                                                              });
                                                                        });
                                                                      },
                                                                      items: dropOpcoes
                                                                          .map((op) => DropdownMenuItem(
                                                                                value: op,
                                                                                child: Text(op),
                                                                              ))
                                                                          .toList(),
                                                                    );
                                                                  })
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          constraints:
                                                              BoxConstraints(
                                                                  minHeight:
                                                                      40),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[0],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                atualizaContainer(
                                                                    4);
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 300.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[1],
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[2],
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[3],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[4],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[5],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[6],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[7],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[8],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[9],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    10],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: Colors
                                                                .blue[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    11],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    12],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    13],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    14],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: Colors
                                                                .blue[400],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    15],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    16],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    17],
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
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "26,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                                                key: keyAltura[5],
                                                constraints: BoxConstraints(
                                                    maxHeight: 100),
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
                                                          width: 104.5,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
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
                                                                        setState(
                                                                            () {
                                                                          for (int i = 0;
                                                                              i < 3;
                                                                              i++)
                                                                            if (dropOpcoes[i] ==
                                                                                escolha)
                                                                              setState(() {
                                                                                statusCont = i + 1;
                                                                              });
                                                                        });
                                                                      },
                                                                      items: dropOpcoes
                                                                          .map((op) => DropdownMenuItem(
                                                                                value: op,
                                                                                child: Text(op),
                                                                              ))
                                                                          .toList(),
                                                                    );
                                                                  })
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          constraints:
                                                              BoxConstraints(
                                                                  minHeight:
                                                                      40),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[0],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                atualizaContainer(
                                                                    5);
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 300.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[1],
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[2],
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[3],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[4],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[5],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[6],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[7],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[8],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[9],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    10],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: Colors
                                                                .blue[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    11],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    12],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    13],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    14],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: Colors
                                                                .blue[400],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    15],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    16],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    17],
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
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "26,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                                            IntrinsicHeight(
                                              child: Container(
                                                key: keyAltura[6],
                                                constraints: BoxConstraints(
                                                    maxHeight: 100),
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
                                                          width: 104.5,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
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
                                                                        setState(
                                                                            () {
                                                                          for (int i = 0;
                                                                              i < 3;
                                                                              i++)
                                                                            if (dropOpcoes[i] ==
                                                                                escolha)
                                                                              setState(() {
                                                                                statusCont = i + 1;
                                                                              });
                                                                        });
                                                                      },
                                                                      items: dropOpcoes
                                                                          .map((op) => DropdownMenuItem(
                                                                                value: op,
                                                                                child: Text(op),
                                                                              ))
                                                                          .toList(),
                                                                    );
                                                                  })
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          constraints:
                                                              BoxConstraints(
                                                                  minHeight:
                                                                      40),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[0],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                atualizaContainer(
                                                                    6);
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 300.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[1],
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[2],
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[3],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[4],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[5],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[6],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[7],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[8],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[9],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    10],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: Colors
                                                                .blue[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    11],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    12],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    13],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    14],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: Colors
                                                                .blue[400],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    15],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    16],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    17],
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
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "26,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                    const SizedBox(
                      height: 9,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 22,
                        ),
                        BotaoNovofuncionario(),
                        const SizedBox(
                          width: 18,
                        ),
                        BotaoPlanilha(),
                        const SizedBox(
                          width: 18,
                        ),
                        BotaoStatus(),
                        const SizedBox(
                          width: 18,
                        ),
                        BotaoSalvar()
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
                        Container(
                            width: ind == 2 ? 10 : 5,
                            height: ind == 2 ? 10 : 5,
                            margin: EdgeInsets.symmetric(
                                horizontal: mediaQuery.width * 0.01),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color:
                                    ind == 2 ? Colors.blue : Colors.grey[300]),
                            child: OutlinedButton(
                              onPressed: () {
                                scrollTo(2);
                              },
                              child: Text("teste"),
                            )),
                        Container(
                            width: ind == 3 ? 10 : 5,
                            height: ind == 3 ? 10 : 5,
                            margin: EdgeInsets.symmetric(
                                horizontal: mediaQuery.width * 0.01),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color:
                                    ind == 3 ? Colors.blue : Colors.grey[300]),
                            child: OutlinedButton(
                              onPressed: () {
                                scrollTo(3);
                              },
                              child: Text("teste"),
                            )),
                        Container(
                            width: ind == 4 ? 10 : 5,
                            height: ind == 4 ? 10 : 5,
                            margin: EdgeInsets.symmetric(
                                horizontal: mediaQuery.width * 0.01),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color:
                                    ind == 4 ? Colors.blue : Colors.grey[300]),
                            child: OutlinedButton(
                              onPressed: () {
                                scrollTo(4);
                              },
                              child: Text("teste"),
                            ))
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

class Professores extends StatefulWidget {
  Professores({
    Key? key,
  }) : super(key: key);
  @override
  @override
  State<StatefulWidget> createState() {
    return _ProfessoresState();
  }
}

class TitleProfessores extends StatelessWidget {
  TitleProfessores({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AutoSizeText(
      "Dados dos funcionários",
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
                // fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/**/
