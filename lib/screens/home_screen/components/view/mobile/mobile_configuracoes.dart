import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/configuracoes_content.dart';

class MobileConfiguracoes extends StatelessWidget {
  const MobileConfiguracoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    TextEditingController controller = new TextEditingController();
    return SingleChildScrollView(
        child: Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 5),
                TitleConfiguracoes(),
              ],
            ),
            Container(
              height: 800,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: mediaQuery.width * 0.01),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Primeironome(
                              controller: controller,
                            ),
                            Segundonome(
                              controller: controller,
                            ),
                            Dadosgerais(
                              controllerEmail: controller,
                              controllerTelefone: controller,
                              senha: controller,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Alterarimagem(
                              foto: '',
                            ),
                            BotaoSalvar(imagem: '', email: controller, primeiro_nome: controller, segundo_nome: controller, senha: controller, telefone: controller,),
                          ],
                        ),
                      ])),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                BotaoVoltar(),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
