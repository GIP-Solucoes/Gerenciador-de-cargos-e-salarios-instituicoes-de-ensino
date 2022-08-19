import 'package:flutter/material.dart';

import 'package:starbucks_landing_page/screens/home_screen/components/aempresa_text.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/youtube.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/faq_content.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/serving_items_list.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

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
                //Column(children: [
                  SizedBox(height: 60),
                  Row(children: [
                    SizedBox(
                      width: 150,
                    ),
                    Base(),
                  ],),
                  
                  Perguntas(),
                  //Perguntas(),
                //],)
                //Perguntas(),
                /*Column(
                  //SizedBox(height: 60),
                  children:[Perguntas(),],
                ),
                Column(
                  //SizedBox(height: 60),
                  children:[Perguntas(),],
                ),*/
                /*Row(children: [
                  //Perguntas(),
                  //Tema(category: category,),
                  //TitleFaq(),
                  //CategoryPatternsExpandableView(),
                ],),*/
                /*
                SizedBox(height: 10,),
                  Row(children: [
                  //SearchButton(),
                ],),
                SizedBox(height: 50,),
                Row(children: [
                  //Base(),
                ],),
                SizedBox(height: 10,),
                Row(children: [
                  //Titulo(),
                ],),
                SizedBox(height: 10,),
                Row(children: [
                  //Tema(),
                ],),
                SizedBox(height: 15,),
                Row(children: [
                  //Link(),
                ],),
              SizedBox(height: 5,),*/
              
            
            //const SizedBox(height: 75.0),
            //Row(
              //mainAxisSize: MainAxisSize.min,
              //children: const [
                //Expanded(
                //  child: HeroText(),
                //),
                //Expanded(
                //  flex: 2,
                //  child: HeroImage(),
                //),
              //],
            //),
          ],
        ),
        
      ),
      )
      
    );
  }
}


class _ServingItems extends StatelessWidget {
  const _ServingItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return servingItems[index];
        },
        separatorBuilder: (context, _) {
          return const SizedBox(height: 40.0);
        },
        itemCount: servingItems.length,
        shrinkWrap: true,
      ),
    );
  }
}
