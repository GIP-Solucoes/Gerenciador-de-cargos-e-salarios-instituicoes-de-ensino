import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Usuario {
  final String email;
  final String senha;

  Usuario(this.email, this.senha);
  static Usuario getInformacoes() {
    return Usuario('email', 'senha');
  }

  // ignore: non_constant_identifier_names
  void realizar_login(context, emailp, senhap) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailp, password: senhap)
        .then((resultado) {
      Navigator.pushReplacementNamed(
        context,
        '/sistema',
        arguments: {'id': resultado.user!.uid},
      );
    }).catchError((erro) {
      var mensagem = '';
      if (erro.code == 'user-not-found') {
        mensagem = 'ERRO: Usuário não encontrado.';
      } else if (erro.code == 'wrong-password') {
        mensagem = 'ERRO: Senha incorreta.';
      } else if (erro.code == 'invalid-email') {
        mensagem = 'ERRO: Email inválido.';
      } else {
        mensagem = 'ERRO: ${erro.message}';
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text('$mensagem'),
        duration: Duration(seconds: 2),
      ));
    });
  }

  void realizar_esqueci(context, email) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) {
      
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Text('Caso o email exista em nossa base de dados, enviamos um mensagem ao seu email para alteração da senha!'),
        duration: Duration(seconds: 10),
      ));
      
  }
}
