import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/configuracoes_content.dart';

class DesktopConfiguracoes extends StatelessWidget {
  const DesktopConfiguracoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Center(
          child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.175),
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
                height: 450,
                width: 600,
                //margin: const EdgeInsets.all(20),
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
                              Primeironome(),
                              Dadosgerais(),
                              BotaoSalvar()
                            ],
                          ),
                          Column(
                            children: [
                              Segundonome(),
                              SizedBox(
                                height: 30,
                              ),
                              Alterarimagem()
                            ],
                          )
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
      )),
    );
  }
}