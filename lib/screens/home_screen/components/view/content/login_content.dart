import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Usuario.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/hero_content.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/sistema_content.dart';

class Login extends StatefulWidget {
  double tamanho;

  Login({Key? key, required this.tamanho}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showPassword = false;

  TextEditingController controllerEmail = new TextEditingController();

  TextEditingController controllerSenha = new TextEditingController();

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
          width: 300 * widget.tamanho,
          child: TextField(
            controller: controllerEmail,
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
          width: 300 * widget.tamanho,
          child: TextField(
            obscureText: showPassword==false?true:false,
            controller: controllerSenha,
            decoration: InputDecoration(
              hintText: 'Senha',
              suffixIcon: GestureDetector(
                child: Icon(
                    showPassword == false
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Colors.grey),
                onTap: () {
                  setState(
                    () {
                      showPassword = !showPassword;
                    },
                  );
                },
              ),
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
            width: 300 * widget.tamanho,
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
              minimumSize: MaterialStateProperty.resolveWith(
                  (states) => Size(300 * widget.tamanho, 45)),
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
            Usuario usuario = Usuario.getInformacoes();
            usuario.realizar_login(context,controllerEmail.text, controllerSenha.text);
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
