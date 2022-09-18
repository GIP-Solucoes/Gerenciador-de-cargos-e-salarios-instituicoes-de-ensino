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
/*
class BuyNowButton extends StatelessWidget {
  const BuyNowButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 150.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Buy now",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          Icon(Icons.navigate_next_rounded,
              color: Colors.deepOrangeAccent, size: 30.0),
        ],
      ),
    );
  }
}

class CappucinoPrice extends StatelessWidget {
  const CappucinoPrice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      "\$8.60",
      style: TextStyle(
        color: Colors.black,
        fontSize: 30.0,
        fontWeight: FontWeight.w700,
        fontFamily: 'Santana',
      ),
    );
  }
}
*/
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
