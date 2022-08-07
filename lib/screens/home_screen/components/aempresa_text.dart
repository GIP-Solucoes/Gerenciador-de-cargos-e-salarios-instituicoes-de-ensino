import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
class AempresaText extends StatelessWidget {
  const AempresaText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [

        //Title(),
        Logo(),    
        //SizedBox(height: 40.0),
        //Paragrafo(),
        //SizedBox(height: 20.0),

        //CappucinoPrice(),
        //SizedBox(height: 10.0),
        //BuyNowButton(),
      ],
    );
  }
}
class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/logo.png',height: 55.0,),
        //const SizedBox(width: 10.0),
        //Image.asset('assets/images/title.png', height: 35.0),
      ],
    );
  }
}
  class Paragrafo extends StatelessWidget {
  const Paragrafo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      "Quando uma organização tem como objetivo atingir o máximo de suas metas traçadas, é preciso que ela defina, estrategicamente, uma gestão de pessoas bem estruturada e eficiente, dessa forma, favorece o ambiente de trabalho, que se tornará mais agradável e propício de alto desempenho profissional, conforme apontado em um estudo realizado por Lacombe (2008), intitulado: “Avaliação e mensuração de resultados em gestão de pessoas: um estudo com as maiores empresas instaladas no Brasil.”.\n\nA ferramenta de cargos e salários traz para o mercado uma visão sistêmica e contingencial, fazendo a organização se preocupar em integrar os cargos, ao invés de separar (LIMONGI, 2008). Diante disso, é possível encaixar a ferramenta de análise de cargos e salários, proposta por este trabalho, que pode facilitar a execução das tarefas diárias e se tornar de grande importância na administração humana do negócio.\n\nCom o objetivo de disponibilizar a descrição de cargos, processo que detalha todas as posições de uma organização, formalizando as atribuições dos cargos existentes em uma empresa, a ferramenta utilizará informações que devem ser previamente estabelecidas pela empresa contratante, uma vez que a partir destes dados, a aplicação fornecerá um retrato de cada cargo na empresa, uma forma breve do conjunto de especificações do cargo para consultas relacionadas à ferramenta de carreiras e remunerações, seja para promoções verticais ou horizontais e, até mesmo, para prestar contas ao Ministério do Trabalho (OLIVEIRA, 2017). A aplicação também apresentará informações acerca da remuneração e requisitos de crescimento profissional, como méritos salariais e promoções. Na visão de Rodrigues (2006) a remuneração tem como principal objetivo proporcionar ao indivíduo o reconhecimento do esforço em forma de recompensa, por sua contribuição para os resultados organizacionais.\n\nDesse modo, pode-se notar a importância em disponibilizar ao colaborador, informações a respeito de seu trabalho, detalhadas, com suas respectivas atribuições, plano de carreira, faixas salariais e demais informações, pois elas impactam diretamente a motivação do colaborador, e esta por sua vez, é “o processo responsável pela intensidade, direção e persistência dos esforços de uma pessoa para o alcance de uma determinada meta” (ROBBINS, 2005, p.132). contribuindo, portanto, com a organização da empresa e gestão de pessoas, e uma equipe determinada e motivada para atingir metas e conquistar benefícios com seus resultados.",
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
    );
  }
}

class TitleEmpresa extends StatelessWidget {
  const TitleEmpresa({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AutoSizeText(
      "Sobre nós",
      maxLines: 2,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 30.0,
        fontWeight: FontWeight.w900,
        fontFamily: 'Santana',
      ),
    );
  }
}