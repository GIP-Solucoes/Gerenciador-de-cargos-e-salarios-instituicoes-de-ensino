import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Cargo.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/FaixaSalarial.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Pontuacao.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/PontuacaoAtributo.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/SituacaoAdmissional.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Usuario.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_cargos.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_configuracoes.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_login.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_menu.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_meucargo.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_pontuacoes.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_professores.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_resultados.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_status.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_suaspontuacoes.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_tabela.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_cargos.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_configuracoes.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_login.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_menu.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_meucargo.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_pontuacoes.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_professores.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_resultados.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_simulador.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_status.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_suaspontuacoes.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/mobile/mobile_tabela.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_cargos.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_configuracoes.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/desktop/desktop_simulador.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_login.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_menu.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_meucargo.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_pontuacoes.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_professores.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_resultados.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_simulador.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_status.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_suaspontuacoes.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/tablet/tablet_tabela.dart';

int paginaS = 11;
int pagina_backup = 0;
int paginaU = 0;
int carregamento = 0;
int mais_uma_vez = 0;

class SistemaContent extends StatefulWidget {
  String email;
  SistemaContent({Key? key, required this.email}) : super(key: key);

  @override
  State<SistemaContent> createState() {
    return _StateSistemaContent(email: this.email);
  }
}

class _StateSistemaContent extends State<SistemaContent> {
  double total_atual = 0;
  double total_ideal = 0;
  List<Usuario> usuarios = [];
  String email;
  List<Cargo> cargosss = [];
  List<Cargo> cargos_antigo = [];
  cargoo(
      usuariop,
      String cargo_antigo,
      String matricula,
      String primeiro_nome,
      String segundo_nome,
      String instituition,
      String cargo,
      String usuario0) async {
    CollectionReference cargos = FirebaseFirestore.instance.collection('Cargo');
    DocumentSnapshot? cargg = await cargos.doc(cargo_antigo).get();
    Cargo cargobase2 = new Cargo(
        cargg['competencias'],
        cargg['descricao'],
        cargg['nome'],
        cargg['tempo_empresa'],
        cargg['tempo_experiencia'],
        cargg['titulo'],
        cargg['valor_pontuacao'],
        cargg['grau'],
        cargg['instituicao']);
    cargobase2.matricula = matricula;
    cargobase2.primeiro_nome = primeiro_nome;
    cargobase2.segundo_nome = segundo_nome;
    cargobase2.usuario_id = usuario0;
    cargos_antigo.add(cargobase2);
    DocumentSnapshot? carg = await cargos.doc(cargo).get();
    Cargo cargobase = new Cargo(
        carg['competencias'],
        carg['descricao'],
        carg['nome'],
        carg['tempo_empresa'],
        carg['tempo_experiencia'],
        carg['titulo'],
        carg['valor_pontuacao'],
        carg['grau'],
        carg['instituicao']);
    cargobase.usuario_id = usuario0;
    cargobase.matricula = usuariop['matricula'];
    cargobase.primeiro_nome = usuariop['primeiro_nome'];
    cargobase.segundo_nome = usuariop['segundo_nome'];
    cargobase.salario_ideal = usuariop['salario_ideal'];
    cargobase.pontuacao = carg['valor_pontuacao'];
    DocumentReference _documentReference = carg.reference;

    CollectionReference _collectionReference =
        _documentReference.collection('FaixaSalarial');
    _collectionReference
        .orderBy('final_intervalo', descending: false)
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((elemental) {
        cargobase.faixas.add(new FaixaSalarial(
            elemental['final_intervalo'], elemental['valor']));
      });
    });
    CollectionReference pontuacoe =
        FirebaseFirestore.instance.collection('Pontuacao');

    pontuacoe
        .where('instituicao', isEqualTo: instituition)
        .orderBy('nome', descending: false)
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((elementtt) {
        DocumentReference _documentReference = elementtt.reference;

        CollectionReference _collectionReference =
            _documentReference.collection('PontuacaoAtributo');
        List<PontuacaoAtributo> pontuacaoAtrib = [];
        _collectionReference
            .orderBy('nome', descending: false)
            .get()
            .then((QuerySnapshot q) {
          q.docs.forEach((elementt) {
            double valor = 0;
            bool valor_logico = false;
            bool valor_logico_experiencia = false;

            pontuacaoAtrib.add(new PontuacaoAtributo(elementt['nome'],
                elementt['quantidade_maxima'], elementt['valor']));
            if (elementtt['nome'] == "Pontua????o de Forma????o Acad??mica") {
              valor_logico = true;
              if (elementt['nome'] ==
                  "Cursos de Aperfei??oamento (m??nimo 180 Hs)") {
                if (usuariop['quantidade_cursos_aperfeicoamento'] >
                    elementt['quantidade_maxima']) {
                  valor = elementt['quantidade_maxima'] * elementt['valor'];
                } else {
                  valor = usuariop['quantidade_cursos_aperfeicoamento'] *
                      elementt['valor'];
                }
              } else if (elementt['nome'] ==
                  "Cursos de Extens??o Cultural (m??nimo 30 Hs)") {
                if (usuariop['quantidade_cursos_extensao_cultural'] >
                    elementt['quantidade_maxima']) {
                  valor = elementt['quantidade_maxima'] * elementt['valor'];
                } else {
                  valor = usuariop['quantidade_cursos_extensao_cultural'] *
                      elementt['valor'];
                }
              } else if (elementt['nome'] ==
                  'Cr??ditos de P??s-Gradua????o "Stricto Sensu" por disciplina') {
                if (usuariop['quantidade_stricto_sensu'] >
                    elementt['quantidade_maxima']) {
                  valor = elementt['quantidade_maxima'] * elementt['valor'];
                } else {
                  valor =
                      usuariop['quantidade_stricto_sensu'] * elementt['valor'];
                }
              } else if (elementt['nome'] == "Vari??veis") {
                if (usuariop['quantidade_variaveis'] >
                    elementt['quantidade_maxima']) {
                  valor = elementt['quantidade_maxima'] * elementt['valor'];
                } else {
                  valor = usuariop['quantidade_variaveis'] * elementt['valor'];
                }
              } else if (elementt['nome'] == "Outros Cursos de Gradua????o") {
                if (usuariop['quantidade_outros_cursos_realizados'] >
                    elementt['quantidade_maxima']) {
                  valor = elementt['quantidade_maxima'] * elementt['valor'];
                } else {
                  valor = usuariop['quantidade_outros_cursos_realizados'] *
                      elementt['valor'];
                }
              } else {
                if (usuariop['quantidade_aprovacao_concurso'] >
                    elementt['quantidade_maxima']) {
                  valor = elementt['quantidade_maxima'] * elementt['valor'];
                } else {
                  valor = usuariop['quantidade_aprovacao_concurso'] *
                      elementt['valor'];
                }
              }
            } else if (elementtt['nome'] == "Experi??ncia") {
              valor_logico_experiencia = true;
              if (elementt['nome'] ==
                  "Trabalhos cient??ficos publicados em revista especializada") {
                if (usuariop['quantidade_trabalhos_cientificos_revista'] >
                    elementt['quantidade_maxima']) {
                  valor = elementt['quantidade_maxima'] * elementt['valor'];
                } else {
                  valor = usuariop['quantidade_trabalhos_cientificos_revista'] *
                      elementt['valor'];
                }
              } else if (elementt['nome'] ==
                  "Realiza????o de Pesquisa aprovada pela Institui????o (M??nimo 1 ano)") {
                if (usuariop['quantidade_pesquisas_aprovadas'] >
                    elementt['quantidade_maxima']) {
                  valor = elementt['quantidade_maxima'] * elementt['valor'];
                } else {
                  valor = usuariop['quantidade_pesquisas_aprovadas'] *
                      elementt['valor'];
                }
              } else if (elementt['nome'] ==
                  "Professor de universidade p??blica (Por ano completo)") {
                if (usuariop['quantidade_professor_universidade_publica'] >
                    elementt['quantidade_maxima']) {
                  valor = elementt['quantidade_maxima'] * elementt['valor'];
                } else {
                  valor =
                      usuariop['quantidade_professor_universidade_publica'] *
                          elementt['valor'];
                }
              } else {
                if (usuariop['quantidade_livros'] >
                    elementt['quantidade_maxima']) {
                  valor = elementt['quantidade_maxima'] * elementt['valor'];
                } else {
                  valor = usuariop['quantidade_livros'] * elementt['valor'];
                }
              }
            } else if (elementtt['nome'] == "Assiduidade") {
              if (usuariop['quantidade_faltas'] <=
                  elementt['quantidade_maxima']) {
                valor = elementt['valor'];
              } else {
                valor = 0;
              }
            } else {
              double yearsBetween(DateTime from, DateTime to) {
                from = DateTime(from.year, from.month, from.day);
                to = DateTime(to.year, to.month, to.day);
                return (to.difference(from).inHours / 24 / 365)
                    .toInt()
                    .toDouble();
              }

              double monthsBetween(DateTime from, DateTime to) {
                from = DateTime(from.year, from.month, from.day);
                to = DateTime(to.year, to.month, to.day);
                return (to.difference(from).inHours / 24 / 365 * 12)
                    .toInt()
                    .toDouble();
              }

              Teste:
              DateTime date1 = usuariop['data_admissao'].toDate();
              DateTime date2 = DateTime.now();
              cargobase.quantidade_anos = yearsBetween(date1, date2);
              if (cargobase.quantidade_anos > elementt['quantidade_maxima']) {
                valor = elementt['quantidade_maxima'] * elementt['valor'];
              } else {
                valor = cargobase.quantidade_anos * elementt['valor'];
              }
            }
            if (valor_logico == true) {
              cargobase.pontuacaoFormacao = cargobase.pontuacaoFormacao + valor;
            }

            if (valor_logico_experiencia == true) {
              cargobase.pontuacaoExperiencia =
                  cargobase.pontuacaoExperiencia + valor;
            }

            cargobase.pontuacao = cargobase.pontuacao + valor;
          });
        }).catchError((e) => print(e.toString()));
      });
    });
    cargosss.add(cargobase);
  }

  List<SituacaoAdmissional> situacoesAdm = [];
  situacaoAdmissional(String situacaop, String matricul, String primeiro_nom,
      String segundo_nom, String id_usuario) async {
    CollectionReference situacoes =
        FirebaseFirestore.instance.collection('SituacaoAdmissional');
    DocumentSnapshot? sit = await situacoes.doc(situacaop).get();
    SituacaoAdmissional situation =
        new SituacaoAdmissional(sit['calcula_valor'], sit['nome']);
    situation.matricula = matricul;
    situation.primeiro_nome = primeiro_nom;
    situation.segundo_nome = segundo_nom;
    situation.id_usuario = id_usuario;
    situacoesAdm.add(situation);
  }

  List<SituacaoAdmissional> situacoesAllAdm = [];
  retornar_situacoes() {
    CollectionReference situacoes =
        FirebaseFirestore.instance.collection('SituacaoAdmissional');
    situacoes
        .where('instituicao', isEqualTo: usuario.instituicao)
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((elementS) {
        SituacaoAdmissional sit = new SituacaoAdmissional(
            elementS['calcula_valor'], elementS['nome']);
        sit.id_situacao = elementS.id;
        setState(() {
          situacoesAllAdm.add(sit);
        });
      });
    });
  }

  retornar_considera(String status, double atual, double ideal) async {
    CollectionReference statuss =
        FirebaseFirestore.instance.collection('SituacaoAdmissional');
    DocumentSnapshot? stat = await statuss.doc(status).get();
    if (stat['calcula_valor'] == true) {
      setState(() {
        total_atual = total_atual + atual;
        total_ideal = total_ideal + ideal;
      });
    }
  }

  retornar_usuarios() {
    int indice = 0;
    String inst = this.usuario.instituicao;
    CollectionReference usuarioss =
        FirebaseFirestore.instance.collection('Usuario');
    usuarioss
        .where('instituicao', isEqualTo: inst)
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((element) {
        setState(() {
          retornar_considera(element['status'], element['salario_atual'],
              element['salario_ideal']);

          this.usuarios.add(new Usuario(
              element['data_admissao'].toDate(),
              element['quantidade_aprovacao_concurso'],
              element['quantidade_cursos_aperfeicoamento'],
              element['quantidade_cursos_extensao_cultural'],
              element['quantidade_livros'],
              element['quantidade_outros_cursos_realizados'],
              element['quantidade_pesquisas_aprovadas'],
              element['quantidade_professor_universidade_publica'],
              element['quantidade_stricto_sensu'],
              element['quantidade_trabalhos_cientificos_revista'],
              element['quantidade_variaveis'],
              element['quantidade_faltas'],
              element['salario_ideal'],
              element['instituicao'],
              element['email'],
              element['foto'],
              element['primeiro_nome'],
              element['segundo_nome'],
              element['telefone']));
          usuarios[usuarios.length - 1].id_usuario = element.id;
          usuarios[usuarios.length - 1].matricula = element['matricula'];
          usuarios[usuarios.length - 1].obs = element['obs'];
          usuarios[usuarios.length - 1].salario_atual =
              element['salario_atual'];
          usuarios[usuarios.length - 1].status = element['status'];
          usuarios[usuarios.length - 1].id_status = element['status'];
          usuarios[usuarios.length - 1].id_cargo = element['cargo'];
          usuarios[usuarios.length - 1].cargo_antigo = element['cargo_antigo'];
          cargoo(
              element,
              element['cargo_antigo'],
              element['matricula'],
              element['primeiro_nome'],
              element['segundo_nome'],
              inst,
              element['cargo'],
              element.id);
          situacaoAdmissional(element['status'], element['matricula'],
              element['primeiro_nome'], element['segundo_nome'], element.id);
        });
      });
    });
  }

  List<Pontuacao> pont = [
    new Pontuacao('0', 'Carregando...', [new PontuacaoAtributo('nome', 0, 0)])
  ];
  double valor_atual = 0;
  double proximo_valor = 0;
  double intervalo_atual_inicio = 0;
  double intervalo_atual_fim = 0;
  double intervalo_proximo_inicio = 0;
  double intervalo_proximo_fim = 0;
  List<Pontuacao> pontuacoes = [];
  double quantidade_anos = 0;
  double quantidade_meses = 0;
  double pontuacao_cargo = 0;
  Usuario usuario = new Usuario(DateTime.now(), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, '', '', '', '', '', '');

  Cargo cargo = new Cargo(
      'Carregando compet??ncias...',
      'Carregando descri????o...',
      'Carregando nome...',
      0,
      0,
      'Carregando t??tulo...',
      0,
      -1,
      't');
  double soma = 0;

  String nome_cargo = "Caregando nome...";
  String competencias_cargo = "Carregando requisitos...";
  String titulo_cargo = "Carregando t??tulo...";
  _StateSistemaContent({Key? key, required this.email});
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (this.email != '') {
      CollectionReference usuarios =
          FirebaseFirestore.instance.collection('Usuario');
      usuarios
          .where('email', isEqualTo: this.widget.email)
          .get()
          .then((QuerySnapshot q) {
        q.docs.forEach((element) {
          if (element['direitos_administrador'] == false) {
            setState(() {
              paginaU = 1;
            });
          } else {
            setState(() {
              paginaU = 2;
            });
          }
        });
      });
      get_cargo();
    }
  }

  get_cargo() {
    CollectionReference usuarios =
        FirebaseFirestore.instance.collection('Usuario');
    usuarios
        .where('email', isEqualTo: this.widget.email)
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((element) {
        setState(() {
          carregamento = 1;
        });
        retornar_cargo(element['cargo']);
      });
    });
  }

  get_cargo_faixas(double soma) {
    CollectionReference usuarios =
        FirebaseFirestore.instance.collection('Usuario');
    usuarios
        .where('email', isEqualTo: this.widget.email)
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((element) {
        get_faixas_salariais_individual(soma, element['cargo']);
      });
    });
  }

  Future<void> get_faixas_salariais_individual(
      double soma, String cargo) async {
    CollectionReference cargos = FirebaseFirestore.instance.collection('Cargo');
    DocumentSnapshot carg = await cargos.doc(cargo).get();
    CollectionReference faixassalarias =
        carg.reference.collection('FaixaSalarial');
    faixassalarias
        .where('final_intervalo', isGreaterThanOrEqualTo: this.soma)
        .orderBy('final_intervalo', descending: true)
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((element) {
        if (intervalo_atual_fim == 0) {
          setState(() {
            intervalo_proximo_fim = intervalo_atual_fim;
            proximo_valor = valor_atual;
            intervalo_atual_fim = element['final_intervalo'];
            valor_atual = element['valor'];
          });
        } else if (intervalo_atual_fim > element['final_intervalo'] &&
            element['final_intervalo'] >= soma) {
          setState(() {
            intervalo_proximo_fim = intervalo_atual_fim;
            proximo_valor = valor_atual;
            intervalo_atual_fim = element['final_intervalo'];
            valor_atual = element['valor'];
          });
        }
      });
      faixassalarias
          .where('final_intervalo', isLessThan: this.soma)
          .get()
          .then((QuerySnapshot q) {
        q.docs.forEach((element) {
          if (intervalo_atual_inicio < element['final_intervalo']) {
            setState(() {
              intervalo_atual_inicio = element['final_intervalo'];
            });
          }
        });
      });
    });
  }

  get_usuario() {
    CollectionReference usuarios =
        FirebaseFirestore.instance.collection('Usuario');
    usuarios
        .where('email', isEqualTo: this.widget.email)
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((element) {
        setState(() {});
      });
    });
  }

  List<Cargo> cargossss = [];
  get_cargos() {
    CollectionReference cargosS =
        FirebaseFirestore.instance.collection('Cargo');
    cargosS
        .where('instituicao', isEqualTo: this.usuario.instituicao)
        .orderBy('grau')
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((elementt) {
        DocumentReference _documentReference = elementt.reference;

        CollectionReference _collectionReference =
            _documentReference.collection('FaixaSalarial');
        List<FaixaSalarial> faixasSalariais = [];
        _collectionReference
            .orderBy('final_intervalo', descending: false)
            .get()
            .then((QuerySnapshot q) {
          q.docs.forEach((element) {
            faixasSalariais.add(new FaixaSalarial(
                element['final_intervalo'], element['valor']));
          });
        });
        Cargo passar = new Cargo(
            elementt['competencias'],
            elementt['descricao'],
            elementt['nome'],
            elementt['tempo_empresa'],
            elementt['tempo_experiencia'],
            elementt['titulo'],
            elementt['valor_pontuacao'],
            elementt['grau'],
            elementt['instituicao']);

        passar.faixas = faixasSalariais;
        setState(() {
          cargossss.add(passar);
        });
      });
    });
  }

  get_pontuacao() {
    setState(() {
      this.soma = 0;
      this.soma = this.soma + cargo.valor_pontuacao;
    });

    int contador = 0;
    CollectionReference pontuacoe =
        FirebaseFirestore.instance.collection('Pontuacao');
    pontuacoe
        .where('instituicao', isEqualTo: this.usuario.instituicao)
        .orderBy('nome', descending: false)
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((elementt) {
        DocumentReference _documentReference = elementt.reference;

        CollectionReference _collectionReference =
            _documentReference.collection('PontuacaoAtributo');

        List<PontuacaoAtributo> pontuacaoAtrib = [];
        _collectionReference
            .orderBy('nome', descending: false)
            .get()
            .then((QuerySnapshot q) {
          q.docs.forEach((element) {
            double valor = 0;
            pontuacaoAtrib.add(new PontuacaoAtributo(element['nome'],
                element['quantidade_maxima'], element['valor']));

            if (elementt['nome'] == "Pontua????o de Forma????o Acad??mica") {
              if (element['nome'] ==
                  "Cursos de Aperfei??oamento (m??nimo 180 Hs)") {
                if (usuario.quantidade_cursos_aperfeicoamento >
                    element['quantidade_maxima']) {
                  valor = element['quantidade_maxima'] * element['valor'];
                } else {
                  valor = usuario.quantidade_cursos_aperfeicoamento *
                      element['valor'];
                }
              } else if (element['nome'] ==
                  "Cursos de Extens??o Cultural (m??nimo 30 Hs)") {
                if (usuario.quantidade_cursos_extensao_cultural >
                    element['quantidade_maxima']) {
                  valor = element['quantidade_maxima'] * element['valor'];
                } else {
                  valor = usuario.quantidade_cursos_extensao_cultural *
                      element['valor'];
                }
              } else if (element['nome'] ==
                  'Cr??ditos de P??s-Gradua????o "Stricto Sensu" por disciplina') {
                if (usuario.quantidade_stricto_sensu >
                    element['quantidade_maxima']) {
                  valor = element['quantidade_maxima'] * element['valor'];
                } else {
                  valor = usuario.quantidade_stricto_sensu * element['valor'];
                }
              } else if (element['nome'] == "Vari??veis") {
                if (usuario.quantidade_variaveis >
                    element['quantidade_maxima']) {
                  valor = element['quantidade_maxima'] * element['valor'];
                } else {
                  valor = usuario.quantidade_variaveis * element['valor'];
                }
              } else if (element['nome'] == "Outros Cursos de Gradua????o") {
                if (usuario.quantidade_outros_cursos_realizados >
                    element['quantidade_maxima']) {
                  valor = element['quantidade_maxima'] * element['valor'];
                } else {
                  valor = usuario.quantidade_outros_cursos_realizados *
                      element['valor'];
                }
              } else {
                if (usuario.quantidade_aprovacao_concurso >
                    element['quantidade_maxima']) {
                  valor = element['quantidade_maxima'] * element['valor'];
                } else {
                  valor =
                      usuario.quantidade_aprovacao_concurso * element['valor'];
                }
              }
            } else if (elementt['nome'] == "Experi??ncia") {
              if (element['nome'] ==
                  "Trabalhos cient??ficos publicados em revista especializada") {
                if (usuario.quantidade_trabalhos_cientificos_revista >
                    element['quantidade_maxima']) {
                  valor = element['quantidade_maxima'] * element['valor'];
                } else {
                  valor = usuario.quantidade_trabalhos_cientificos_revista *
                      element['valor'];
                }
              } else if (element['nome'] ==
                  "Realiza????o de Pesquisa aprovada pela Institui????o (M??nimo 1 ano)") {
                if (usuario.quantidade_pesquisas_aprovadas >
                    element['quantidade_maxima']) {
                  valor = element['quantidade_maxima'] * element['valor'];
                } else {
                  valor =
                      usuario.quantidade_pesquisas_aprovadas * element['valor'];
                }
              } else if (element['nome'] ==
                  "Professor de universidade p??blica (Por ano completo)") {
                if (usuario.quantidade_professor_universidade_publica >
                    element['quantidade_maxima']) {
                  valor = element['quantidade_maxima'] * element['valor'];
                } else {
                  valor = usuario.quantidade_professor_universidade_publica *
                      element['valor'];
                }
              } else {
                if (usuario.quantidade_livros > element['quantidade_maxima']) {
                  valor = element['quantidade_maxima'] * element['valor'];
                } else {
                  valor = usuario.quantidade_livros * element['valor'];
                }
              }
            } else if (elementt['nome'] == "Assiduidade") {
              if (usuario.quantidade_faltas <= element['quantidade_maxima']) {
                valor = element['valor'];
              } else {
                valor = 0;
              }
            } else {
              double yearsBetween(DateTime from, DateTime to) {
                from = DateTime(from.year, from.month, from.day);
                to = DateTime(to.year, to.month, to.day);
                return (to.difference(from).inHours / 24 / 365)
                    .toInt()
                    .toDouble();
              }

              double monthsBetween(DateTime from, DateTime to) {
                from = DateTime(from.year, from.month, from.day);
                to = DateTime(to.year, to.month, to.day);
                return (to.difference(from).inHours / 24 / 365 * 12)
                    .toInt()
                    .toDouble();
              }

              Teste:
              DateTime date1 = usuario.data_admissao;
              DateTime date2 = DateTime.now();
              setState(() {
                quantidade_anos = yearsBetween(date1, date2);
                quantidade_meses = monthsBetween(date1, date2) % 12;
              });

              if (quantidade_anos > element['quantidade_maxima']) {
                valor = element['quantidade_maxima'] * element['valor'];
              } else {
                valor = quantidade_anos * element['valor'];
              }
            }
            setState(() {
              this.soma = this.soma + valor;
            });
            get_cargo_faixas(soma);
          });
        });
        setState(() {
          pontuacoes.add(new Pontuacao(
              elementt['instituicao'], elementt['nome'], pontuacaoAtrib));
        });
      });
    });
  }

  Future<void> retornar_proximo_cargo() async {
    int ultimograu;
    if (this.cargo.grau == 4) {
      ultimograu = this.cargo.grau;
    } else {
      ultimograu = this.cargo.grau + 1;
    }
    CollectionReference usuarios =
        FirebaseFirestore.instance.collection('Usuario');
    usuarios
        .where('email', isEqualTo: this.widget.email)
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((element) {
        setState(() {
          usuario = new Usuario(
            element['data_admissao'].toDate(),
            element['quantidade_aprovacao_concurso'],
            element['quantidade_cursos_aperfeicoamento'],
            element['quantidade_cursos_extensao_cultural'],
            element['quantidade_livros'],
            element['quantidade_outros_cursos_realizados'],
            element['quantidade_pesquisas_aprovadas'],
            element['quantidade_professor_universidade_publica'],
            element['quantidade_stricto_sensu'],
            element['quantidade_trabalhos_cientificos_revista'],
            element['quantidade_variaveis'],
            element['quantidade_faltas'],
            element['salario_ideal'],
            element['instituicao'],
            element['email'],
            element['foto'],
            element['primeiro_nome'],
            element['segundo_nome'],
            element['telefone'],
          );
        });
        retornar_usuarios();
        get_pontuacao();
        get_cargos();
        retornar_situacoes();
      });
    });
    CollectionReference cargos = FirebaseFirestore.instance.collection('Cargo');
    cargos
        .where('instituicao', isEqualTo: this.cargo.instituicao)
        .where('grau', isEqualTo: ultimograu)
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((element) {
        setState(() {
          this.competencias_cargo = element["competencias"];
          this.nome_cargo = element["nome"];
          this.titulo_cargo = element["titulo"];
          this.pontuacao_cargo = element["valor_pontuacao"];
        });
      });
    });
  }

  Future<void> retornar_cargo(String cargop) async {
    CollectionReference cargos = FirebaseFirestore.instance.collection('Cargo');
    DocumentSnapshot carg = await cargos.doc(cargop).get();
    setState(() {
      cargo = new Cargo(
          carg['competencias'],
          carg['descricao'],
          carg['nome'],
          carg['tempo_empresa'],
          carg['tempo_experiencia'],
          carg['titulo'],
          carg['valor_pontuacao'],
          carg['grau'],
          carg['instituicao']);
    });
    retornar_proximo_cargo();
  }

  @override
  Widget build(BuildContext context) {
    if (pontuacoes.isNotEmpty) {
      pont = pontuacoes;
    }
    return LayoutBuilder(
      builder: ((context, constraints) {
        Object? data = ModalRoute.of(context)?.settings.arguments;

        if (constraints.maxWidth >= 850) {
          if (data == null && paginaS == 11) {
            return const DesktopLogin();
          }
          if (paginaU == 0) {
            return const Center(
              child: Text('Carregando...'),
            );
          }
          if (paginaU == 1) {
            if (paginaS == 0 || paginaS == 11) {
              return DesktopMeucargo(
                cargo: cargo,
                competencias_cargo: competencias_cargo,
                titulo_cargo: titulo_cargo,
                nome_cargo: nome_cargo,
                soma: soma,
                intervalo_atual_inicio: intervalo_atual_inicio,
                intervalo_atual_fim: intervalo_atual_fim,
                intervalo_proximo_fim: intervalo_proximo_fim,
                intervalo_proximo_inicio: intervalo_proximo_inicio,
                proximo_valor: proximo_valor,
                valor_atual: valor_atual,
              );
            }
          }
          if (paginaU == 2) {
            if (paginaS == 0 || paginaS == 11) {
              return const DesktopMenu();
            }
          }
          if (paginaS == 2) {
            return DesktopMeucargo(
              cargo: cargo,
              competencias_cargo: competencias_cargo,
              titulo_cargo: titulo_cargo,
              nome_cargo: nome_cargo,
              soma: soma,
              intervalo_atual_inicio: intervalo_atual_inicio,
              intervalo_atual_fim: intervalo_atual_fim,
              intervalo_proximo_fim: intervalo_proximo_fim,
              intervalo_proximo_inicio: intervalo_proximo_inicio,
              proximo_valor: proximo_valor,
              valor_atual: valor_atual,
            );
          }
          switch (paginaS) {
            case 1:
              return DesktopConfiguracoes(usuario: usuario);
              break;
            case 3:
              return DesktopResultados(
                usuarios: usuarios,
                total_atual: this.total_atual,
                total_ideal: this.total_ideal,
                cargos: cargosss,
                situacoes: this.situacoesAdm,
              );
              break;
            case 4:
              return DesktopCargos(
                cargos: cargossss,
                instituicao: usuario.instituicao,
              );
              break;
            case 5:
              return DesktopProfessores(
                usuarios: usuarios,
                cargos: cargossss,
                cargos_usuarios: cargosss,
                situacoes: situacoesAllAdm,
                situacoes_usuarios: this.situacoesAdm,
                cargos_antigo: cargos_antigo,
                instituicao: usuario.instituicao,
              );
              break;
            case 6:
              return DesktopPontuacoes(
                cargos: cargossss,
                pontuacoes: pont,
                instituicao: usuario.instituicao,
                display_list_cargos: cargosss,
              );
              break;
            case 7:
              return DesktopSimulador(
                cargos: cargossss,
                pontuacoes: pont,
                instituicao: usuario.instituicao,
              );
              break;
            case 8:
              return DesktopSuaspontuacoes(
                  cargo: cargo,
                  pontuacoes: pont,
                  quantidade_anos: quantidade_anos,
                  quantidade_meses: quantidade_meses,
                  titulo_cargo: titulo_cargo,
                  usuario: usuario,
                  valor_cargo: pontuacao_cargo,
                  soma: soma);
              break;
            case 9:
              return DesktopTabela(
                display_list_cargos: cargosss,
                cargos: cargossss,
                instituicao: usuario.instituicao,
              );
              break;
            case 10:
              return DesktopStatus(
                instituicao: usuario.instituicao,
                situacoesAdmissional: situacoesAllAdm,
              );
              break;
          }
        } else if (constraints.maxWidth >= 600) {
          if (data == null && paginaS == 11) {
            return const TabletLogin();
          }
          if (paginaU == 0) {
            return const Center(
              child: Text('Carregando...'),
            );
          }
          if (paginaU == 1) {
            if (paginaS == 0 || paginaS == 11) {
              return TabletMeucargo(
                cargo: cargo,
                competencias_cargo: competencias_cargo,
                titulo_cargo: titulo_cargo,
                nome_cargo: nome_cargo,
                soma: soma,
                intervalo_atual_inicio: intervalo_atual_inicio,
                intervalo_atual_fim: intervalo_atual_fim,
                intervalo_proximo_fim: intervalo_proximo_fim,
                intervalo_proximo_inicio: intervalo_proximo_inicio,
                proximo_valor: proximo_valor,
                valor_atual: valor_atual,
              );
            }
          }
          if (paginaU == 2) {
            if (paginaS == 0 || paginaS == 11) {
              return const TabletMenu();
            }
          }
          if (paginaS == 2) {
            return TabletMeucargo(
              cargo: cargo,
              competencias_cargo: competencias_cargo,
              titulo_cargo: titulo_cargo,
              nome_cargo: nome_cargo,
              soma: soma,
              intervalo_atual_inicio: intervalo_atual_inicio,
              intervalo_atual_fim: intervalo_atual_fim,
              intervalo_proximo_fim: intervalo_proximo_fim,
              intervalo_proximo_inicio: intervalo_proximo_inicio,
              proximo_valor: proximo_valor,
              valor_atual: valor_atual,
            );
          }
          switch (paginaS) {
            case 1:
              return TabletConfiguracoes(usuario: usuario);
              break;
            case 3:
              return TabletResultados(
                usuarios: usuarios,
                total_atual: this.total_atual,
                total_ideal: this.total_ideal,
                cargos: cargosss,
                situacoes: this.situacoesAdm,
              );
              break;
            case 4:
              return TabletCargos(
                cargos: cargossss,
                instituicao: usuario.instituicao,
              );
              break;
            case 5:
              return TabletProfessores(
                usuarios: usuarios,
                cargos: cargossss,
                cargos_usuarios: cargosss,
                situacoes: situacoesAllAdm,
                situacoes_usuarios: this.situacoesAdm,
                cargos_antigo: cargos_antigo,
                instituicao: usuario.instituicao,
              );
              break;
            case 6:
              return TabletPontuacoes(
                display_list_cargos: cargosss,
                cargos: cargossss,
                pontuacoes: pont,
                instituicao: usuario.instituicao,
              );
              break;
            case 7:
              return TabletSimulador(
                cargos: cargossss,
                pontuacoes: pont,
                instituicao: usuario.instituicao,
              );
              break;
            case 8:
              return TabletSuaspontuacoes(
                  cargo: cargo,
                  pontuacoes: pont,
                  quantidade_anos: quantidade_anos,
                  quantidade_meses: quantidade_meses,
                  titulo_cargo: titulo_cargo,
                  usuario: usuario,
                  valor_cargo: pontuacao_cargo,
                  soma: soma);
              break;
            case 9:
              return TabletTabela(
                display_list_cargos: cargosss,
                cargos: cargossss,
                instituicao: usuario.instituicao,
              );
              break;
            case 10:
              return TabletStatus(
                instituicao: usuario.instituicao,
                situacoesAdmissional: situacoesAllAdm,
              );
              break;
          }
        }
        if (data == null && paginaS == 11) {
          return const MobileLogin();
        }
        if (paginaU == 0) {
          return const Center(
            child: Text('Carregando...'),
          );
        }
        if (paginaU == 1) {
          if (paginaS == 0 || paginaS == 11) {
            return MobileMeucargo(
              cargo: cargo,
              competencias_cargo: competencias_cargo,
              titulo_cargo: titulo_cargo,
              nome_cargo: nome_cargo,
              soma: soma,
              intervalo_atual_inicio: intervalo_atual_inicio,
              intervalo_atual_fim: intervalo_atual_fim,
              intervalo_proximo_fim: intervalo_proximo_fim,
              intervalo_proximo_inicio: intervalo_proximo_inicio,
              proximo_valor: proximo_valor,
              valor_atual: valor_atual,
            );
          }
        }
        if (paginaU == 2) {
          if (paginaS == 0 || paginaS == 11) {
            return const MobileMenu();
          }
        }
        if (paginaS == 2) {
          return MobileMeucargo(
            cargo: cargo,
            competencias_cargo: competencias_cargo,
            titulo_cargo: titulo_cargo,
            nome_cargo: nome_cargo,
            soma: soma,
            intervalo_atual_inicio: intervalo_atual_inicio,
            intervalo_atual_fim: intervalo_atual_fim,
            intervalo_proximo_fim: intervalo_proximo_fim,
            intervalo_proximo_inicio: intervalo_proximo_inicio,
            proximo_valor: proximo_valor,
            valor_atual: valor_atual,
          );
        }
        switch (paginaS) {
          case 1:
            return MobileConfiguracoes(usuario: usuario);
            break;
          case 3:
            return MobileResultados(
              usuarios: usuarios,
              total_atual: this.total_atual,
              total_ideal: this.total_ideal,
              cargos: cargosss,
              situacoes: this.situacoesAdm,
            );
            break;
          case 4:
            return MobileCargos(
              cargos: cargossss,
              instituicao: usuario.instituicao,
            );
            break;
          case 5:
            return MobileProfessores(
              usuarios: usuarios,
              cargos: cargossss,
              cargos_usuarios: cargosss,
              situacoes: situacoesAllAdm,
              situacoes_usuarios: this.situacoesAdm,
              cargos_antigo: cargos_antigo,
              instituicao: usuario.instituicao,
            );
            break;
          case 6:
            return MobilePontuacoes(
              display_list_cargos: cargosss,
              cargos: cargossss,
              pontuacoes: pont,
              instituicao: usuario.instituicao,
            );
            break;
          case 7:
            return MobileSimulador(
              cargos: cargossss,
              pontuacoes: pont,
              instituicao: usuario.instituicao,
            );
            break;
          case 8:
            return MobileSuaspontuacoes(
                cargo: cargo,
                pontuacoes: pont,
                quantidade_anos: quantidade_anos,
                quantidade_meses: quantidade_meses,
                titulo_cargo: titulo_cargo,
                usuario: usuario,
                valor_cargo: pontuacao_cargo,
                soma: soma);
            break;
          case 9:
            return MobileTabela(
              display_list_cargos: cargosss,
              cargos: cargossss,
              instituicao: usuario.instituicao,
            );
            break;
        }
        return MobileStatus(
          instituicao: usuario.instituicao,
          situacoesAdmissional: situacoesAllAdm,
        );
      }),
    );
  }
}
