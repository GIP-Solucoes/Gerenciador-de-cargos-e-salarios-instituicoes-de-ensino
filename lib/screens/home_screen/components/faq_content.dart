import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
//import 'package:starbucks_landing_page/screens/home_screen/components/design_pattern_category.dart';

class Base extends StatelessWidget {
  const Base({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      "Base de conhecimento",
      textAlign: TextAlign.start,
      style: TextStyle(
        color: Colors.black,
        fontSize: 22.0,
      ),
    );
  }
}

class Link extends StatelessWidget {
  const Link({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      "Link 1. xxxxxxxxxxxxxxxxxxxxxxxxxx",
      textAlign: TextAlign.start,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 18.0,
      ),
    );
  }
}

class Titulo extends StatelessWidget {
  const Titulo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      "Título",
      textAlign: TextAlign.start,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 20.0,
      ),
    );
  }
}

class TitleFaq extends StatelessWidget {
  const TitleFaq({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AutoSizeText(
      "Como podemos ajudar você hoje?",
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

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600.0,
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
          hintText: 'Digite o termo da pesquisa aqui...',
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

/* class Tema extends StatelessWidget {
    final DesignPatternCategory category;
  const Tema({
    required this.category,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      /*tilePadding: const EdgeInsets.symmetric(
        horizontal: LayoutConstants.paddingL,
        vertical: LayoutConstants.paddingM,
      ),*/
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      title: _CategoryTitle(
        title: category.title,
        itemsCount: category.patterns.length,
      ),
      /*children: category.patterns
          .map<Widget>(
            (designPattern) => _DesignPatternTile(designPattern: designPattern),
          )
          .toList()
          .addBetween(const SizedBox(height: LayoutConstants.spaceXS)),*/
    );
  }
}*/ /*
class BasicTile {
  final String title;
  final List<BasicTile> tiles;
  const BasicTile({
    required this.title,
    this.tiles = const [],
  });
}

final basicTiles = <BasicTile>[
  const BasicTile(title: 'Pergunta 1', tiles: [BasicTile(title: 'Pergunta 1')])
];*/
class Imagem extends StatelessWidget {
  const Imagem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/unaerp.faq',height: 60.0),
        //const SizedBox(width: 10.0),
        //Image.asset('assets/images/title.png', height: 35.0),
      ],
    );
  }
}
class Perguntas extends StatelessWidget {
  const Perguntas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Container(
      //height: 600,
      width: 700,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        title: Text('1. Pergunta 1 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
        backgroundColor: Colors.grey[200],
        iconColor: Colors.blue[600],
        collapsedIconColor: Colors.blue[600],
        children: [
          ListTile(
              title: Text('1. Resposta 1 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')),
        ],
      ),

      /*Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(80),
            ),
          ),
          /*const SizedBox(
            height: 20,
          ),*/
          
          /*Text(
            e.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.josefinSans(
              color: Colors.blue[600],
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          )*/
        ],
      ),*/
    ),
    Container(
      height: 300,
      width: 300,
      child: Image.asset('assets/images/faq.png'),
      ),

      /*Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(80),
            ),
          ),
          /*const SizedBox(
            height: 20,
          ),*/
          
          /*Text(
            e.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.josefinSans(
              color: Colors.blue[600],
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          )*/
        ],
      ),*/
    //)
      ],
    );
   ;

    /*ExpansionTile(
      title: Text('1. Pergunta 1 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
      backgroundColor: Colors.grey[200],
      iconColor: Colors.blue[600],
      collapsedIconColor: Colors.blue[600],
      children: [
        ListTile(title: Text('1. Resposta 1 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')),
      ],
    );*/
  }
}

/*Widget buildTile(BasicTile tile) {
  if (tile.tiles.isEmpty) {
    return ListTile(
      title:Text(tile.title),
    );
  }else{
    return ExpansionTile(
    title: Text(tile.title),
    children: tile.tiles.map((tile) => buildTile(tile)).toList(),
  );
  }
}*/
