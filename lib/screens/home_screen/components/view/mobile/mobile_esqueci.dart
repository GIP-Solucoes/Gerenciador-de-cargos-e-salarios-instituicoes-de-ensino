import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/esqueci_content.dart';

class MobileEsqueci extends StatefulWidget {

  MobileEsqueci({Key? key}) : super(key: key);

  @override
  State<MobileEsqueci> createState() => _MobileEsqueciState();
}

class _MobileEsqueciState extends State<MobileEsqueci> {
  String ema = '';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 20.0, horizontal: mediaQuery.width * 0.07),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              Row(
                children: [
                  TitleEsqueci(tamanho: mediaQuery.width * 0.85),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  EscritaEsqueci(tamanho: mediaQuery.width * 0.85),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 350 * 0.65,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          ema = value;
                        });
                      },
                      style: TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                        hintText: 'Insira seu e-mail...',
                        hintStyle: TextStyle(color: Colors.grey.shade200),
                        fillColor: Colors.white,
                        filled: true,
                        labelStyle: TextStyle(fontSize: 12),
                        contentPadding: EdgeInsets.only(left: 30),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  EsqueciBotao(
                    email: '$ema',
                  ),
                  VoltarBotao(
                    tamanhovoltar: 0.6,
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
