import 'package:flutter/material.dart';

//imagem layout menu esquerda (sistema)
class NavbarItemMenu extends StatelessWidget {
  const NavbarItemMenu({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
        children:[
          const SizedBox(
          child: CircleAvatar(
            
  backgroundImage: AssetImage('assets/images/pedro.png'),
),),
          
         const Text(
          ' Pedro',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        )
        ] );
  }
}
