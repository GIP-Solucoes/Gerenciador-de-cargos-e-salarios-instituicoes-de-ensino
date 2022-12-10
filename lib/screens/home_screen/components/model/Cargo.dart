import 'package:gip_solucoes/screens/home_screen/components/model/FaixaSalarial.dart';

class Cargo {
  String competencias = "...";
  String descricao = "...";
  String nome = "...";
  int tempo_empresa = 0;
  int tempo_experiencia = 0;
  String titulo = "...";
  double valor_pontuacao = 0;
  int grau = 0;
  String instituicao = "...";
  String primeiro_nome = "...";
  String segundo_nome = "...";
  String matricula = "...";
  double pontuacao = 0;
  double pontuacaoFormacao = 0;
  double pontuacaoExperiencia = 0;
  double salario_ideal = 0;
  double quantidade_anos = 0;
  String usuario_id = "";
  List<FaixaSalarial> faixas = [];
  Cargo(
      this.competencias,
      this.descricao,
      this.nome,
      this.tempo_empresa,
      this.tempo_experiencia,
      this.titulo,
      this.valor_pontuacao,
      this.grau,
      this.instituicao);
}
