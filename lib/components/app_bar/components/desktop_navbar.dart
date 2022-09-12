import 'package:flutter/material.dart';
import 'package:gip_solucoes/constants.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/hero_content.dart';

import '../../components.dart';

class DesktopNavbar extends StatelessWidget {
  const DesktopNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    const height = 100.0;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: width > 850 ? (width * 0.07) : (width * 0.05)),
      height: height,
      child: Container(
        //mainAxisAlignment: MainAxisAlignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //logo
                  const Header(),
                  //navbar_items
                  SizedBox(
                    width: 15,
                  ),
                  const SizedBox(
                    height: 30,
                    child: NavbarItems(),
                  ),
                ]),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LoginButton(),
                  //const SearchButton(),
                  //const SizedBox(width: 10.0),
                  //IconButton(
                  //icon: const Icon(
                  //Icons.lock_outline,
                  //color: Colors.black,
                  //size: 25.0,
                  //),
                  //onPressed: () {},
                  //),
                ],
              )
          ],
        ),
        /*if(width>=1100)
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            //trailing
          //if (width >= 1100)
            //Column(
              
              //children: [
                const SearchButton(),
                const SizedBox(width: 10.0),
                IconButton(
                  icon: const Icon(
                    Icons.lock_outline,
                    color: Colors.black,
                    size: 25.0,
                  ),
                  onPressed: () {},
                ),
              //],
            //),
          ],)*/
        //],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style:ButtonStyle(
        minimumSize:MaterialStateProperty.resolveWith((states) => Size(120,45)),
        textStyle: MaterialStateProperty.resolveWith((states) => TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                // fontWeight: FontWeight.bold,
              ),),
        backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey[200]),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
      ),
      
      onPressed: () {
        pagina = 1;
        Navigator.pushNamed(context, '/');
      },
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                // fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.navigate_next_rounded, color: Colors.grey, size: 30.0),
          ],
        ),
    );
  }
}
