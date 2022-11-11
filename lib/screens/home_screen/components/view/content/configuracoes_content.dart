//import 'dart:html';
// ignore_for_file: unnecessary_this

import 'dart:convert';
import 'dart:io' as dart;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Usuario.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/sistema_content.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:html';

Usuario usuario = new Usuario(
    DateTime.now(), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '');
String senha = '';
var imagee;
List<bool> verificadores = [false, false, false, false];

class MenuText extends StatelessWidget {
  const MenuText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [],
    );
  }
}

class Resultados extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateResultados();
  }
}

class TitleConfiguracoes extends StatelessWidget {
  const TitleConfiguracoes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AutoSizeText(
      "Configurações",
      textAlign: TextAlign.start,
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

class Primeironome extends StatefulWidget {
  TextEditingController controller = new TextEditingController();
  Primeironome({Key? key, required this.controller}) : super(key: key);

  @override
  State<Primeironome> createState() => _PrimeironomeState();
}

class _PrimeironomeState extends State<Primeironome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AutoSizeText(
          "Primeiro nome",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.0),
              border: Border.all(color: Colors.grey)),
          child: TextField(
            controller: this.widget.controller,
            onChanged: (value) => setState(() {
              verificadores[0] = true;
            }),
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class Dadosgerais extends StatefulWidget {
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerTelefone = new TextEditingController();
  TextEditingController senha = new TextEditingController();
  Dadosgerais(
      {Key? key,
      required this.controllerEmail,
      required this.controllerTelefone,
      required this.senha})
      : super(key: key);

  @override
  State<Dadosgerais> createState() => _DadosgeraisState();
}

class _DadosgeraisState extends State<Dadosgerais> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AutoSizeText(
          "E-mail",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.0),
              border: Border.all(color: Colors.grey)),
          child: TextField(
            onChanged: (value) => setState(() {
              verificadores[1] = true;
            }),
            controller: this.widget.controllerEmail,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const AutoSizeText(
          "Telefone",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.0),
              border: Border.all(color: Colors.grey)),
          child: TextField(
            onChanged: (value) => setState(() {
              verificadores[2] = true;
            }),
            controller: widget.controllerTelefone,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const AutoSizeText(
          "Senha",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.0),
              border: Border.all(color: Colors.grey)),
          child: TextField(
            controller: widget.senha,
            obscureText: true,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class Segundonome extends StatefulWidget {
  TextEditingController controller;
  Segundonome({Key? key, required this.controller}) : super(key: key);

  @override
  State<Segundonome> createState() => _SegundonomeState();
}

class _SegundonomeState extends State<Segundonome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AutoSizeText(
          "Segundo nome",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.0),
              border: Border.all(color: Colors.grey)),
          child: TextField(
            onChanged: (value) => setState(() {
              verificadores[3] = true;
            }),
            controller: this.widget.controller,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class Alterarimagem extends StatefulWidget {
  String foto;
  Alterarimagem({Key? key, required this.foto}) : super(key: key);

  @override
  State<Alterarimagem> createState() => _AlterarimagemState(foto: foto);
}

class _AlterarimagemState extends State<Alterarimagem> {
  String foto;

  _AlterarimagemState({Key? key, required this.foto});
  dart.File? file;
  Uint8List webImage = Uint8List(8);
  late dart.File filee;
  //Uint8List? imageData;
  bool verificar = false;
  uploadToStorage() {
    InputElement input =
        (FileUploadInputElement()..accept = 'usuarios/*') as InputElement;
    FirebaseStorage fs = FirebaseStorage.instance;
    input.click();
    input.onChange.listen((event) {
      setState(() {
        //file = input.files!.first;
      });

      final reader = FileReader();
      //reader.readAsDataUrl(file);
//setState(() {
      //      imageData = file as Uint8List;
      //     verificar = true;
      // });
      reader.onLoadEnd.listen((event) async {
        final encoded = reader.result as String;
        final imageBase64 = encoded.replaceFirst(
            RegExp(r'data:image/[^;]+;base64,'),
            ''); // this is to remove some non necessary stuff
        setState(() {
          filee = dart.File.fromRawPath(base64Decode(imageBase64));
          verificar = true;
        });
        //var snapshot = await fs
        //    .ref()
        //    .child('usuarios/${DateTime.now().toString()}')
        //    .putBlob(file);
        //var downloadUrl = snapshot.ref.getDownloadURL();
      });
    });
  }

  Future<void> _pickImage() async {
    if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          file = dart.File('a');
          imagee = webImage;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AutoSizeText(
          "Alterar imagem de\nperfil",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        SizedBox(
            height: 125,
            width: 125,
            child: GestureDetector(
                onTap: () {
                  _pickImage();
                },
                child: Stack(
                  children: [
                    Center(
                      child: file != null
                          ? SizedBox(
                              height: 125,
                              width: 125,
                              child: CircleAvatar(
                                backgroundImage: MemoryImage(webImage),
                              ),
                            )
                          : SizedBox(
                              height: 125,
                              width: 125,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(this.widget.foto),
                              ),
                            ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 85),
                        child: Container(
                          height: 25,
                          alignment: Alignment.bottomRight,
                          child: FloatingActionButton(
                            backgroundColor: Colors.grey,
                            onPressed: () {
                              _pickImage();
                            },
                            child: Icon(
                              Icons.edit,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ))),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}

class BotaoVoltar extends StatelessWidget {
  BotaoVoltar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        paginaS = pagina_backup;
        Navigator.pushNamed(context, '/sistema');
      },
      child: Container(
        alignment: Alignment.center,
        width: 110.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_back_ios, color: Colors.white, size: 30.0),
            Text(
              "VOLTAR",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BotaoSalvar extends StatefulWidget {
  // ignore: unnecessary_new
  String imagem;
  TextEditingController email, senha, primeiro_nome, segundo_nome, telefone;
  BotaoSalvar(
      {Key? key,
      required this.imagem,
      required this.email,
      required this.senha,
      required this.primeiro_nome,
      required this.segundo_nome,
      required this.telefone})
      : super(key: key);

  @override
  State<BotaoSalvar> createState() => _BotaoSalvarState();
}

class _BotaoSalvarState extends State<BotaoSalvar> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          String downloadUrl = "";
          if (imagee != null) {
            FirebaseStorage storage = FirebaseStorage.instance;
            var snapshot = await storage
                .ref('usuarios/img-${DateTime.now().toString()}.jpg')
                .putData(imagee);
            downloadUrl = await snapshot.ref.getDownloadURL();
            storage.refFromURL(widget.imagem).delete();
          }
          CollectionReference usuarios =
              FirebaseFirestore.instance.collection('Usuario');
          usuarios
              .where('foto', isEqualTo: widget.imagem)
              .get()
              .then((QuerySnapshot q) {
            q.docs.forEach((element) {
              var e = element.reference;
              if (downloadUrl != "") {
                e.update({"foto": downloadUrl});
              }
              if (verificadores[0])
                e.update({"primeiro_nome": widget.primeiro_nome.text});
              if (verificadores[1]) {
                if (widget.email.text.isEmpty ||
                    !widget.email.text.contains('@')) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content: Text('Email inválido!'),
                    duration: Duration(seconds: 5),
                  ));
                } else {
                  FirebaseAuth aut = FirebaseAuth.instance;
                  User? use = aut.currentUser;
                  if (use != null) {
                    use!.email!;
                    use.updateEmail(widget.email.text);
                  }
                  e.update({"email": widget.email.text});
                }
              }
              if (verificadores[2])
                e.update({"telefone": widget.telefone.text});
              if (verificadores[3])
                e.update({"segundo_nome": widget.segundo_nome.text});
            });
          });
          if (widget.senha.text.isNotEmpty) {
            if (widget.senha.text.length < 6) {
              //falar para colocar senha maior q 6
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Text('A senha deve ter pelo menos 6 caracteres!'),
                duration: Duration(seconds: 5),
              ));
            } else {
              TextEditingController senha_atual = new TextEditingController();
              TextEditingController nova_senha = new TextEditingController();
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: Text(
                          "Alterar senha",
                        ),
                        content: Column(
                          children: [
                            Text(
                                "Para alterar a senha, insira a senha atual e confirme a senha inserida."),
                            Text("Senha atual:"),
                            TextField(
                              controller: senha_atual,
                              obscureText: true,
                            ),
                            Text("Nova senha:"),
                            TextField(
                              obscureText: true,
                              controller: nova_senha,
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                if (nova_senha.text != widget.senha.text) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(
                                        'A senha informada anteriormente não é igual a informada agora!'),
                                    duration: Duration(seconds: 5),
                                  ));
                                } else {
                                  User? use = FirebaseAuth.instance.currentUser;
                                  if (use != null) {
                                    AuthCredential credential =
                                        EmailAuthProvider.credential(
                                            email: use.email!,
                                            password: senha_atual.text);
                                    use
                                        .reauthenticateWithCredential(
                                            credential)
                                        .then((value) {
                                      use.updatePassword(nova_senha.text);
                                      showDialog(
                                          context: context,
                                          builder: (_) => AlertDialog(
                                                title: Text(
                                                  "Dados salvos!",
                                                ),
                                                content: Text(
                                                    "Os dados foram salvos com sucesso."),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        paginaS = pagina_backup;
                                                        Navigator
                                                            .popAndPushNamed(
                                                                context,
                                                                '/sistema');
                                                      },
                                                      child: Text('Ok')),
                                                ],
                                              ));
                                    }).catchError((e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text(
                                            'A senha informada não condiz com a atual ou houve algum problema na autenticação.'),
                                        duration: Duration(seconds: 5),
                                      ));
                                    });
                                  }
                                }
                              },
                              child: Text('Ok')),
                        ],
                      ));
            }
          } else if (verificadores[0] == true ||
              verificadores[2] == true ||
              verificadores[3] == true ||
              verificadores[1] == true ||
              imagee != null) {
            if (widget.email.text.isNotEmpty && widget.email.text.contains('@'))
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: Text(
                          "Dados salvos!",
                        ),
                        content: Text("Os dados foram salvos com sucesso."),
                        actions: [
                          TextButton(
                              onPressed: () {
                                paginaS = pagina_backup;
                                Navigator.popAndPushNamed(context, '/sistema');
                              },
                              child: Text('Ok')),
                        ],
                      ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text('Nenhum dado foi alterado para ser salvo!'),
              duration: Duration(seconds: 5),
            ));
          }
        },
        child: Container(
          alignment: Alignment.center,
          width: 110.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back_ios, color: Colors.white, size: 30.0),
              Text(
                "SALVAR",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ));
  }
}

class _StateResultados extends State<Resultados> {
  int ind = 0;
  late ScrollController scrollCont;
  BuildContext? tabContext;
  double mediaQueryx = 0;

  @override
  void initState() {
    super.initState();
  }

  final dropValue = ValueNotifier('');

  _StateResultados({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    int quantidadel = 2;
    final mediaQuery = MediaQuery.of(context).size;
    mediaQueryx = mediaQuery.width;

    return Container(
      height: 400,
      width: 600,
      //margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 15.0, horizontal: mediaQuery.width * 0.01),
          child: Column(children: [
            //],)
          ])),
    );
  }
}
