class PontuacaoAtributo {
  final String nome;
  final int quantidade_maxima;
  final double valor;

  PontuacaoAtributo(this.nome,this.quantidade_maxima,this.valor);
  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'quantidade_maxima': quantidade_maxima,
      'valor': valor,
    };
  }

  factory PontuacaoAtributo.fromMap(Map<String, dynamic> map) {
    return PontuacaoAtributo(
        map['nome'],
        map['quantidade_maxima'],
        map['valor']);
  }
}
