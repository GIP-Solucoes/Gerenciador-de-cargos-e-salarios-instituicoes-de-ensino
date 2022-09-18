import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Base extends StatelessWidget {
  const Base({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      "Perguntas frequentes",
      textAlign: TextAlign.start,
      style: TextStyle(
        color: Colors.black,
        fontSize: 22.0,
      ),
    );
  }
}

class Imagem extends StatelessWidget {
  const Imagem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/unaerp.faq', height: 60.0),
      ],
    );
  }
}

class Perguntas extends StatelessWidget {
  double tamanhoitem;
  double tamanhoimagem;
  double espaco;
  Perguntas({Key? key, required this.tamanhoitem, required this.tamanhoimagem,required this.espaco})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              width: tamanhoitem,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ExpansionTile(
                title:
                    Text('1. Pergunta 1 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
                backgroundColor: Colors.grey[200],
                iconColor: Colors.blue[600],
                collapsedIconColor: Colors.blue[600],
                children: [
                  ListTile(
                      title: Text(
                          '1. Resposta 1 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')),
                ],
              ),
            ),
            Container(
              width: tamanhoitem,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ExpansionTile(
                title:
                    Text('2. Pergunta 2 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
                backgroundColor: Colors.grey[200],
                iconColor: Colors.blue[600],
                collapsedIconColor: Colors.blue[600],
                children: [
                  ListTile(
                      title: Text(
                          '2. Resposta 2 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')),
                ],
              ),
            ),
            Container(
              width: tamanhoitem,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ExpansionTile(
                title:
                    Text('3. Pergunta 3 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
                backgroundColor: Colors.grey[200],
                iconColor: Colors.blue[600],
                collapsedIconColor: Colors.blue[600],
                children: [
                  ListTile(
                      title: Text(
                          '3. Resposta 3 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')),
                ],
              ),
            ),
            Container(
              width: tamanhoitem,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ExpansionTile(
                title:
                    Text('4. Pergunta 4 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
                backgroundColor: Colors.grey[200],
                iconColor: Colors.blue[600],
                collapsedIconColor: Colors.blue[600],
                children: [
                  ListTile(
                      title: Text(
                          '4. Resposta 4 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')),
                ],
              ),
            ),
            Container(
              width: tamanhoitem,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ExpansionTile(
                title:
                    Text('5. Pergunta 5 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
                backgroundColor: Colors.grey[200],
                iconColor: Colors.blue[600],
                collapsedIconColor: Colors.blue[600],
                children: [
                  ListTile(
                      title: Text(
                          '5. Resposta 5 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 40*espaco,
        ),
        Column(
          children: [
            Container(
              height: tamanhoimagem,
              width: tamanhoimagem,
              child: Image.asset('assets/images/faq.png'),
            ),
          ],
        )
      ],
    );
  }
}
