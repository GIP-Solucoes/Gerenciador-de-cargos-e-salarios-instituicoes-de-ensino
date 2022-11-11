import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Usuario {
  final DateTime data_admissao;
  final double quantidade_aprovacao_concurso;
  final double quantidade_cursos_aperfeicoamento;
  final double quantidade_cursos_extensao_cultural;
  final double quantidade_livros;
  final double quantidade_outros_cursos_realizados;
  final double quantidade_pesquisas_aprovadas;
  final double quantidade_professor_universidade_publica;
  final double quantidade_stricto_sensu;
  final double quantidade_trabalhos_cientificos_revista;
  final double quantidade_variaveis;
  final double quantidade_faltas;
  final double salario_ideal;
  final String instituicao;
  late final String email;
  late final String foto;
  late final String primeiro_nome;
  late final String segundo_nome;
  late final String telefone;
  Usuario(
      this.data_admissao,
      this.quantidade_aprovacao_concurso,
      this.quantidade_cursos_aperfeicoamento,
      this.quantidade_cursos_extensao_cultural,
      this.quantidade_livros,
      this.quantidade_outros_cursos_realizados,
      this.quantidade_pesquisas_aprovadas,
      this.quantidade_professor_universidade_publica,
      this.quantidade_stricto_sensu,
      this.quantidade_trabalhos_cientificos_revista,
      this.quantidade_variaveis,
      this.quantidade_faltas,
      this.salario_ideal,
      this.instituicao,
      this.email,
      this.foto,
      this.primeiro_nome,
      this.segundo_nome,
      this.telefone);
  static Usuario getInformacoes() {
    return Usuario(
        DateTime.now(), 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '', '', '', '', '', '');
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
    FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) {});
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.green,
      content: Text(
          'Caso o email exista em nossa base de dados, enviamos um mensagem ao seu email para alteração da senha!'),
      duration: Duration(seconds: 10),
    ));
  }
}
