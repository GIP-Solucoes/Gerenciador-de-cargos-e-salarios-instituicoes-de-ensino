import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/cargos_content.dart';

class MobileCargos extends StatelessWidget {
  const MobileCargos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Center(
      child:SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Row(children: [
                  SizedBox(width: 5),
                  TitleCargos(tamanho:mediaQuery.width*0.86),
                ],),
                
                Cargos(valor:0.877),
                SizedBox(
                  height: 20,
                ),
                Row(children: [
                  SizedBox(width: 5,),
                  BotaoVoltar(),
                  SizedBox(width: 5,),
                  BotaoSalvar(),
                ],)
                
          ],
        ),
        
      ),
      )
      
    );
  }
}