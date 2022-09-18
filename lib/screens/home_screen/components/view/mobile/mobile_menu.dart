import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/menu_content.dart';

class MobileMenu extends StatelessWidget {
  const MobileMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child:Column(
          children:[
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
                
                children: [
                  Items()
            ],
          
        )]
        )
    );
  }
}