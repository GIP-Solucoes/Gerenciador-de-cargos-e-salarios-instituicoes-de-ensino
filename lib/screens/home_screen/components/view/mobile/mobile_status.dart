import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/status_content.dart';
class MobileStatus extends StatelessWidget {
  const MobileStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child:Center(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Row(children: [
                  SizedBox(width: 5),
                  TitleStatus(),
                ],),
                
                Status(valor:(mediaQuery.width * 0.75), instituicao: '', textEditingNomes: [], textEditingTipos: [],),
                SizedBox(
                  height: 20,
                ),
                Row(children: [
                  SizedBox(width: 5,),
                  BotaoVoltar(),
                  SizedBox(width: 5,),
                ],)
                
          ],
        ),
        
      ),
      )
      
    );
  }
}