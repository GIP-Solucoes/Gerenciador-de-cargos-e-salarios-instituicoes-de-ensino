import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
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
    return _StateResultados();
  }
}

class TitleConfiguracoes extends StatelessWidget {
  const TitleConfiguracoes({
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

class Primeironome extends StatelessWidget {
  Primeironome({
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
      ],
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
        Image.network(
          'https://firebasestorage.googleapis.com/v0/b/implementacaotcc.appspot.com/o/fixos%2Fimage_config.png?alt=media&token=3020296d-fdb0-4290-bdbd-1fad2325370a',height: 125,
        ),
        SizedBox(
          height: 40,
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
  final dropValue = ValueNotifier('');

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
