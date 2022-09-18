import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/faq_content.dart';

class DesktopFaq extends StatelessWidget {
  const DesktopFaq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child:Center(
        child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 20.0, horizontal: mediaQuery.width * 0.07),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                  SizedBox(height: 60),
                  Row(children: [
                    SizedBox(
                      width: 150,
                    ),
                    Base(),
                  ],),
                  
                  Perguntas(tamanhoimagem: mediaQuery.width*0.25, tamanhoitem: mediaQuery.width*0.5,espaco: 1,),
          ],
        ),
        
      ),
      )
      
    );
  }
}