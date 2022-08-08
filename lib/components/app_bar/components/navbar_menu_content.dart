/*
Text(
                                e.title,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.josefinSans(
                                  color: Colors.blue[600],
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              )*/
                              import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderMenu extends StatelessWidget {
  const HeaderMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/unaerp.png',height: 60.0),
        //const SizedBox(width: 10.0),
        //Image.asset('assets/images/title.png', height: 35.0),
      ],
    );
  }
}
class Sair extends StatelessWidget {
  const Sair({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        Icon(Icons.settings,
        color: Colors.blue[600], size: 30.0
        ),
        SizedBox(width:50.0),
        Text(
                                'Sair',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.josefinSans(
                                  color: Colors.blue[600],
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(width: 5.0,),
                              Icon(Icons.input,
              color: Colors.blue[600], size: 20.0),
        //const SizedBox(width: 10.0),
        //Image.asset('assets/images/title.png', height: 35.0),
      ],
    );
  }
}
