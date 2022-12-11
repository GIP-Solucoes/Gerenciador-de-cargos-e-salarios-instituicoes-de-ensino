import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

//imagem layout menu esquerda (sistema)
class NavbarItemMenu extends StatefulWidget {
  String email;
  NavbarItemMenu({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<NavbarItemMenu> createState() =>
      _NavbarItemMenuState(email: this.email);
}

class _NavbarItemMenuState extends State<NavbarItemMenu> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  String tnome = '';
  String email;
  String foto = '';
  bool imagem = false;
  _NavbarItemMenuState({
    Key? key,
    required this.email,
  });
  void retornar_nome(String email) {
    String nome = 'teste';
    CollectionReference usuarios =
        FirebaseFirestore.instance.collection('Usuario');
    usuarios
        .where('email', isEqualTo: this.email)
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((element) {
        setState(() {
          this.tnome = element['primeiro_nome'];
          this.foto = element['foto'];
        });
      });
    }).catchError((e) => print(e.toString()));
    print('ttg');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      retornar_nome(this.email);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
          child: CircleAvatar(
        backgroundImage: NetworkImage(retornar_img()),
      )),
      Text(
        this.tnome,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
      )
    ]);
  }

  String retornar_img() {
    imagem = true;
    return foto;
  }
}
