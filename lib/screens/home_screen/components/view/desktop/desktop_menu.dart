import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/menu_content.dart';

class DesktopMenu extends StatelessWidget {
  const DesktopMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Center(
        child:Center(
          child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 20.0, horizontal: mediaQuery.width * 0.18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
                
                children: [
                  Items(),
            ],
          ),
          
        ),
        )
        
      ),
    );
  }
}