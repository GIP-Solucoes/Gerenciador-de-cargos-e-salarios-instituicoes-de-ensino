import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/esqueci_content.dart';

class MobileEsqueci extends StatelessWidget {
  const MobileEsqueci({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child:Center(
          child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 20.0, horizontal: mediaQuery.width * 0.07),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
                
                children: [
                    SizedBox(height: 60),
                  Row(children: [
                    TitleEsqueci(tamanho:mediaQuery.width*0.85),
                  ],),
                  SizedBox(height: 10,),
                    Row(children: [
                    EscritaEsqueci(tamanho:mediaQuery.width*0.85),
                  ],),
                  SizedBox(height: 10,),
                  Row(children: [
                    EsqueciCampo(tamanho2: 0.65,),
                  ],),
                  SizedBox(height: 10,),
                  Row(children: [
                    EsqueciBotao(),
                    VoltarBotao(tamanhovoltar: 0.6,),
                  ],),
                
            ],
          ),
          
        ),
        )
        
      ),
    );
  }
}