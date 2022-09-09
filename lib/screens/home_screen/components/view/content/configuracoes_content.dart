import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/content/name_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/view/content/sistema_content.dart';

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

class TitleConfiguracoes extends StatelessWidget {
  TitleConfiguracoes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AutoSizeText(
      "Configurações",
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

class Dadosgerais extends StatelessWidget {
  Dadosgerais({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AutoSizeText(
          "Primeiro nome",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.0),
              border: Border.all(color: Colors.grey)),
          child: TextField(
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const AutoSizeText(
          "E-mail",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.0),
              border: Border.all(color: Colors.grey)),
          child: TextField(
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const AutoSizeText(
          "Telefone",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.0),
              border: Border.all(color: Colors.grey)),
          child: TextField(
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const AutoSizeText(
          "Senha",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.0),
              border: Border.all(color: Colors.grey)),
          child: TextField(
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}

class Segundonome extends StatelessWidget {
  Segundonome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AutoSizeText(
          "Segundo nome",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.0),
              border: Border.all(color: Colors.grey)),
          child: TextField(
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class Alterarimagem extends StatelessWidget {
  Alterarimagem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AutoSizeText(
          "Alterar imagem de\nperfil",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Image.asset(
          'assets/images/image_config.png',height: 125,
        ),
        
      ],
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
        paginaS = pagina_backup;
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

    return Container(
      height: 400,
      width: 600,
      //margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 15.0, horizontal: mediaQuery.width * 0.01),
          child: Column(children: [
            //],)
          ])),
    );
  }
}
