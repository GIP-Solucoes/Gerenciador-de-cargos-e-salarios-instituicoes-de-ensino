import 'dart:html';
import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Cargo.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Pontuacao.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/PontuacaoAtributo.dart';
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

class SistemaContent extends StatefulWidget {
  String email;
  SistemaContent({Key? key, required this.email}) : super(key: key);

  @override
  State<SistemaContent> createState() {
    return _StateSistemaContent(email: this.email);
  }
}

class _StateSistemaContent extends State<SistemaContent> {
  String email;
  List<Pontuacao> pont = [new Pontuacao('0', 'Carregando...', [new PontuacaoAtributo('nome', 0, 0)])];
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
  Usuario usuario =
      new Usuario(DateTime.now(), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '','','','','','');

  Cargo cargo = new Cargo(
      'Carregando competências...',
      'Carregando descrição...',
      'Carregando nome...',
      0,
      0,
      'Carregando título...',
      0,
      -1,
      't');
  double soma = 0;

  String nome_cargo = "Caregando nome...";
  String competencias_cargo = "Carregando requisitos...";
  String titulo_cargo = "Carregando título...";
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
    CollectionReference instituicoes =
        FirebaseFirestore.instance.collection('Cargo');
    DocumentSnapshot carg = await instituicoes.doc(cargo).get();
    CollectionReference faixassalarias =
        carg.reference.collection('FaixaSalarial');
    faixassalarias
        .where('final_intervalo', isGreaterThanOrEqualTo: soma)
        .orderBy('final_intervalo', descending: true)
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((element) {
        if (intervalo_atual_fim == 0 ||
            intervalo_atual_fim > element['final_intervalo']) {
          setState(() {
            intervalo_proximo_fim = intervalo_atual_fim;
            proximo_valor = valor_atual;
            intervalo_atual_fim = element['final_intervalo'];
            valor_atual = element['valor'];
          });
        }
      });
    });
    faixassalarias
        .where('final_intervalo', isLessThan: soma)
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
  }

  get_usuario() {
    CollectionReference usuarios =
        FirebaseFirestore.instance.collection('Usuario');
    usuarios
        .where('email', isEqualTo: this.widget.email)
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((element) {
        setState(() {
          /* usuario = new Usuario(
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
              element['instituicao']);*/
          //this.soma = 6.toString();
        });

        /*get_pontuacao();
        setState(() {
          this.soma = 6;
        });*/
      });
    }).catchError((e) => print(e.toString()));
  }

  get_pontuacao() {
    setState(() {
      this.soma = this.soma + cargo.valor_pontuacao;
    });

    int contador = 0;
    CollectionReference pontuacoe =
        FirebaseFirestore.instance.collection('Pontuacao');
    pontuacoe
        .where('instituicao', isEqualTo: this.usuario.instituicao).orderBy('nome',descending: false)
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((elementt) {
        DocumentReference _documentReference = elementt.reference;

        CollectionReference _collectionReference =
            _documentReference.collection('PontuacaoAtributo');

        /////////////////////////

        /*Future<void> getData() async {
          QuerySnapshot querySnapshot = await _collectionReference.get();
          final allData = querySnapshot.docs.map((e) => e.data()).toList();
          allData.forEach(((element) {
            
            //pontuacoesAtrib.add(new PontuacaoAtributo(element, quantidade_maxima, valor))
          }));

          setState(() {
            pontuacoes.add(new Pontuacao(
                element['instituicao'], element['nome'], pontuacoesAtrib));
          });
        }

        getData();*/
        /*__pontuacAtrib.forEach((element) {
          print(element.nome);
        });*/
        List<PontuacaoAtributo> pontuacaoAtrib = [];
        _collectionReference.orderBy('nome',descending: false).get().then((QuerySnapshot q) {
          q.docs.forEach((element) {
            double valor = 0;
            pontuacaoAtrib.add(new PontuacaoAtributo(element['nome'],
                element['quantidade_maxima'], element['valor']));
            //setState(() {
            // pontuacoes.forEach((element) {
            if (elementt['nome'] == "Pontuação de Formação Acadêmica") {
              // element.pontuacaoAtributo.forEach((element) {
              if (element['nome'] ==
                  "Cursos de Aperfeiçoamento (mínimo 180 Hs)") {
                if (usuario.quantidade_cursos_aperfeicoamento >
                    element['quantidade_maxima']) {
                  valor = element['quantidade_maxima'] * element['valor'];
                } else {
                  valor = usuario.quantidade_cursos_aperfeicoamento *
                      element['valor'];
                }
              } else if (element['nome'] ==
                  "Cursos de Extensão Cultural (mínimo 30 Hs)") {
                if (usuario.quantidade_cursos_extensao_cultural >
                    element['quantidade_maxima']) {
                  valor = element['quantidade_maxima'] * element['valor'];
                } else {
                  valor = usuario.quantidade_cursos_extensao_cultural *
                      element['valor'];
                }
              } else if (element['nome'] ==
                  'Créditos de Pós-Graduação "Stricto Sensu" por disciplina') {
                if (usuario.quantidade_stricto_sensu >
                    element['quantidade_maxima']) {
                  valor = element['quantidade_maxima'] * element['valor'];
                } else {
                  valor = usuario.quantidade_stricto_sensu * element['valor'];
                }
              } else if (element['nome'] == "Variáveis") {
                if (usuario.quantidade_variaveis >
                    element['quantidade_maxima']) {
                  valor = element['quantidade_maxima'] * element['valor'];
                } else {
                  valor = usuario.quantidade_variaveis * element['valor'];
                }
              } else if (element['nome'] == "Outros Cursos de Graduação") {
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
            } else if (elementt['nome'] == "Experiência") {
              if (element['nome'] ==
                  "Trabalhos científicos publicados em revista especializada") {
                if (usuario.quantidade_trabalhos_cientificos_revista >
                    element['quantidade_maxima']) {
                  valor = element['quantidade_maxima'] * element['valor'];
                } else {
                  valor = usuario.quantidade_trabalhos_cientificos_revista *
                      element['valor'];
                }
              } else if (element['nome'] ==
                  "Realização de Pesquisa aprovada pela Instituição (Mínimo 1 ano)") {
                if (usuario.quantidade_pesquisas_aprovadas >
                    element['quantidade_maxima']) {
                  valor = element['quantidade_maxima'] * element['valor'];
                } else {
                  valor =
                      usuario.quantidade_pesquisas_aprovadas * element['valor'];
                }
              } else if (element['nome'] ==
                  "Professor de universidade pública (Por ano completo)") {
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
            //});
            // });
            setState(() {
              this.soma = this.soma + valor;
            });
          });
        }).catchError((e) => print(e.toString()));
        setState(() {
          pontuacoes.add(new Pontuacao(
              elementt['instituicao'], elementt['nome'], pontuacaoAtrib));
        });
      });
    }).catchError((e) => print(e.toString()));
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
        get_pontuacao();
      });
    }).catchError((e) => print(e.toString()));
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
    }).catchError((e) => print(e.toString()));
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
    get_cargo_faixas(soma);
    
    if(pontuacoes.isNotEmpty){
      pont = pontuacoes;
    }

    return LayoutBuilder(
      builder: ((context, constraints) {
        Object? data = ModalRoute.of(context)?.settings.arguments;
        if (data == null && paginaS == 11) {
          return const DesktopLogin();
        }
        if (constraints.maxWidth >= 850) {
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
            if (paginaS == 0 || paginaS == 11) return const DesktopMenu();
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
          }
          switch (paginaS) {
            case 1:
              return DesktopConfiguracoes(usuario:usuario);
              break;
            case 3:
              return const DesktopResultados();
              break;
            case 4:
              return const DesktopCargos();
              break;
            case 5:
              return const DesktopProfessores();
              break;
            case 6:
              return const DesktopPontuacoes();
              break;
            case 7:
              return const DesktopSimulador();
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
              return const DesktopTabela();
              break;
            case 10:
              return const DesktopStatus();
              break;
          }
        } else if (constraints.maxWidth >= 600) {
          switch (paginaS) {
            case 0:
              return const TabletMenu();
              break;
            case 1:
              return const TabletConfiguracoes();
              break;
            case 2:
              return const TabletMeucargo();
              break;
            case 3:
              return const TabletResultados();
              break;
            case 4:
              return const TabletCargos();
              break;
            case 5:
              return const TabletProfessores();
              break;
            case 6:
              return const TabletPontuacoes();
              break;
            case 7:
              return const TabletSimulador();
              break;
            case 8:
              return const TabletSuaspontuacoes();
              break;
            case 9:
              return const TabletTabela();
              break;
            case 10:
              return const TabletStatus();
              break;
            case 11:
              return const TabletMenu();
              break;
          }
        }
        switch (paginaS) {
          case 0:
            return const MobileMenu();
            break;
          case 1:
            return const MobileConfiguracoes();
            break;
          case 2:
            return const MobileMeucargo();
            break;
          case 3:
            return const MobileResultados();
            break;
          case 4:
            return const MobileCargos();
            break;
          case 5:
            return const MobileProfessores();
            break;
          case 6:
            return const MobilePontuacoes();
            break;
          case 7:
            return const MobileSimulador();
            break;
          case 8:
            return const MobileSuaspontuacoes();
            break;
          case 9:
            return const MobileTabela();
            break;
          case 11:
            return const MobileMenu();
            break;
        }
        return const MobileStatus();
      }),
    );
  }
}
