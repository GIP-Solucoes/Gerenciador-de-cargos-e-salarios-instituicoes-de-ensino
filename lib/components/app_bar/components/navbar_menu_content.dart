import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/hero_content.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/sistema_content.dart';

String inst = 'k';

//conteudo layout cima (sistema)
class HeaderMenu extends StatefulWidget {
  String email;

  HeaderMenu({Key? key, required this.email}) : super(key: key);

  @override
  State<HeaderMenu> createState() => _HeaderMenuState(email: this.email);
}

class _HeaderMenuState extends State<HeaderMenu> {
  String email;

  _HeaderMenuState({Key? key, required this.email});
  String instituicao = '';
  String url =
      'https://icones.pro/wp-content/uploads/2021/05/icone-de-l-ecole-bleu.png';
  String retornar_nome(String email) {
    String nome = 'teste';
    CollectionReference usuarios =
        FirebaseFirestore.instance.collection('Usuario');
    usuarios
        .where('email', isEqualTo: this.widget.email)
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((element) {
        retornar_url(element['instituicao']);
      });
    });

    return inst;
  }

  Future<void> retornar_url(String instituicaop) async {
    CollectionReference instituicoes =
        FirebaseFirestore.instance.collection('Instituicao');
    DocumentSnapshot instit = await instituicoes.doc(instituicaop).get();
    setState(() {
      url = instit['logo'];
    });
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () {
              paginaS = 0;
              Navigator.pushNamed(context, '/sistema');
            },
            child: Image.network(url, height: 60.0)),
      ],
    );
  }
}

class Sair extends StatelessWidget {
  const Sair({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.settings, color: Colors.blue[600], size: 30.0),
          onPressed: () {
            if (paginaS != 1) pagina_backup = paginaS;
            paginaS = 1;
            Navigator.pushNamed(context, '/sistema');
          },
        ),
        SizedBox(width: 50.0),
        TextButton(
          onPressed: () {
            paginaU = 0;
          
          FirebaseAuth.instance.signOut();
            pagina = 1;
            Navigator.pushNamed(context, '/');
          },
          child: Row(
            children: [
              Text(
                'Sair',
                textAlign: TextAlign.center,
                style: GoogleFonts.josefinSans(
                  color: Colors.blue[600],
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Icon(Icons.input, color: Colors.blue[600], size: 20.0),
            ],
          ),
        ),
      ],
    );
  }
}
