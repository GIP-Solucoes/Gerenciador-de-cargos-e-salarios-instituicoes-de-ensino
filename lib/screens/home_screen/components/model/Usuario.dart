import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Cargo.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/SituacaoAdmissional.dart';

class Usuario {
  DateTime data_admissao;
  double quantidade_aprovacao_concurso;
  double quantidade_cursos_aperfeicoamento;
  double quantidade_cursos_extensao_cultural;
  double quantidade_livros;
  double quantidade_outros_cursos_realizados;
  double quantidade_pesquisas_aprovadas;
  double quantidade_professor_universidade_publica;
  double quantidade_stricto_sensu;
  double quantidade_trabalhos_cientificos_revista;
  double quantidade_variaveis;
  double quantidade_faltas;
  double salario_ideal;
  late double salario_atual;
  final String instituicao;
  late final String email;
  late final String foto;
  late String primeiro_nome;
  late String segundo_nome;
  late String telefone;
  String matricula = "...";
  double pontuacao = 0;
  double quantidade_anos = 0;
  String status = "...";
  String obs = "...";
  String pass = "123456";
  String id_cargo = "";
  String id_status = "";
  String cargo_antigo = "FzdK008ea6QlbrKww8Za";
  String id_usuario="";
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
    return Usuario(DateTime.now(), 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '', '',
        '', '', '', '');
  }

  SituacaoAdmissional situacaoAdmissional =
      new SituacaoAdmissional(false, '...');
  Cargo cargo = new Cargo('...', '...', '...', 0, 0, '...', 0, 0, '...');
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
