import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
//texto página que a aplicação é iniciada
class HeroText extends StatelessWidget {
  const HeroText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        InicioTitle(),
        SizedBox(height: 40.0),
        InicioParagrafo(),
        SizedBox(height: 20.0),
      ],
    );
  }
}

class InicioParagrafo extends StatelessWidget {
  const InicioParagrafo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      "Um projeto inovador de três alunos de Engenharia de Software da Unaerp, com o objetivo de fornecer, de forma modular, uma aplicação para gerenciamento de cargos e salários. Veja mais no vídeo.",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
    );
  }
}

class InicioTitle extends StatelessWidget {
  const InicioTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AutoSizeText(
      "Saiba mais sobre nós",
      maxLines: 2,
      style: TextStyle(
        color: Colors.black,
        fontSize: 40.0,
        fontWeight: FontWeight.w900,
        fontFamily: 'Santana',
      ),
    );
  }
}
