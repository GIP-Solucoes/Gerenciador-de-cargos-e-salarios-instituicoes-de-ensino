import 'package:flutter/material.dart';
//imagem página que a aplicação é iniciada
class HeroImage extends StatelessWidget {
  const HeroImage({
    Key? key,
    this.imageHeight = 380.0,
    this.circleRadius = 180.0,
    this.bottom = 50.0,
    this.imageWidth,
  }) : super(key: key);
  final double imageHeight;
  final double circleRadius;
  final double bottom;
  final double? imageWidth;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
          Image.asset(
            'assets/images/inicio.png',
            height: imageHeight,
            width: imageWidth,
          ),
      ],
    );
  }
}
