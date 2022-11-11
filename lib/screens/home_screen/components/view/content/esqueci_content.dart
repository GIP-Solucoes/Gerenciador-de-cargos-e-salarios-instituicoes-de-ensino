import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Usuario.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/hero_content.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_esqueci.dart';



class EscritaEsqueci extends StatelessWidget {
  double tamanho;
  EscritaEsqueci({Key? key, required this.tamanho}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: tamanho,
      child: AutoSizeText(
        "Não tem problema! Só precisamos do e-mail fornecido no seu cadastro.",
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
      ),
    );
  }
}

class TitleEsqueci extends StatelessWidget {
  double tamanho;
  TitleEsqueci({Key? key, required this.tamanho}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: tamanho,
      child: const AutoSizeText(
        "Esqueceu a senha?",
        textAlign: TextAlign.start,
        maxLines: 2,
        style: TextStyle(
          color: Colors.blue,
          fontSize: 30.0,
          fontWeight: FontWeight.w900,
          fontFamily: 'Santana',
        ),
      ),
    );
  }
}

class EsqueciCampo extends StatelessWidget {
  double tamanho2;
  TextEditingController controllerEmail = new TextEditingController();
  EsqueciCampo(
      {Key? key, required this.tamanho2, required this.controllerEmail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350 * tamanho2,
      child: TextField(
        style: TextStyle(color: Colors.grey),
        decoration: InputDecoration(
          hintText: 'Insira seu e-mail...',
          hintStyle: TextStyle(color: Colors.grey.shade200),
          fillColor: Colors.white,
          filled: true,
          labelStyle: TextStyle(fontSize: 12),
          contentPadding: EdgeInsets.only(left: 30),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}

class EsqueciBotao extends StatelessWidget {
  String email;
  EsqueciBotao({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Usuario usuario = new Usuario(DateTime.now(), 1,1,1,1,1,1,1,1,1,1,1,0,'', '', '', '', '', '');
        usuario.realizar_esqueci(context, this.email);
      },
      child: Container(
        alignment: Alignment.center,
        width: 150.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Redefinir senha",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VoltarBotao extends StatelessWidget {
  double tamanhovoltar;
  VoltarBotao({Key? key, required this.tamanhovoltar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 150.0 * tamanhovoltar,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              pagina = 1;
              Navigator.pushNamed(context, '/');
            },
            child: Text(
              "Voltar",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
