import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/hero_content.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/sistema_content.dart';

class Login extends StatelessWidget {
  double tamanho;
  Login({Key? key, required this.tamanho}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AutoSizeText(
          "Login",
          maxLines: 2,
          style: TextStyle(
            color: Colors.black,
            fontSize: 40.0,
            fontWeight: FontWeight.w900,
            fontFamily: 'Santana',
          ),
        ),
        SizedBox(
          height: 15,
        ),
        SizedBox(
          width: 300*tamanho,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'E-mail',
              fillColor: Colors.grey.shade200,
              filled: true,
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        SizedBox(
          width: 300*tamanho,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon:
                  Icon(Icons.visibility_off_outlined, color: Colors.grey),
              fillColor: Colors.grey.shade200,
              filled: true,
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ),
        SizedBox(height: 5),
        Container(
            alignment: Alignment.centerRight,
            width: 300*tamanho,
            child: TextButton(
                onPressed: () {
                  pagina = 3;
                  Navigator.pushNamed(context, '/');
                },
                child: const Text(
                  'Esqueci minha senha',
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.blue, fontSize: 12),
                ))),
        SizedBox(
          height: 15,
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize:
                  MaterialStateProperty.resolveWith((states) => Size(300*tamanho, 45)),
              textStyle: MaterialStateProperty.resolveWith(
                (states) => TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              backgroundColor:
                  MaterialStateProperty.resolveWith((states) => Colors.blue),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)))),
          onPressed: () {
            paginaS = 0;
            Navigator.pushNamed(context, '/sistema');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              Icon(Icons.navigate_next_rounded,
                  color: Colors.black, size: 30.0),
            ],
          ),
        ),
      ],
    );
  }
}
