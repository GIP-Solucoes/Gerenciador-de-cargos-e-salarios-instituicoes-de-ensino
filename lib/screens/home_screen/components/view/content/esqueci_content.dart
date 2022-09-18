import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/hero_content.dart';

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
  EsqueciCampo({Key? key, required this.tamanho2}) : super(key: key);

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
  const EsqueciBotao({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class VoltarBotao extends StatelessWidget {
  double tamanhovoltar;
  VoltarBotao({
    Key? key,required this.tamanhovoltar
  }) : super(key: key);

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
