import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/status_content.dart';

class DesktopStatus extends StatelessWidget {
  const DesktopStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child:Center(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.175),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Row(children: [
                  SizedBox(width: 5),
                  TitleStatus(),
                ],),
                
                Status(valor:530),
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