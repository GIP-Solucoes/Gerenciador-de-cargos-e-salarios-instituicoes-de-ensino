import 'package:flutter/material.dart';

// navbar_items
//final navbarItems = ["A empresa", "Suporte", "Icone", "FAQ"];

class NavbarItemMenu extends StatelessWidget {
  const NavbarItemMenu({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
        children:[
          SizedBox(
          child:CircleAvatar(
            
  backgroundImage: AssetImage('assets/images/pedro.png'),
),),
          
         Text(
          ' Pedro',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        )
        ] );
    //Text(
    //'Pedro',
    //style: const TextStyle(
    //  color: Colors.black,
    //  fontSize: 20.0,
    //),
    //);
  }
}
