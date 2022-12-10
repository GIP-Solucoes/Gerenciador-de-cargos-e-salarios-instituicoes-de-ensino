import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Usuario.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/configuracoes_content.dart';

class DesktopConfiguracoes extends StatefulWidget {
  Usuario usuario;
  DesktopConfiguracoes({Key? key, required this.usuario}) : super(key: key);

  @override
  State<DesktopConfiguracoes> createState() => _DesktopConfiguracoesState();
}

class _DesktopConfiguracoesState extends State<DesktopConfiguracoes> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    TextEditingController controller_primeiro_nome = new TextEditingController();
    TextEditingController controller_segundo_nome = new TextEditingController();
    TextEditingController controller_email = new TextEditingController();
    TextEditingController controller_telefone = new TextEditingController();
    TextEditingController controller_senha = new TextEditingController();
    controller_primeiro_nome.text = widget.usuario.primeiro_nome;
    controller_segundo_nome.text = widget.usuario.segundo_nome;
    controller_email.text = widget.usuario.email;
    controller_telefone.text = widget.usuario.telefone;
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
                              Primeironome(
                                  controller: controller_primeiro_nome),
                              Dadosgerais(
                                  controllerEmail: controller_email,
                                  controllerTelefone: controller_telefone,senha: controller_senha),
                              BotaoSalvar(imagem: widget.usuario.foto,email: controller_email, primeiro_nome: controller_primeiro_nome, segundo_nome: controller_segundo_nome, senha: controller_senha, telefone: controller_telefone,)
                            ],
                          ),
                          Column(
                            children: [
                              Segundonome(controller: controller_segundo_nome),
                              SizedBox(
                                height: 30,
                              ),
                              Alterarimagem(foto: widget.usuario.foto)
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
