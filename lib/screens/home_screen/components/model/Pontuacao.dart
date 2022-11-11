import 'package:gip_solucoes/screens/home_screen/components/model/PontuacaoAtributo.dart';

class Pontuacao {
  final String instituicao;
  final String nome;
  // ignore: non_constant_identifier_names
  final List<PontuacaoAtributo> pontuacaoAtributo;
  Pontuacao(this.instituicao, this.nome,this.pontuacaoAtributo);
}
