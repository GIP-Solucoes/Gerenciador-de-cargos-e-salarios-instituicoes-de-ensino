import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Base extends StatelessWidget {
  const Base({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      "Perguntas frequentes",
      textAlign: TextAlign.start,
      style: TextStyle(
        color: Colors.black,
        fontSize: 22.0,
      ),
    );
  }
}

class Imagem extends StatelessWidget {
  const Imagem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/unaerp.faq', height: 60.0),
      ],
    );
  }
}

class Perguntas extends StatelessWidget {
  double tamanhoitem;
  double tamanhoimagem;
  double espaco;
  Perguntas({Key? key, required this.tamanhoitem, required this.tamanhoimagem,required this.espaco})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              width: tamanhoitem,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ExpansionTile(
                title:
                    Text('1. O que é a GIP Soluções?'),
                backgroundColor: Colors.grey[200],
                iconColor: Colors.blue[600],
                collapsedIconColor: Colors.blue[600],
                children: [
                  ListTile(
                      title: Text(
                          'A GIP Soluções é um projeto com objetivo de disponibilizar um aplicativo web para gerenciar cargos e salários de instituições educacionais, através de planos de assinatura.\nÉ disponibilizado um acesso administrador que tem o poder de manusear e dar manutenção em cargos, salários, descrições, etc. O administrador pode conceder acesso aos demais usuários, que poderão através do web-app, visualizar informações a respeito de seu cargo.\nAtravés do GIP, a instituição poderá ter maior controle sobre os cargos, sobre os funcionários e também sobre os resultados financeiros.')),
                ],
              ),
            ),
            Container(
              width: tamanhoitem,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ExpansionTile(
                title:
                    Text('2. Não consigo redefinir a senha.'),
                backgroundColor: Colors.grey[200],
                iconColor: Colors.blue[600],
                collapsedIconColor: Colors.blue[600],
                children: [
                  ListTile(
                      title: Text(
                          'Você precisa ter acesso ao endereço de e-mail cadastrado para abrir o link de redefinição de senha que nós enviamos.\n\nNão recebeu o e-mail de redefinição de senha?\nVerifique as pastas de spam/lixo eletrônico ou qualquer outra pasta filtrada.\n\nO link para redefinição de senha não funciona?\nRedefina a senha novamente, mas desta vez abra o link do e-mail em uma janela anônima/privada do navegador.\n\nMuitas solicitações?\nTente de novo mais tarde ou use um dispositivo diferente.')),
                ],
              ),
            ),
            Container(
              width: tamanhoitem,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ExpansionTile(
                title:
                    Text('3. Não lembro minhas informações de login.'),
                backgroundColor: Colors.grey[200],
                iconColor: Colors.blue[600],
                collapsedIconColor: Colors.blue[600],
                children: [
                  ListTile(
                      title: Text(
                          'Se você não se lembrar da sua senha, use a página de redefinição de senha.\n\nSe não se lembrar do seu e-mail ou nome de usuário, procure pelo administrador da instituição para que ele possa lhe fornecer o e-mail ou usuário cadastrado.')),
                ],
              ),
            ),
            Container(
              width: tamanhoitem,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ExpansionTile(
                title:
                    Text('4. Quais são os planos e preços?'),
                backgroundColor: Colors.grey[200],
                iconColor: Colors.blue[600],
                collapsedIconColor: Colors.blue[600],
                children: [
                  ListTile(
                      title: Text(
                          'A GIP Soluções possui 3 planos de assinatura disponíveis. Sendo eles:\nTrimestral - R\$ 849,99\nSemestral - R\$ 1.685,00\nAnual - R\$ 3.369,99')),
                ],
              ),
            ),
            Container(
              width: tamanhoitem,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ExpansionTile(
                title:
                    Text('5. Quais são as formas de pagamento?'),
                backgroundColor: Colors.grey[200],
                iconColor: Colors.blue[600],
                collapsedIconColor: Colors.blue[600],
                children: [
                  ListTile(
                      title: Text(
                          'Utilizamos pagamento via PagSeguro, por ser mais rápido e também por serem métodos seguros para realizar operações através do seu cartão de crédito e outros meios.')),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 40*espaco,
        ),
        Column(
          children: [
            Container(
              height: tamanhoimagem,
              width: tamanhoimagem,
              child: Image.network('https://firebasestorage.googleapis.com/v0/b/implementacaotcc.appspot.com/o/fixos%2Ffaq.png?alt=media&token=59b1ddc5-458b-46bd-b7d3-9b31e564040b'),
            ),
          ],
        )
      ],
    );
  }
}
