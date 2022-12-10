import 'dart:convert';
import 'dart:io';
import 'dart:html' as html;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Cargo.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/SituacaoAdmissional.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Usuario.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/configuracoes_content.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/login_content.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/sistema_content.dart';
//import 'package:my_portfolio/models/name_color.dart';
import 'package:intl/intl.dart';

final keyProfessores = GlobalKey<_ProfessoresState>();

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

class BotaoNovofuncionario extends StatefulWidget {
  BotaoNovofuncionario({
    Key? key,
  }) : super(key: key);

  @override
  State<BotaoNovofuncionario> createState() => _BotaoNovofuncionarioState();
}

class _BotaoNovofuncionarioState extends State<BotaoNovofuncionario> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (keyProfessores.currentState!.widget.deletados.isNotEmpty) {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text(
                      "Uma remoção por vez!",
                    ),
                    content: Text(
                        "Você já removeu uma faixa. Por favor, salve as alterações para adicionar uma faixa."),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Ok')),
                    ],
                  ));
        } else {
          TextEditingController matricula = TextEditingController();
          TextEditingController nome = TextEditingController();

          TextEditingController aprovacao = TextEditingController();
          TextEditingController creditos = TextEditingController();
          TextEditingController aperfeicoamento = TextEditingController();
          TextEditingController outros = TextEditingController();
          TextEditingController extensao = TextEditingController();
          TextEditingController variaveis = TextEditingController();
          TextEditingController livros = TextEditingController();
          TextEditingController pesquisas = TextEditingController();
          TextEditingController professor = TextEditingController();
          TextEditingController trabalhos = TextEditingController();
          TextEditingController assiduidade = TextEditingController();

          TextEditingController data = TextEditingController();
          TextEditingController observacoes = TextEditingController();

          TextEditingController salario = TextEditingController();

          TextEditingController email = TextEditingController();
          TextEditingController senha = TextEditingController();

          final dropValueCadastroStatus = ValueNotifier('');
          final dropValueCadastroCargo = ValueNotifier('');
          List<String> dropOpcoesCargos = [];
          List<String> dropOpcoesStatus = [];

          keyProfessores.currentState!.widget.cargos.forEach((element) {
            dropOpcoesCargos.add(element.nome);
          });
          keyProfessores.currentState!.widget.situacoes.forEach((element) {
            dropOpcoesStatus.add(element.nome);
          });
          String valorStatus = dropOpcoesStatus[0];
          String valorCargo = dropOpcoesCargos[0];
          bool tipo = true;
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text(
                      "Novo funcionário",
                    ),
                    content: Container(
                      height: 450,
                      width: 500,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(children: [
                              Text("Status: "),
                              ValueListenableBuilder(
                                  valueListenable: dropValueCadastroStatus,
                                  builder:
                                      (BuildContext context, String value, _) {
                                    return DropdownButton<String>(
                                      hint: Text(
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                          ),
                                          dropOpcoesStatus[0]),
                                      value: (value.isEmpty) ? null : value,
                                      onChanged: (escolha) {
                                        valorStatus = escolha.toString();
                                        dropValueCadastroStatus.value =
                                            escolha.toString();
                                      },
                                      items: dropOpcoesStatus
                                          .map((op) => DropdownMenuItem(
                                                value: op,
                                                child: Text(op),
                                              ))
                                          .toList(),
                                    );
                                  }),
                            ]),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text("Matrícula: "),
                                Flexible(
                                  child: TextField(
                                    controller: matricula,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Nome: "),
                                Flexible(
                                  child: TextField(
                                    controller: nome,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              Text("Cargo: "),
                              ValueListenableBuilder(
                                  valueListenable: dropValueCadastroCargo,
                                  builder:
                                      (BuildContext context, String value, _) {
                                    return DropdownButton<String>(
                                      hint: Text(
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                          ),
                                          dropOpcoesCargos[0]),
                                      value: (value.isEmpty) ? null : value,
                                      onChanged: (escolha) {
                                        valorCargo = escolha.toString();
                                        dropValueCadastroCargo.value =
                                            escolha.toString();
                                      },
                                      items: dropOpcoesCargos
                                          .map((op) => DropdownMenuItem(
                                                value: op,
                                                child: Text(op),
                                              ))
                                          .toList(),
                                    );
                                  }),
                            ]),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text("Aprovação em cocurso público: "),
                                Flexible(
                                  child: TextField(
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
                                    controller: aprovacao,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Créditos de pós graduação: "),
                                Flexible(
                                  child: TextField(
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
                                    controller: creditos,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Cursos de aperfeiçoamento: "),
                                Flexible(
                                  child: TextField(
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
                                    controller: aperfeicoamento,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Outros cursos de graduação: "),
                                Flexible(
                                  child: TextField(
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
                                    controller: outros,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Cursos de extensão cultural: "),
                                Flexible(
                                  child: TextField(
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
                                    controller: extensao,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Variáveis: "),
                                Flexible(
                                  child: TextField(
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
                                    controller: variaveis,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Livros publicados: "),
                                Flexible(
                                  child: TextField(
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
                                    controller: livros,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Pesquisas realizadas: "),
                                Flexible(
                                  child: TextField(
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
                                    controller: pesquisas,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Professor de universidade pública: "),
                                Flexible(
                                  child: TextField(
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
                                    controller: professor,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Trabalhos científicos publicados: "),
                                Flexible(
                                  child: TextField(
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
                                    controller: trabalhos,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Assiduidade: "),
                                Flexible(
                                  child: TextField(
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
                                    controller: assiduidade,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Data de admissão: "),
                                Flexible(
                                  child: TextField(
                                    onTap: () async {
                                      DateTime? pickerddate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime.now());
                                      if (pickerddate != null) {
                                        setState(() {
                                          data.text = DateFormat("dd/MM/yyyy")
                                              .format(pickerddate);
                                        });
                                      }
                                    },
                                    controller: data,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Observações: "),
                                Flexible(
                                  child: TextField(
                                    controller: observacoes,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Email: "),
                                Flexible(
                                  child: TextField(
                                    controller: email,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Senha: "),
                                Flexible(
                                  child: TextField(
                                    obscureText: true,
                                    controller: senha,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Salário atual: "),
                                Flexible(
                                  child: TextField(
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]+[,.]{0,1}[0-9]*')),
                                      TextInputFormatter.withFunction(
                                        (oldValue, newValue) =>
                                            newValue.copyWith(
                                          text: newValue.text
                                              .replaceAll('.', ','),
                                        ),
                                      ),
                                    ],
                                    controller: salario,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancelar')),
                      TextButton(
                          onPressed: () {
                            int contt = 0;
                            ///////////////////////
                            ///
                            ///

                            /// file might be picked

                            if (matricula.text.isNotEmpty &&
                                observacoes.text.isNotEmpty &&
                                salario.text.isNotEmpty &&
                                email.text.isNotEmpty &&
                                senha.text.isNotEmpty &&
                                matricula.text.isNotEmpty &&
                                nome.text.isNotEmpty &&
                                aprovacao.text.isNotEmpty &&
                                creditos.text.isNotEmpty &&
                                aperfeicoamento.text.isNotEmpty &&
                                outros.text.isNotEmpty &&
                                extensao.text.isNotEmpty &&
                                variaveis.text.isNotEmpty &&
                                livros.text.isNotEmpty &&
                                pesquisas.text.isNotEmpty &&
                                professor.text.isNotEmpty &&
                                trabalhos.text.isNotEmpty &&
                                assiduidade.text.isNotEmpty &&
                                data.text.isNotEmpty) {
                              //keyTabela.currentState!.widget.textEditingCargos
                              //print("$row");
                              List<String> nomes = nome.text.split(' ');
                              String primeiro_nome = "";
                              String segundo_nome = "";
                              if (nomes.length == 1) {
                                primeiro_nome = nomes[0];
                              } else {
                                primeiro_nome = nomes[0];
                                for (int i = 1; i < (nomes.length - 1); i++) {
                                  primeiro_nome =
                                      primeiro_nome + " " + nomes[i];
                                }
                                segundo_nome = nomes[(nomes.length - 1)];
                              }
                              keyProfessores.currentState!.widget.cargos
                                  .forEach((element) {
                                if (valorCargo == element.nome) {
                                  Cargo cargoU = Cargo(
                                      element.competencias,
                                      element.descricao,
                                      element.nome,
                                      element.tempo_empresa,
                                      element.tempo_experiencia,
                                      element.titulo,
                                      element.valor_pontuacao,
                                      element.grau,
                                      element.instituicao);
                                  cargoU.primeiro_nome = primeiro_nome;
                                  cargoU.segundo_nome = segundo_nome;
                                  cargoU.matricula = matricula.text;
                                  keyProfessores.currentState!
                                      .adicionar_cargo(cargoU);
                                }
                              });
                              keyProfessores.currentState!.widget.situacoes
                                  .forEach((element) {
                                if (valorStatus == element.nome) {
                                  SituacaoAdmissional situacaoAdmissional =
                                      SituacaoAdmissional(
                                          element.calcula_valor, element.nome);
                                  situacaoAdmissional.primeiro_nome =
                                      primeiro_nome;
                                  situacaoAdmissional.segundo_nome =
                                      segundo_nome;
                                  situacaoAdmissional.matricula =
                                      matricula.text;
                                  keyProfessores.currentState!
                                      .adicionar_situacao(situacaoAdmissional);
                                }
                              });
                              var dia = data.text.split("/")[0];
                              var mes = data.text.split("/")[1];
                              var ano = data.text.split("/")[2];
                              Usuario usuarioo = Usuario(
                                  DateTime.parse(ano + '-' + mes + '-' + dia),
                                  double.parse(aprovacao.text),
                                  double.parse(aperfeicoamento.text),
                                  double.parse(extensao.text),
                                  double.parse(livros.text),
                                  double.parse(outros.text),
                                  double.parse(pesquisas.text),
                                  double.parse(professor.text),
                                  double.parse(creditos.text),
                                  double.parse(trabalhos.text),
                                  double.parse(variaveis.text),
                                  double.parse(assiduidade.text),
                                  50,
                                  keyProfessores
                                      .currentState!.widget.instituicao,
                                  email.text,
                                  "",
                                  primeiro_nome,
                                  segundo_nome,
                                  "");
                              usuarioo.pass = senha.text;
                              usuarioo.matricula = matricula.text;
                              usuarioo.obs = observacoes.text;
                              usuarioo.salario_atual = double.parse(
                                  salario.text.replaceAll(',', '.'));
                              keyProfessores.currentState!
                                  .adicionar_usuario(usuarioo);

                              Cargo cargobase2 = new Cargo('', '',
                                  'Sem registros!', -1, -1, '', -1, -1, '');
                              cargobase2.matricula = matricula.text;
                              cargobase2.primeiro_nome = primeiro_nome;
                              cargobase2.segundo_nome = segundo_nome;
                              keyProfessores.currentState!
                                  .adicionar_cargo_antigo(cargobase2);
                              ///////////////////////////////
                              keyProfessores.currentState!.adicionar_sizes();
                              keyProfessores.currentState!.adicionar_gk();
                              keyProfessores.currentState!.adicionar_nomes(
                                  primeiro_nome + " " + segundo_nome);
                              keyProfessores.currentState!
                                  .adicionar_matriculas(matricula.text);
                              keyProfessores.currentState!
                                  .adicionar_aprovacao_concurso_publico(
                                      aprovacao.text);
                              keyProfessores.currentState!
                                  .adicionar_creditos_pos_graduacao(
                                      creditos.text);
                              keyProfessores.currentState!
                                  .adicionar_cursos_aperfeicoamento(
                                      aperfeicoamento.text);
                              keyProfessores.currentState!
                                  .adicionar_outros_cursos(outros.text);
                              keyProfessores.currentState!
                                  .adicionar_cursos_extensao_cultural(
                                      extensao.text);
                              keyProfessores.currentState!
                                  .adicionar_variaveis(variaveis.text);
                              keyProfessores.currentState!
                                  .adicionar_livros(livros.text);
                              keyProfessores.currentState!
                                  .adicionar_pesquisas(pesquisas.text);
                              keyProfessores.currentState!
                                  .adicionar_professor(professor.text);
                              keyProfessores.currentState!
                                  .adicionar_trabalhos(trabalhos.text);
                              keyProfessores.currentState!
                                  .adicionar_assiduidade(assiduidade.text);
                              keyProfessores.currentState!
                                  .adicionar_salarios(salario.text);
                              keyProfessores.currentState!
                                  .adicionar_data(data.text);
                              keyProfessores.currentState!
                                  .adicionar_observacoes(observacoes.text);
                              keyProfessores.currentState!.pegar_id_cargo(
                                  (keyProfessores
                                          .currentState!.display_list.length -
                                      1),
                                  false);
                              keyProfessores.currentState!.pegar_id_status(
                                  (keyProfessores
                                          .currentState!.display_list.length -
                                      1));
                              keyProfessores.currentState!.retornar_pontuacoes(
                                  keyProfessores
                                          .currentState!.display_list.length -
                                      1);
                              keyProfessores.currentState!
                                  .adicionar_professores(keyProfessores
                                          .currentState!
                                          .widget
                                          .usuarios
                                          .length -
                                      1);
                              Navigator.of(context).pop();
                              ////////////////////////////////
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                        title: Text(
                                          "Campos vazios!",
                                        ),
                                        content: Text(
                                            "Há campos vazios que precisam ser preenchidos para realizar o cadastro."),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Ok')),
                                        ],
                                      ));
                            }

                            ///
                            ///

                            /////////////////////
                          },
                          child: Text('Ok')),
                    ],
                  ));
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 205.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_add_alt_1, color: Colors.white, size: 15.0),
            Text(
              " NOVO FUNCIONÁRIO",
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

class BotaoPlanilha extends StatefulWidget {
  String instituicao;
  BotaoPlanilha({Key? key, required this.instituicao}) : super(key: key);

  @override
  State<BotaoPlanilha> createState() => _BotaoPlanilhaState();
}

class _BotaoPlanilhaState extends State<BotaoPlanilha> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        if (keyProfessores.currentState!.widget.deletados.isNotEmpty) {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text(
                      "Uma remoção por vez!",
                    ),
                    content: Text(
                        "Você já removeu um professor. Por favor, salve as alterações para adicionar um novo professor."),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Ok')),
                    ],
                  ));
        } else {
          /// Use FilePicker to pick files in Flutter Web

          FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: ['xlsx'],
            allowMultiple: false,
          );

          /// file might be picked

          if (pickedFile != null) {
            var bytes = pickedFile.files.single.bytes;
            var excel = Excel.decodeBytes(bytes!);
            for (var table in excel.tables.keys) {
              //print(table); //sheet Name
              //print(excel.tables[table]!.maxCols);
              //print(excel.tables[table]!.maxRows);
              for (var row in excel.tables[table]!.rows) {
                //keyTabela.currentState!.widget.textEditingCargos
                //print("$row");
                List<String> nomes = row[2]!.value.toString().split(' ');
                String primeiro_nome = "";
                String segundo_nome = "";
                if (nomes.length == 1) {
                  primeiro_nome = nomes[0];
                } else {
                  primeiro_nome = nomes[0];
                  for (int i = 1; i < (nomes.length - 1); i++) {
                    primeiro_nome = primeiro_nome + " " + nomes[i];
                  }
                  segundo_nome = nomes[(nomes.length - 1)];
                }
                keyProfessores.currentState!.widget.cargos.forEach((element) {
                  if (row[3]!.value.toString() == element.nome) {
                    Cargo cargoU = Cargo(
                        element.competencias,
                        element.descricao,
                        element.nome,
                        element.tempo_empresa,
                        element.tempo_experiencia,
                        element.titulo,
                        element.valor_pontuacao,
                        element.grau,
                        element.instituicao);
                    cargoU.primeiro_nome = primeiro_nome;
                    cargoU.segundo_nome = segundo_nome;
                    cargoU.matricula = row[1]!.value.toString();
                    keyProfessores.currentState!.adicionar_cargo(cargoU);
                  }
                });
                keyProfessores.currentState!.widget.situacoes
                    .forEach((element) {
                  if (row[0]!.value.toString() == element.nome) {
                    SituacaoAdmissional situacaoAdmissional =
                        SituacaoAdmissional(
                            element.calcula_valor, element.nome);
                    situacaoAdmissional.primeiro_nome = primeiro_nome;
                    situacaoAdmissional.segundo_nome = segundo_nome;
                    situacaoAdmissional.matricula = row[1]!.value.toString();
                    keyProfessores.currentState!
                        .adicionar_situacao(situacaoAdmissional);
                  }
                });
                Usuario usuarioo = Usuario(
                    DateTime.parse(row[15]!.value.toString()),
                    double.parse(row[4]!.value.toString()),
                    double.parse(row[6]!.value.toString()),
                    double.parse(row[8]!.value.toString()),
                    double.parse(row[10]!.value.toString()),
                    double.parse(row[7]!.value.toString()),
                    double.parse(row[11]!.value.toString()),
                    double.parse(row[12]!.value.toString()),
                    double.parse(row[5]!.value.toString()),
                    double.parse(row[13]!.value.toString()),
                    double.parse(row[9]!.value.toString()),
                    double.parse(row[14]!.value.toString()),
                    50,
                    widget.instituicao,
                    row[18]!.value.toString(),
                    "",
                    primeiro_nome,
                    segundo_nome,
                    "");
                usuarioo.pass = row[19]!.value.toString();
                usuarioo.matricula = row[1]!.value.toString();
                usuarioo.obs = row[16]!.value.toString();
                usuarioo.salario_atual =
                    double.parse(row[17]!.value.toString());

                keyProfessores.currentState!.adicionar_usuario(usuarioo);

                Cargo cargobase2 =
                    new Cargo('', '', 'Sem registros!', -1, -1, '', -1, -1, '');
                cargobase2.matricula = row[1]!.value.toString();
                cargobase2.primeiro_nome = primeiro_nome;
                cargobase2.segundo_nome = segundo_nome;
                keyProfessores.currentState!.adicionar_cargo_antigo(cargobase2);
                ///////////////////////////////
                keyProfessores.currentState!.adicionar_sizes();
                keyProfessores.currentState!.adicionar_gk();
                keyProfessores.currentState!
                    .adicionar_nomes(primeiro_nome + " " + segundo_nome);
                keyProfessores.currentState!
                    .adicionar_matriculas(row[1]!.value.toString());
                keyProfessores.currentState!
                    .adicionar_aprovacao_concurso_publico(
                        row[4]!.value.toString());
                keyProfessores.currentState!
                    .adicionar_creditos_pos_graduacao(row[5]!.value.toString());
                keyProfessores.currentState!
                    .adicionar_cursos_aperfeicoamento(row[6]!.value.toString());
                keyProfessores.currentState!
                    .adicionar_outros_cursos(row[7]!.value.toString());
                keyProfessores.currentState!.adicionar_cursos_extensao_cultural(
                    row[8]!.value.toString());
                keyProfessores.currentState!
                    .adicionar_variaveis(row[9]!.value.toString());
                keyProfessores.currentState!
                    .adicionar_livros(row[10]!.value.toString());
                keyProfessores.currentState!
                    .adicionar_pesquisas(row[11]!.value.toString());
                keyProfessores.currentState!
                    .adicionar_professor(row[12]!.value.toString());
                keyProfessores.currentState!
                    .adicionar_trabalhos(row[13]!.value.toString());
                keyProfessores.currentState!
                    .adicionar_assiduidade(row[14]!.value.toString());
                keyProfessores.currentState!.adicionar_salarios(
                    row[17]!.value.toString().replaceAll('.', ','));
                keyProfessores.currentState!.adicionar_data(
                    DateFormat("dd/MM/yyyy").format(usuarioo.data_admissao));
                keyProfessores.currentState!
                    .adicionar_observacoes(row[16]!.value.toString());
                keyProfessores.currentState!.pegar_id_cargo(
                    (keyProfessores.currentState!.display_list.length - 1),
                    false);
                keyProfessores.currentState!.pegar_id_status(
                    (keyProfessores.currentState!.display_list.length - 1));
                keyProfessores.currentState!.retornar_pontuacoes(
                    keyProfessores.currentState!.display_list.length - 1);
                keyProfessores.currentState!.adicionar_professores(
                    keyProfessores.currentState!.widget.usuarios.length - 1);
                ////////////////////////////////
              }
            }
          }
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 205.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.file_open, color: Colors.white, size: 15.0),
            Text(
              " ADICIONAR PLANILHA",
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

class BotaoStatus extends StatelessWidget {
  BotaoStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        paginaS = 10;
        Navigator.pushNamed(context, '/sistema');
      },
      child: Container(
        alignment: Alignment.center,
        width: 205.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.settings, color: Colors.white, size: 15.0),
            Text(
              " GERENCIAR STATUS",
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
  BotaoSalvar({
    Key? key,
  }) : super(key: key);

  @override
  State<BotaoSalvar> createState() => _BotaoSalvarState();
}

class _BotaoSalvarState extends State<BotaoSalvar> {
  trazer_cargo(int contador, String id) {
    CollectionReference cargoss =
        FirebaseFirestore.instance.collection('Usuario');
    cargoss
        .where('instituicao',
            isEqualTo: keyProfessores.currentState!.widget.instituicao)
        .get()
        .then((QuerySnapshot q) {
      int contador2 = 0;
      q.docs.forEach((elementtt) {
        if (contador == contador2) {
          var eee = elementtt.reference;
          if (keyProfessores.currentState!.widget.adicionados.isNotEmpty) if (contador2 <
              keyProfessores.currentState!.widget.adicionados[0]) {
            eee.update({"cargo_antigo": elementtt['cargo'], "cargo": id});
          } else {
            eee.update({"cargo": id});
          }
        }
        contador2++;
      });
    });
  }

  trazer_status(int contador, String id) {
    CollectionReference statuss =
        FirebaseFirestore.instance.collection('Usuario');
    statuss
        .where('instituicao',
            isEqualTo: keyProfessores.currentState!.widget.instituicao)
        .get()
        .then((QuerySnapshot q) {
      int contador2 = 0;
      q.docs.forEach((elementtt) {
        if (contador == contador2) {
          var eee = elementtt.reference;
          eee.update({"status": id});
        }
        contador2++;
      });
    });
  }

  trazer_cargosssss(int contador, String id) {
    CollectionReference cargoss =
        FirebaseFirestore.instance.collection('Usuario');
    cargoss
        .where('instituicao',
            isEqualTo: keyProfessores.currentState!.widget.instituicao)
        .get()
        .then((QuerySnapshot q) {
      int contador2 = 0;
      q.docs.forEach((elementtt) {
        if (contador == contador2) {
          var eee = elementtt.reference;
          eee.update({"cargo": id});
        }
        contador2++;
      });
    });
  }

  bool verificar_email_usuario(String email) {
    bool verificador = false;
    CollectionReference usuariosss =
        FirebaseFirestore.instance.collection('Usuario');
    usuariosss
        .where('instituicao',
            isEqualTo: keyProfessores.currentState!.widget.instituicao)
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((elementt) {
        if (email == elementt['email']) verificador = true;
      });
    });
    return verificador;
  }

  criar_usuario(index) async {
    
    
  }
  List<FirebaseApp> tempApp = [];
  adicionar_firebase_app() async {
    tempApp.add(await Firebase.initializeApp(
        name: 'temporaryregister', options: Firebase.app().options));
  }

  @override
  Widget build(BuildContext context) {
    adicionar_firebase_app();
    return TextButton(
      onPressed: () {
        String verifica_email = "";
        bool verifica_vazios = false;
        keyProfessores.currentState!.widget.usuarios.forEach((element) {
          if (element.matricula.isEmpty || element.primeiro_nome.isEmpty)
            verifica_vazios = true;
        });
        if (verifica_vazios == false) {
          
          CollectionReference professores =
              FirebaseFirestore.instance.collection('Usuario');

          if (keyProfessores.currentState!.widget.adicionados.isNotEmpty) {
            FirebaseAuth auth = FirebaseAuth.instance;
            keyProfessores.currentState!.widget.adicionados
                .forEach((element) async {
                  UserCredential result =
                  await FirebaseAuth.instanceFor(app: tempApp[0])
                      .createUserWithEmailAndPassword(
                          email: keyProfessores
                              .currentState!.widget.usuarios[element].email,
                          password: keyProfessores
                              .currentState!.widget.usuarios[element].pass);

              
              /*configure(
        name: 'Secondary', options: FirebaseApp.instance.options);
    FirebaseAuth.fromApp(app)
        .createUserWithEmailAndPassword(email: email, password: password);*/

              /*auth
                  .createUserWithEmailAndPassword(
                      email: keyProfessores
                          .currentState!.widget.usuarios[element].email,
                      password: keyProfessores
                          .currentState!.widget.usuarios[element].pass)
                  .then((value) =>*/
              professores.add({
                "status": keyProfessores
                    .currentState!.widget.usuarios[element].id_status,
                "foto": "",
                "telefone": "",
                "instituicao": keyProfessores.currentState!.widget.instituicao,
                "matricula": keyProfessores
                    .currentState!.widget.usuarios[element].matricula,
                "cargo_antigo": keyProfessores
                    .currentState!.widget.usuarios[element].cargo_antigo,
                "primeiro_nome": keyProfessores
                    .currentState!.widget.usuarios[element].primeiro_nome,
                "segundo_nome": keyProfessores
                    .currentState!.widget.usuarios[element].segundo_nome,
                "cargo": keyProfessores
                    .currentState!.widget.usuarios[element].id_cargo,
                "quantidade_aprovacao_concurso": keyProfessores.currentState!
                    .widget.usuarios[element].quantidade_aprovacao_concurso,
                "quantidade_stricto_sensu": keyProfessores.currentState!.widget
                    .usuarios[element].quantidade_stricto_sensu,
                "quantidade_cursos_aperfeicoamento": keyProfessores
                    .currentState!
                    .widget
                    .usuarios[element]
                    .quantidade_cursos_aperfeicoamento,
                "quantidade_outros_cursos_realizados": keyProfessores
                    .currentState!
                    .widget
                    .usuarios[element]
                    .quantidade_outros_cursos_realizados,
                "quantidade_cursos_extensao_cultural": keyProfessores
                    .currentState!
                    .widget
                    .usuarios[element]
                    .quantidade_cursos_extensao_cultural,
                "quantidade_variaveis": keyProfessores.currentState!.widget
                    .usuarios[element].quantidade_variaveis,
                "quantidade_livros": keyProfessores
                    .currentState!.widget.usuarios[element].quantidade_livros,
                "quantidade_pesquisas_aprovadas": keyProfessores.currentState!
                    .widget.usuarios[element].quantidade_pesquisas_aprovadas,
                "quantidade_professor_universidade_publica": keyProfessores
                    .currentState!
                    .widget
                    .usuarios[element]
                    .quantidade_professor_universidade_publica,
                "quantidade_trabalhos_cientificos_revista": keyProfessores
                    .currentState!
                    .widget
                    .usuarios[element]
                    .quantidade_trabalhos_cientificos_revista,
                "quantidade_faltas": keyProfessores
                    .currentState!.widget.usuarios[element].quantidade_faltas,
                "data_admissao": Timestamp.fromDate(keyProfessores
                    .currentState!.widget.usuarios[element].data_admissao),
                "obs":
                    keyProfessores.currentState!.widget.usuarios[element].obs,
                "salario_atual": keyProfessores
                    .currentState!.widget.usuarios[element].salario_atual,
                "salario_ideal": keyProfessores
                    .currentState!.widget.usuarios[element].salario_ideal,
                "email":
                    keyProfessores.currentState!.widget.usuarios[element].email,
                "direitos_administrador": false
              }); /*)
                  .catchError((e) {
                setState(() {
                  verifica_email =
                      "Email de usuário(s) inserido(s) já foi cadastrado!";
                });
              });*/
            });
          }
          professores
              .where('instituicao',
                  isEqualTo: keyProfessores.currentState!.widget.instituicao)
              .get()
              .then((QuerySnapshot q) {
            if (keyProfessores.currentState!.widget.deletados.isNotEmpty) {
              int contadorRemover = 0;
              q.docs.forEach((elementt) {
                if (contadorRemover ==
                    keyProfessores.currentState!.widget.deletados[0]) {
                  var ee = elementt.reference;
                  ee.delete();
                }
                contadorRemover++;
              });
            }
            int contador3 = 0;
            keyProfessores.currentState!.widget.usuarios.forEach((element) {
              int contador4 = 0;
              q.docs.forEach((elementtt) {
                if (keyProfessores
                    .currentState!.widget.adicionados.isNotEmpty) {
                  if (contador4 <
                      keyProfessores.currentState!.widget
                          .adicionados[0]) if (element.id_usuario ==
                      elementtt.id) {
                    var eee = elementtt.reference;
                    ///////////////
                    ////////////////
                    ///

                    ///
                    ///
                    ///
                    ///
                    ///
                    eee.update({
                      "cargo_antigo": element.cargo_antigo,
                      "status": element.id_status,
                      "cargo": element.id_cargo,
                      "matricula": element.matricula,
                      "primeiro_nome": element.primeiro_nome,
                      "segundo_nome": element.segundo_nome,
                      "quantidade_aprovacao_concurso":
                          element.quantidade_aprovacao_concurso,
                      "quantidade_stricto_sensu":
                          element.quantidade_stricto_sensu,
                      "quantidade_cursos_aperfeicoamento":
                          element.quantidade_cursos_aperfeicoamento,
                      "quantidade_outros_cursos_realizados":
                          element.quantidade_outros_cursos_realizados,
                      "quantidade_cursos_extensao_cultural":
                          element.quantidade_cursos_extensao_cultural,
                      "quantidade_variaveis": element.quantidade_variaveis,
                      "quantidade_livros": element.quantidade_livros,
                      "quantidade_pesquisas_aprovadas":
                          element.quantidade_pesquisas_aprovadas,
                      "quantidade_professor_universidade_publica":
                          element.quantidade_professor_universidade_publica,
                      "quantidade_trabalhos_cientificos_revista":
                          element.quantidade_trabalhos_cientificos_revista,
                      "quantidade_faltas": element.quantidade_faltas,
                      "data_admissao":
                          Timestamp.fromDate(element.data_admissao),
                      "obs": element.obs,
                      "salario_ideal": element.salario_ideal,
                      "salario_atual": element.salario_atual,
                    });
                    //////////////////

                    //////////////////
                  }
                }

                if (keyProfessores.currentState!.widget.adicionados
                    .isEmpty) if (contador3 == contador4) {
                  var eee = elementtt.reference;
                  eee.update({
                    "status": element.id_status,
                    "cargo_antigo": element.cargo_antigo,
                    "matricula": element.matricula,
                    "primeiro_nome": element.primeiro_nome,
                    "segundo_nome": element.segundo_nome,
                    "quantidade_aprovacao_concurso":
                        element.quantidade_aprovacao_concurso,
                    "quantidade_stricto_sensu":
                        element.quantidade_stricto_sensu,
                    "quantidade_cursos_aperfeicoamento":
                        element.quantidade_cursos_aperfeicoamento,
                    "quantidade_outros_cursos_realizados":
                        element.quantidade_outros_cursos_realizados,
                    "quantidade_cursos_extensao_cultural":
                        element.quantidade_cursos_extensao_cultural,
                    "quantidade_variaveis": element.quantidade_variaveis,
                    "quantidade_livros": element.quantidade_livros,
                    "quantidade_pesquisas_aprovadas":
                        element.quantidade_pesquisas_aprovadas,
                    "quantidade_professor_universidade_publica":
                        element.quantidade_professor_universidade_publica,
                    "quantidade_trabalhos_cientificos_revista":
                        element.quantidade_trabalhos_cientificos_revista,
                    "quantidade_faltas": element.quantidade_faltas,
                    "data_admissao": Timestamp.fromDate(element.data_admissao),
                    "obs": element.obs,
                    "salario_ideal": element.salario_ideal,
                    "salario_atual": element.salario_atual,
                    "cargo": element.id_cargo
                  });
                }
                contador4++;
              });
              contador3++;
            });
          });

          /*
          
          */
          if (verifica_email.isEmpty) {
            paginaS = 0;
            Navigator.pushNamed(context, '/sistema');

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green,
              content: Text("Dados salvos com sucesso!"),
              duration: Duration(seconds: 5),
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(verifica_email),
              duration: Duration(seconds: 5),
            ));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
                "Há espaços em branco, por favor, preencha-os para poder salvar."),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfessoresState extends State<Professores> {
  pegar_id_cargo(int index, bool verifica) {
    CollectionReference cargosS =
        FirebaseFirestore.instance.collection('Cargo');
    cargosS
        .where('instituicao', isEqualTo: widget.instituicao)
        .orderBy('grau')
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((elementt) {
        if (keyProfessores.currentState!.display_list_cargos[index].titulo ==
            elementt['titulo']) {
          DocumentReference _documentReference = elementt.reference;
          if (verifica == true)
            retornar_id_cargo_antigo(index, display_list[index].id_cargo);
          retornar_id_cargo(index, _documentReference.id);
          get_salario_ideal(index, _documentReference.id);
        }
      });
    });
  }

  pegar_id_status(int index) {
    CollectionReference cargosS =
        FirebaseFirestore.instance.collection('SituacaoAdmissional');
    cargosS
        .where('instituicao', isEqualTo: widget.instituicao)
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((elementt) {
        if (keyProfessores.currentState!.display_list_status[index].nome ==
            elementt['nome']) {
          DocumentReference _documentReference = elementt.reference;
          retornar_id_status(index, _documentReference.id);
        }
      });
    });
  }

  retornar_id_status(int index, String id) {
    setState(() {
      display_list[index].id_status = id;
    });
  }

  retornar_id_cargo(int index, String id) {
    setState(() {
      display_list[index].id_cargo = id;
    });
  }

  retornar_id_cargo_antigo(int index, String id) {
    setState(() {
      display_list[index].cargo_antigo = id;
    });
  }

  retornar_pontuacoes(int index) {
    setState(() {
      display_list_cargos[index].pontuacaoExperiencia = 0;
      display_list_cargos[index].pontuacaoFormacao = 0;
      widget.cargos.forEach((element) {
        if (element.titulo == display_list_cargos[index].titulo) {
          display_list_cargos[index].pontuacao = element.valor_pontuacao;
        }
      });
    });

    CollectionReference pontuacoe =
        FirebaseFirestore.instance.collection('Pontuacao');

    pontuacoe
        .where('instituicao', isEqualTo: widget.instituicao)
        .orderBy('nome', descending: false)
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((elementtt) {
        DocumentReference _documentReference = elementtt.reference;

        CollectionReference _collectionReference =
            _documentReference.collection('PontuacaoAtributo');
        _collectionReference
            .orderBy('nome', descending: false)
            .get()
            .then((QuerySnapshot q) {
          q.docs.forEach((elementt) {
            double valor = 0;
            bool valor_logico = false;
            bool valor_logico_experiencia = false;

            if (elementtt['nome'] == "Pontuação de Formação Acadêmica") {
              valor_logico = true;
              // element.pontuacaoAtributo.forEach((element) {
              if (elementt['nome'] ==
                  "Cursos de Aperfeiçoamento (mínimo 180 Hs)") {
                if (display_list[index].quantidade_cursos_aperfeicoamento >
                    elementt['quantidade_maxima']) {
                  valor = elementt['quantidade_maxima'] * elementt['valor'];
                } else {
                  valor =
                      display_list[index].quantidade_cursos_aperfeicoamento *
                          elementt['valor'];
                }
              } else if (elementt['nome'] ==
                  "Cursos de Extensão Cultural (mínimo 30 Hs)") {
                if (display_list[index].quantidade_cursos_extensao_cultural >
                    elementt['quantidade_maxima']) {
                  valor = elementt['quantidade_maxima'] * elementt['valor'];
                } else {
                  valor =
                      display_list[index].quantidade_cursos_extensao_cultural *
                          elementt['valor'];
                }
              } else if (elementt['nome'] ==
                  'Créditos de Pós-Graduação "Stricto Sensu" por disciplina') {
                if (display_list[index].quantidade_stricto_sensu >
                    elementt['quantidade_maxima']) {
                  valor = elementt['quantidade_maxima'] * elementt['valor'];
                } else {
                  valor = display_list[index].quantidade_stricto_sensu *
                      elementt['valor'];
                }
              } else if (elementt['nome'] == "Variáveis") {
                if (display_list[index].quantidade_variaveis >
                    elementt['quantidade_maxima']) {
                  valor = elementt['quantidade_maxima'] * elementt['valor'];
                } else {
                  valor = display_list[index].quantidade_variaveis *
                      elementt['valor'];
                }
              } else if (elementt['nome'] == "Outros Cursos de Graduação") {
                if (display_list[index].quantidade_outros_cursos_realizados >
                    elementt['quantidade_maxima']) {
                  valor = elementt['quantidade_maxima'] * elementt['valor'];
                } else {
                  valor =
                      display_list[index].quantidade_outros_cursos_realizados *
                          elementt['valor'];
                }
              } else {
                if (display_list[index].quantidade_aprovacao_concurso >
                    elementt['quantidade_maxima']) {
                  valor = elementt['quantidade_maxima'] * elementt['valor'];
                } else {
                  valor = display_list[index].quantidade_aprovacao_concurso *
                      elementt['valor'];
                }
              }
            } else if (elementtt['nome'] == "Experiência") {
              valor_logico_experiencia = true;
              if (elementt['nome'] ==
                  "Trabalhos científicos publicados em revista especializada") {
                if (display_list[index]
                        .quantidade_trabalhos_cientificos_revista >
                    elementt['quantidade_maxima']) {
                  valor = elementt['quantidade_maxima'] * elementt['valor'];
                } else {
                  valor = display_list[index]
                          .quantidade_trabalhos_cientificos_revista *
                      elementt['valor'];
                }
              } else if (elementt['nome'] ==
                  "Realização de Pesquisa aprovada pela Instituição (Mínimo 1 ano)") {
                if (display_list[index].quantidade_pesquisas_aprovadas >
                    elementt['quantidade_maxima']) {
                  valor = elementt['quantidade_maxima'] * elementt['valor'];
                } else {
                  valor = display_list[index].quantidade_pesquisas_aprovadas *
                      elementt['valor'];
                }
              } else if (elementt['nome'] ==
                  "Professor de universidade pública (Por ano completo)") {
                if (display_list[index]
                        .quantidade_professor_universidade_publica >
                    elementt['quantidade_maxima']) {
                  valor = elementt['quantidade_maxima'] * elementt['valor'];
                } else {
                  valor = display_list[index]
                          .quantidade_professor_universidade_publica *
                      elementt['valor'];
                }
              } else {
                if (display_list[index].quantidade_livros >
                    elementt['quantidade_maxima']) {
                  valor = elementt['quantidade_maxima'] * elementt['valor'];
                } else {
                  valor =
                      display_list[index].quantidade_livros * elementt['valor'];
                }
              }
            } else if (elementtt['nome'] == "Assiduidade") {
              if (display_list[index].quantidade_faltas <=
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
              DateTime date1 = display_list[index].data_admissao;
              DateTime date2 = DateTime.now();
              // setState(() {
              display_list_cargos[index].quantidade_anos =
                  yearsBetween(date1, date2);
              //quantidade_meses = monthsBetween(date1, date2) % 12;
              //  });

              if (display_list_cargos[index].quantidade_anos >
                  elementt['quantidade_maxima']) {
                valor = elementt['quantidade_maxima'] * elementt['valor'];
              } else {
                valor = display_list_cargos[index].quantidade_anos *
                    elementt['valor'];
              }
            }
            if (valor_logico == true) {
              setState(() {
                display_list_cargos[index].pontuacaoFormacao =
                    display_list_cargos[index].pontuacaoFormacao + valor;
              });
            }

            if (valor_logico_experiencia == true) {
              setState(() {
                display_list_cargos[index].pontuacaoExperiencia =
                    display_list_cargos[index].pontuacaoExperiencia + valor;
              });
            }
            setState(() {
              display_list_cargos[index].pontuacao =
                  display_list_cargos[index].pontuacao + valor;
            });

            //cargosss.add(cargobase);
          });
        }).catchError((e) => print(e.toString()));
        //setState(() {
        //  pontuacoes.add(new Pontuacao(
        //      elementtt['instituicao'], elementtt['nome'], pontuacaoAtrib));
        //});
      });
    });
  }

  Future<void> get_salario_ideal(int index, String cargoP) async {
    CollectionReference cargos = FirebaseFirestore.instance.collection('Cargo');
    String string_cargo = "";
    if (cargoP.isEmpty) {
      string_cargo = display_list[index].id_cargo;
    } else {
      string_cargo = cargoP;
    }
    DocumentSnapshot carg = await cargos.doc(string_cargo).get();
    CollectionReference faixassalarias =
        carg.reference.collection('FaixaSalarial');
    faixassalarias
        .orderBy('final_intervalo', descending: true)
        .get()
        .then((QuerySnapshot q) {
      int contador = 0;
      q.docs.forEach((element) {
        if (contador == 0) {
          setState(() {
            display_list[index].salario_ideal = element['valor'];
          });
        } else if (element['final_intervalo'] >=
            display_list_cargos[index].pontuacao) {
          setState(() {
            display_list[index].salario_ideal = element['valor'];
          });
        }

        contador++;
      });
    });
  }

  String mensagem = "Carregando...";
  List<Usuario> display_list = [];
  List<SituacaoAdmissional> display_list_status = [];
  List<Cargo> display_list_cargos = [];
  List<Cargo> display_list_cargos_antigo = [];
  double valor = 0.63;
  void adicionar_usuario(Usuario usuario) {
    setState(
      () {
        widget.usuarios.add(usuario);
        display_list.add(usuario);
      },
    );
  }

  void adicionar_situacao(SituacaoAdmissional situacaoAdmissional) {
    setState(
      () {
        widget.situacoes_usuarios.add(situacaoAdmissional);
        display_list_status.add(situacaoAdmissional);
      },
    );
  }

  void adicionar_cargo(Cargo cargo) {
    setState(
      () {
        widget.cargos_usuarios.add(cargo);
        display_list_cargos.add(cargo);
      },
    );
  }

  void adicionar_cargo_antigo(Cargo cargo_antigo) {
    setState(
      () {
        widget.cargos_antigo.add(cargo_antigo);
        display_list_cargos_antigo.add(cargo_antigo);
      },
    );
  }

//////////////////////////////////////////
  ///
  void adicionar_sizes() {
    setState(() {
      widget.sizeAlturas.add(Size(0, 49));
    });
  }

  void adicionar_gk() {
    setState(() {
      widget.keysAltura.add(GlobalKey());
    });
  }

  void adicionar_matriculas(String param) {
    setState(() {
      widget.textEditingMatriculas.add(TextEditingController(text: param));
    });
  }

  void adicionar_salarios(String param) {
    setState(() {
      widget.textEditingSalarios.add(TextEditingController(text: param));
    });
  }

  void adicionar_nomes(String param) {
    setState(() {
      widget.textEditingNomes.add(TextEditingController(text: param));
    });
  }

  void adicionar_aprovacao_concurso_publico(String param) {
    setState(() {
      widget.textEditingAprovacaoConcursoPublico
          .add(TextEditingController(text: param));
    });
  }

  void adicionar_creditos_pos_graduacao(String param) {
    setState(() {
      widget.textEditingCreditosPosGraduacao
          .add(TextEditingController(text: param));
    });
  }

  void adicionar_cursos_aperfeicoamento(String param) {
    setState(() {
      widget.textEditingCursosAperfeicoamento
          .add(TextEditingController(text: param));
    });
  }

  void adicionar_outros_cursos(String param) {
    setState(() {
      widget.textEditingOutrosCursos.add(TextEditingController(text: param));
    });
  }

  void adicionar_cursos_extensao_cultural(String param) {
    setState(() {
      widget.textEditingCursosExtensaoCultural
          .add(TextEditingController(text: param));
    });
  }

  void adicionar_variaveis(String param) {
    setState(() {
      widget.textEditingVariaveis.add(TextEditingController(text: param));
    });
  }

  void adicionar_livros(String param) {
    setState(() {
      widget.textEditingLivros.add(TextEditingController(text: param));
    });
  }

  void adicionar_pesquisas(String param) {
    setState(() {
      widget.textEditingPesquisasRealizadas
          .add(TextEditingController(text: param));
    });
  }

  void adicionar_professor(String param) {
    setState(() {
      widget.textEditingProfessorUniversidadePublica
          .add(TextEditingController(text: param));
    });
  }

  void adicionar_trabalhos(String param) {
    setState(() {
      widget.textEditingTrabalhosCientificosPublicados
          .add(TextEditingController(text: param));
    });
  }

  void adicionar_assiduidade(String param) {
    setState(() {
      widget.textEditingAssiduidade.add(TextEditingController(text: param));
    });
  }

  void adicionar_data(String param) {
    setState(() {
      widget.textEditingData.add(TextEditingController(text: param));
    });
  }

  void adicionar_observacoes(String param) {
    setState(() {
      widget.textEditingObservacoes.add(TextEditingController(text: param));
    });
  }

  ///
////////////////////////////////////////////
  _ProfessoresState(double valor) {
    this.valor = valor;
  }
  void adicionar_professores(int index) {
    setState(() {
      widget.adicionados.add(index);
    });
  }

  void deletar_professores(int index) {
    setState(() {
      widget.deletados.add(index);
    });
  }

  int statusCont = 1;
  static List<TextEditingController> controllerl1 = [
    TextEditingController(text: "6876875"),
    TextEditingController(text: "Adriana Carta"),
    TextEditingController(text: "Professor Graduado"),
    TextEditingController(text: "Professor Mestre"),
    TextEditingController(text: "Mestrado"),
    TextEditingController(text: "0"),
    TextEditingController(text: "0"),
    TextEditingController(text: "0"),
    TextEditingController(text: "0"),
    TextEditingController(text: "0"),
    TextEditingController(text: "0"),
    TextEditingController(text: "0"),
    TextEditingController(text: "0"),
    TextEditingController(text: "0"),
    TextEditingController(text: "0"),
    TextEditingController(text: "7"),
    TextEditingController(text: "11/08/14"),
    TextEditingController(text: "Gente boa!"),
  ];
  static List<TextEditingController> controllerl2 = [
    TextEditingController(text: "7652615"),
    TextEditingController(text: "Adriana Naime Pontes Passoni"),
    TextEditingController(text: "Professor Graduado"),
    TextEditingController(text: "Professor Mestre"),
    TextEditingController(text: "Mestrado"),
    TextEditingController(text: "0"),
    TextEditingController(text: "3"),
    TextEditingController(text: "1"),
    TextEditingController(text: "1"),
    TextEditingController(text: "2"),
    TextEditingController(text: "4"),
    TextEditingController(text: "1"),
    TextEditingController(text: "1"),
    TextEditingController(text: "3"),
    TextEditingController(text: "1"),
    TextEditingController(text: "0"),
    TextEditingController(text: "24/03/95"),
    TextEditingController(text: "Chato demais!"),
  ];
  final List<GlobalKey> categorias = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey()
  ];
  final List<GlobalKey> keyAltura = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey()
  ];
  List<Size> sizeAltura = [
    Size(0, 49),
    Size(0, 49),
    Size(0, 49),
    Size(0, 49),
    Size(0, 49),
    Size(0, 49),
    Size(0, 49)
  ];
  int ind = 0;
  late ScrollController scrollCont;
  final dropValue = ValueNotifier('');
  final dropOpcoes = ['Ativo', 'Inativo', 'Afastado'];
  BuildContext? tabContext;
  late ScrollController _scrollControllerOne, _scrollControllerTwo;
  scrollTo(int index) async {
    scrollCont.removeListener(changeTabs);
    final categoria = categorias[index].currentContext!;

    await Scrollable.ensureVisible(categoria,
        duration: Duration(milliseconds: 600));
    setState(() {
      ind = index;
    });
    scrollCont.addListener(changeTabs);
  }

  @override
  void initState() {
    scrollCont = ScrollController();
    scrollCont.addListener(changeTabs);
    super.initState();
    for (int i = 0; i < widget.keysAltura.length; i++) atualizaContainer(i);
    _scrollControllerOne = ScrollController();
    _scrollControllerTwo = ScrollController();
    _scrollControllerTwo.addListener(() {
      scrollOne();
    });
    _scrollControllerOne.addListener(() {
      scrollTwo();
    });
  }

  void scrollOne() {
    _scrollControllerOne.animateTo(_scrollControllerTwo.offset,
        duration: const Duration(milliseconds: 1), curve: Curves.linear);
  }

  void scrollTwo() {
    _scrollControllerTwo.animateTo(_scrollControllerOne.offset,
        duration: const Duration(milliseconds: 1), curve: Curves.linear);
  }

  @override
  void dispose() {
    _scrollControllerOne.dispose();
    _scrollControllerTwo.dispose();
    super.dispose();
  }

  void atualizaContainer(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      late RenderBox boxx;
      boxx = widget.keysAltura[index].currentContext!.findRenderObject()
          as RenderBox;
      widget.sizeAlturas[index] = boxx.size;
    });
  }

  changeTabs() {
    late RenderBox box;
    for (var i = 0; i < categorias.length; i++) {
      box = categorias[i].currentContext!.findRenderObject() as RenderBox;
      Offset position = box.localToGlobal(Offset.zero);
      if (scrollCont.offset >= position.dx)
        setState(() {
          ind = i;
        });
    }
  }

  void updateList(String value) {
    int contador = 0;
    setState(() {
      display_list_cargos = this
          .widget
          .cargos_usuarios
          .where((element) =>
              (element.primeiro_nome + " " + element.segundo_nome)
                  .toLowerCase()
                  .contains(value.toLowerCase()) ||
              element.matricula.toLowerCase().contains(value.toLowerCase()))
          .toList();
      display_list = this
          .widget
          .usuarios
          .where((element) =>
              (element.primeiro_nome + " " + element.segundo_nome)
                  .toLowerCase()
                  .contains(value.toLowerCase()) ||
              element.matricula.toLowerCase().contains(value.toLowerCase()))
          .toList();
      display_list_status = this
          .widget
          .situacoes_usuarios
          .where((element) =>
              (element.primeiro_nome + " " + element.segundo_nome)
                  .toLowerCase()
                  .contains(value.toLowerCase()) ||
              element.matricula.toLowerCase().contains(value.toLowerCase()))
          .toList();

      display_list_cargos_antigo = this
          .widget
          .cargos_antigo
          .where((element) =>
              (element.primeiro_nome + " " + element.segundo_nome)
                  .toLowerCase()
                  .contains(value.toLowerCase()) ||
              element.matricula.toLowerCase().contains(value.toLowerCase()))
          .toList();
      widget.textEditingAprovacaoConcursoPublico = [];
      widget.textEditingAssiduidade = [];
      widget.textEditingCreditosPosGraduacao = [];
      widget.textEditingCursosAperfeicoamento = [];
      widget.textEditingCursosExtensaoCultural = [];
      widget.textEditingData = [];
      widget.textEditingLivros = [];
      widget.textEditingMatriculas = [];
      widget.textEditingNomes = [];
      widget.textEditingObservacoes = [];
      widget.textEditingOutrosCursos = [];
      widget.textEditingPesquisasRealizadas = [];
      widget.textEditingTrabalhosCientificosPublicados = [];
      widget.textEditingProfessorUniversidadePublica = [];
      widget.textEditingVariaveis = [];
      widget.keysAltura = [];
      widget.sizeAlturas = [];
      int contt = 0;
      display_list.forEach((element) {
        widget.keysAltura.add(GlobalKey());
        widget.sizeAlturas.add(Size(0, 49));
        //atualizaContainer(contt);
        widget.textEditingNomes.add(TextEditingController(
            text: (element.primeiro_nome + " " + element.segundo_nome)));
        widget.textEditingMatriculas
            .add(TextEditingController(text: element.matricula));
        widget.textEditingAprovacaoConcursoPublico.add(TextEditingController(
            text: element.quantidade_aprovacao_concurso.toString()));
        widget.textEditingCreditosPosGraduacao.add(TextEditingController(
            text: element.quantidade_stricto_sensu.toString()));
        widget.textEditingCursosAperfeicoamento.add(TextEditingController(
            text: element.quantidade_cursos_aperfeicoamento.toString()));
        widget.textEditingOutrosCursos.add(TextEditingController(
            text: element.quantidade_outros_cursos_realizados.toString()));
        widget.textEditingCursosExtensaoCultural.add(TextEditingController(
            text: element.quantidade_cursos_extensao_cultural.toString()));
        widget.textEditingVariaveis.add(TextEditingController(
            text: element.quantidade_variaveis.toString()));
        widget.textEditingLivros.add(
            TextEditingController(text: element.quantidade_livros.toString()));
        widget.textEditingPesquisasRealizadas.add(TextEditingController(
            text: element.quantidade_pesquisas_aprovadas.toString()));
        widget.textEditingProfessorUniversidadePublica.add(
            TextEditingController(
                text: element.quantidade_professor_universidade_publica
                    .toString()));
        widget.textEditingTrabalhosCientificosPublicados.add(
            TextEditingController(
                text: element.quantidade_trabalhos_cientificos_revista
                    .toString()));
        widget.textEditingAssiduidade.add(
            TextEditingController(text: element.quantidade_faltas.toString()));
        widget.textEditingData.add(TextEditingController(
            text: DateFormat("dd/MM/yyyy").format(element.data_admissao)));
        widget.textEditingObservacoes
            .add(TextEditingController(text: element.obs));
      });
    });
  }

  TextEditingController textEditingBase = TextEditingController(text: "...");
  @override
  Widget build(BuildContext context) {
    if (this.widget.verificar == false) {
      setState(() {
        this.display_list = List.from(this.widget.usuarios);
        this.display_list_cargos = List.from(this.widget.cargos_usuarios);
        this.display_list_status = List.from(this.widget.situacoes_usuarios);
        this.display_list_cargos_antigo = List.from(this.widget.cargos_antigo);
        this.widget.verificar = true;
      });
    }
    final mediaQuery = MediaQuery.of(context).size;
    return Builder(builder: (BuildContext context) {
      tabContext = context;

      return Container(
        height: 430,
        width: 1000,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: mediaQuery.height * 0.005,
                  horizontal: mediaQuery.width * 0.01),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [],
                        ),
                        Container(
                          constraints: BoxConstraints(minWidth: 175),
                          width: mediaQuery.width * 0.25,
                          height: 45.0,
                          child: TextField(
                            onChanged: (value) {
                              if (display_list.asMap().containsKey(4))
                                print(
                                    display_list[4].primeiro_nome + "usuario");
                              if (display_list_cargos.asMap().containsKey(4))
                                print(display_list_cargos[4].primeiro_nome +
                                    "cargo_novo");
                              if (display_list_cargos_antigo
                                  .asMap()
                                  .containsKey(4))
                                print(display_list_cargos_antigo[4]
                                        .primeiro_nome +
                                    "cargo_antigo");
                              if (display_list_status.asMap().containsKey(4))
                                print(display_list_status[4].primeiro_nome +
                                    "status");
                              setState(() {
                                mensagem = "Nenhum resultado encontrado!";
                              });
                              updateList(value);
                            },
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  style: BorderStyle.none,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  style: BorderStyle.none,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(Icons.search,
                                  color: Colors.black, size: 20.0),
                              hintText: 'Pesquisar...',
                              alignLabelWithHint: true,
                              hintStyle: const TextStyle(
                                color: Colors.black87,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 40,
                              height: 40,
                            ),
                            SizedBox(height: 2),
                            SizedBox(
                              height: 250,
                              child: ScrollConfiguration(
                                behavior: ScrollConfiguration.of(context)
                                    .copyWith(scrollbars: false),
                                child: SingleChildScrollView(
                                  controller: _scrollControllerOne,
                                  child: Column(
                                    children: [
                                      (display_list.length == 0 ||
                                              display_list_cargos.length !=
                                                  display_list.length ||
                                              display_list_cargos_antigo.length !=
                                                  display_list.length ||
                                              display_list_status.length !=
                                                  display_list.length ||
                                              widget.sizeAlturas.length !=
                                                  display_list.length ||
                                              widget.keysAltura.length !=
                                                  display_list.length ||
                                              widget.textEditingAprovacaoConcursoPublico.length !=
                                                  display_list.length ||
                                              widget.textEditingAssiduidade.length !=
                                                  display_list.length ||
                                              widget.textEditingCreditosPosGraduacao.length !=
                                                  display_list.length ||
                                              widget.textEditingCursosAperfeicoamento.length !=
                                                  display_list.length ||
                                              widget.textEditingCursosExtensaoCultural.length !=
                                                  display_list.length ||
                                              widget.textEditingData.length !=
                                                  display_list.length ||
                                              widget.textEditingLivros.length !=
                                                  display_list.length ||
                                              widget.textEditingMatriculas.length !=
                                                  display_list.length ||
                                              widget.textEditingNomes.length !=
                                                  display_list.length ||
                                              widget.textEditingObservacoes.length !=
                                                  display_list.length ||
                                              widget.textEditingOutrosCursos.length !=
                                                  display_list.length ||
                                              widget.textEditingPesquisasRealizadas.length !=
                                                  display_list.length ||
                                              widget.textEditingProfessorUniversidadePublica
                                                      .length !=
                                                  display_list.length ||
                                              widget.textEditingTrabalhosCientificosPublicados
                                                      .length !=
                                                  display_list.length ||
                                              widget.textEditingVariaveis.length !=
                                                  display_list.length)
                                          ? Container(
                                              height: 250,
                                              width: 40,
                                              child: Center(child: Text("")))
                                          : Container(
                                              height: 250,
                                              width: 40,
                                              child: ListView.builder(
                                                controller:
                                                    _scrollControllerOne,
                                                itemCount:
                                                    this.display_list.length,
                                                itemBuilder: (context, index) =>
                                                    Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 0, 0, 2),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 40,
                                                        height: (widget
                                                                .sizeAlturas
                                                                .asMap()
                                                                .containsKey(
                                                                    index))
                                                            ? widget
                                                                .sizeAlturas[
                                                                    index]
                                                                .height
                                                            : 50,
                                                        child: IconButton(
                                                          icon: const Icon(
                                                              Icons.cancel),
                                                          color: Colors.red,
                                                          onPressed: () {
                                                            if (widget
                                                                    .adicionados
                                                                    .isEmpty &&
                                                                widget.deletados
                                                                    .isEmpty) {
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder: (_) =>
                                                                      AlertDialog(
                                                                        title:
                                                                            Text(
                                                                          "Confirmação de remoção",
                                                                        ),
                                                                        content:
                                                                            Text("Tem certeza que deseja remover este professor? (É necessário clicar em \"Ok\" e em seguida clicar em \"SALVAR\" para confirmar a remoção.)"),
                                                                        actions: [
                                                                          TextButton(
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                              child: Text('Cancelar')),
                                                                          TextButton(
                                                                              onPressed: () {
                                                                                setState(() {
                                                                                  int contador_remover = -1;
                                                                                  for (int i = 0; i < widget.usuarios.length; i++) {
                                                                                    if (widget.usuarios[i].id_usuario == display_list[index].id_usuario) {
                                                                                      i = widget.usuarios.length;
                                                                                    }
                                                                                    contador_remover++;
                                                                                  }
                                                                                  widget.textEditingMatriculas.removeAt(index);
                                                                                  widget.textEditingNomes.removeAt(index);
                                                                                  widget.textEditingAprovacaoConcursoPublico.removeAt(index);
                                                                                  widget.textEditingCreditosPosGraduacao.removeAt(index);
                                                                                  widget.textEditingSalarios.removeAt(index);
                                                                                  widget.textEditingCursosAperfeicoamento.removeAt(index);
                                                                                  widget.textEditingOutrosCursos.removeAt(index);
                                                                                  widget.textEditingCursosExtensaoCultural.removeAt(index);
                                                                                  widget.textEditingVariaveis.removeAt(index);
                                                                                  widget.textEditingLivros.removeAt(index);
                                                                                  widget.textEditingPesquisasRealizadas.removeAt(index);
                                                                                  widget.textEditingProfessorUniversidadePublica.removeAt(index);
                                                                                  widget.textEditingTrabalhosCientificosPublicados.removeAt(index);
                                                                                  widget.textEditingAssiduidade.removeAt(index);
                                                                                  widget.textEditingData.removeAt(index);

                                                                                  display_list.removeAt(index);
                                                                                  display_list_status.removeAt(index);
                                                                                  display_list_cargos.removeAt(index);
                                                                                  display_list_cargos_antigo.removeAt(index);

                                                                                  widget.usuarios.removeAt(contador_remover);
                                                                                  widget.cargos_usuarios.removeAt(contador_remover);
                                                                                  widget.cargos_antigo.removeAt(contador_remover);
                                                                                  widget.situacoes_usuarios.removeAt(contador_remover);

                                                                                  widget.deletados.add(contador_remover);
                                                                                });
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                              child: Text('Ok')),
                                                                        ],
                                                                      ));
                                                            } else {
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder: (_) =>
                                                                      AlertDialog(
                                                                        title:
                                                                            Text(
                                                                          "Uma remoção por vez!",
                                                                        ),
                                                                        content:
                                                                            Text("Você já removeu/adicionou uma faixa, por favor, salve as alterações para remover outra faixa."),
                                                                        actions: [
                                                                          TextButton(
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                              child: Text('Ok')),
                                                                        ],
                                                                      ));
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        //Column(children: [
                        SizedBox(
                          width: (mediaQuery.width * this.valor) - 40,
                          child: SingleChildScrollView(
                            controller: scrollCont,
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 1,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      key: categorias[0],
                                      alignment: Alignment.center,
                                      width: 104.5,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Status",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 104.5,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Matrícula",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 300.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Nome Funcionário",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 209,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Cargo Antigo",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      key: categorias[1],
                                      alignment: Alignment.center,
                                      width: 209,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Cargo Novo",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 209,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            "Título",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 104.5,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue[200],
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            "Aprovação em\nconcurso público",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 104.5,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue[200],
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            "Créditos de pós\ngraduação",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 104.5,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue[200],
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            "Cursos de\naperfeiçoamento",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 104.5,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue[200],
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            "Outros cursos de\ngraduação",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      key: categorias[2],
                                      alignment: Alignment.center,
                                      width: 104.5,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue[200],
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            "Cursos de extensão\ncultural",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 104.5,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue[200],
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            "Variáveis",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 104.5,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue[300],
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            "TOTAL\nFormação\nAcadêmica",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 104.5,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue[400],
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            "Livros Publicados",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      key: categorias[3],
                                      alignment: Alignment.center,
                                      width: 104.5,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue[400],
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            "Pesquisa realizada",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 104.5,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue[400],
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            "Professor de\nuniversidade pública",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 104.5,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue[400],
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            "Trabalhos científicos\npublicados",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 104.5,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue[400],
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            "TOTAL\nExperiência",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      key: categorias[4],
                                      alignment: Alignment.center,
                                      width: 104.5,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            "Assiduidade",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 104.5,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            "Data de admissão",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 209,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            "Observações",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 104.5,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            "Salário atual",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 104.5,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            "PONTUAÇÃO",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2,
                                ),

                                display_list.length == 0
                                    ? Container(
                                        height: 250,
                                        width: (mediaQuery.width * this.valor) -
                                            211,
                                        child:
                                            Center(child: Text(this.mensagem)))
                                    : Container(
                                        height: 250,
                                        width: 3061,
                                        child: ListView.builder(
                                          controller: _scrollControllerTwo,
                                          itemCount: this.display_list.length,
                                          itemBuilder: (context, index) =>
                                              Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 2),
                                            child: IntrinsicHeight(
                                              child: Container(
                                                key: widget.keysAltura.isEmpty
                                                    ? keyAltura[0]
                                                    : widget.keysAltura[index],
                                                constraints: BoxConstraints(
                                                    maxHeight: 100),
                                                child: Row(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (display_list_status
                                                                    .asMap()
                                                                    .containsKey(
                                                                        index))
                                                                ? display_list_status[index]
                                                                            .calcula_valor ==
                                                                        false
                                                                    ? Colors.red[
                                                                        200]
                                                                    : Colors
                                                                        .white
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ValueListenableBuilder(
                                                                  valueListenable:
                                                                      ValueNotifier(
                                                                          ''),
                                                                  builder: (BuildContext
                                                                          context,
                                                                      String
                                                                          valuee,
                                                                      _) {
                                                                    return DropdownButton<
                                                                        String>(
                                                                      hint: Text(
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                          ),
                                                                          (display_list_status.asMap().containsKey(index)) ? display_list_status[index].nome : "..."),
                                                                      value: (valuee
                                                                              .isEmpty)
                                                                          ? null
                                                                          : valuee,
                                                                      onChanged:
                                                                          (escolha) {
                                                                        setState(
                                                                            () {
                                                                          atualizaContainer(
                                                                              index);
                                                                          display_list_status[index].nome =
                                                                              escolha.toString();
                                                                          widget
                                                                              .situacoes
                                                                              .forEach((element) {
                                                                            if (element.nome ==
                                                                                escolha.toString())
                                                                              display_list_status[index].calcula_valor = element.calcula_valor;
                                                                          });
                                                                          pegar_id_status(
                                                                              index);
                                                                        });
                                                                        if (valuee
                                                                            .isNotEmpty)
                                                                          valuee =
                                                                              escolha.toString();
                                                                      },
                                                                      items: widget
                                                                          .situacoes
                                                                          .map((op) =>
                                                                              DropdownMenuItem(
                                                                                value: op.nome,
                                                                                child: Text(op.nome),
                                                                              ))
                                                                          .toList(),
                                                                    );
                                                                  })
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (display_list_status
                                                                    .asMap()
                                                                    .containsKey(
                                                                        index))
                                                                ? display_list_status[index]
                                                                            .calcula_valor ==
                                                                        false
                                                                    ? Colors.red[
                                                                        200]
                                                                    : Colors
                                                                        .white
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          constraints:
                                                              BoxConstraints(
                                                                  minHeight:
                                                                      40),
                                                          child: TextField(
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      r'[0-9]')),
                                                            ],
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller: widget
                                                                    .textEditingMatriculas[
                                                                index],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                display_list[
                                                                            index]
                                                                        .matricula =
                                                                    value;
                                                                display_list_cargos[
                                                                            index]
                                                                        .matricula =
                                                                    value;
                                                                display_list_cargos_antigo[
                                                                            index]
                                                                        .matricula =
                                                                    value;
                                                                display_list_status[
                                                                            index]
                                                                        .matricula =
                                                                    value;
                                                                atualizaContainer(
                                                                    index);
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 300.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (display_list_status
                                                                    .asMap()
                                                                    .containsKey(
                                                                        index))
                                                                ? display_list_status[index]
                                                                            .calcula_valor ==
                                                                        false
                                                                    ? Colors.red[
                                                                        200]
                                                                    : Colors
                                                                        .white
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            onChanged:
                                                                (value) =>
                                                                    setState(
                                                                        () {
                                                              List<String>
                                                                  nomes =
                                                                  value.split(
                                                                      " ");
                                                              if (nomes
                                                                      .length ==
                                                                  1) {
                                                                display_list[
                                                                            index]
                                                                        .primeiro_nome =
                                                                    value;
                                                                display_list_cargos[
                                                                            index]
                                                                        .primeiro_nome =
                                                                    value;
                                                                display_list_cargos_antigo[
                                                                            index]
                                                                        .primeiro_nome =
                                                                    value;
                                                                display_list_status[
                                                                            index]
                                                                        .primeiro_nome =
                                                                    value;
                                                                display_list_cargos[
                                                                        index]
                                                                    .segundo_nome = "";
                                                                display_list_cargos_antigo[
                                                                        index]
                                                                    .segundo_nome = "";
                                                                display_list_status[
                                                                        index]
                                                                    .segundo_nome = "";
                                                                display_list[
                                                                        index]
                                                                    .segundo_nome = "";
                                                              } else {
                                                                display_list_cargos[
                                                                            index]
                                                                        .primeiro_nome =
                                                                    nomes[0];
                                                                display_list_cargos_antigo[
                                                                            index]
                                                                        .primeiro_nome =
                                                                    nomes[0];
                                                                display_list_status[
                                                                            index]
                                                                        .primeiro_nome =
                                                                    nomes[0];
                                                                display_list[
                                                                            index]
                                                                        .primeiro_nome =
                                                                    nomes[0];
                                                                for (int i = 1;
                                                                    i <
                                                                        (nomes.length -
                                                                            1);
                                                                    i++) {
                                                                  display_list[
                                                                          index]
                                                                      .primeiro_nome = display_list[
                                                                              index]
                                                                          .primeiro_nome +
                                                                      " " +
                                                                      nomes[i];
                                                                  display_list_cargos[
                                                                          index]
                                                                      .primeiro_nome = display_list_cargos[
                                                                              index]
                                                                          .primeiro_nome +
                                                                      " " +
                                                                      nomes[i];
                                                                  display_list_cargos_antigo[
                                                                          index]
                                                                      .primeiro_nome = display_list_cargos_antigo[
                                                                              index]
                                                                          .primeiro_nome +
                                                                      " " +
                                                                      nomes[i];
                                                                  display_list_status[
                                                                          index]
                                                                      .primeiro_nome = display_list_status[
                                                                              index]
                                                                          .primeiro_nome +
                                                                      " " +
                                                                      nomes[i];
                                                                }
                                                                display_list[
                                                                            index]
                                                                        .segundo_nome =
                                                                    nomes[(nomes
                                                                            .length -
                                                                        1)];
                                                                display_list_cargos[
                                                                            index]
                                                                        .segundo_nome =
                                                                    nomes[(nomes
                                                                            .length -
                                                                        1)];
                                                                display_list_cargos_antigo[
                                                                            index]
                                                                        .segundo_nome =
                                                                    nomes[(nomes
                                                                            .length -
                                                                        1)];
                                                                display_list_status[
                                                                            index]
                                                                        .segundo_nome =
                                                                    nomes[(nomes
                                                                            .length -
                                                                        1)];
                                                              }

                                                              atualizaContainer(
                                                                  index);
                                                            }),
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller: widget
                                                                    .textEditingNomes[
                                                                index],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (display_list_status
                                                                    .asMap()
                                                                    .containsKey(
                                                                        index))
                                                                ? display_list_status[index]
                                                                            .calcula_valor ==
                                                                        false
                                                                    ? Colors.red[
                                                                        200]
                                                                    : Colors
                                                                        .white
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            (display_list_cargos_antigo
                                                                    .asMap()
                                                                    .containsKey(
                                                                        index))
                                                                ? display_list_cargos_antigo[
                                                                        index]
                                                                    .nome
                                                                : "...",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width: 209,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: (display_list_status
                                                                      .asMap()
                                                                      .containsKey(
                                                                          index))
                                                                  ? display_list_status[index]
                                                                              .calcula_valor ==
                                                                          false
                                                                      ? Colors.red[
                                                                          200]
                                                                      : Colors
                                                                          .white
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                            ),
                                                            child:
                                                                ValueListenableBuilder(
                                                                    valueListenable:
                                                                        ValueNotifier(
                                                                            ''),
                                                                    builder: (BuildContext
                                                                            context,
                                                                        String
                                                                            valuee,
                                                                        _) {
                                                                      return DropdownButton<
                                                                          String>(
                                                                        hint: Text(
                                                                            textAlign: TextAlign.center,
                                                                            style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 16.0,
                                                                            ),
                                                                            (display_list_cargos.asMap().containsKey(index)) ? display_list_cargos[index].nome : "..."),
                                                                        value: (valuee.isEmpty)
                                                                            ? null
                                                                            : valuee,
                                                                        onChanged:
                                                                            (escolha) {
                                                                          pegar_id_cargo(
                                                                              index,
                                                                              true);
                                                                          setState(
                                                                              () {
                                                                            atualizaContainer(index);
                                                                          });
                                                                          this
                                                                              .widget
                                                                              .cargos
                                                                              .forEach(
                                                                            (element) {
                                                                              if (escolha.toString() == element.nome)
                                                                                setState(() {
                                                                                  display_list_cargos[index].titulo = element.titulo;
                                                                                });
                                                                            },
                                                                          );

                                                                          setState(
                                                                              () {
                                                                            display_list_cargos[index].nome =
                                                                                escolha.toString();
                                                                          });
                                                                          if (valuee
                                                                              .isNotEmpty)
                                                                            valuee =
                                                                                escolha.toString();
                                                                        },
                                                                        items: widget
                                                                            .cargos
                                                                            .map((op) =>
                                                                                DropdownMenuItem(
                                                                                  value: op.nome,
                                                                                  child: Text(op.nome),
                                                                                ))
                                                                            .toList(),
                                                                      );
                                                                    })),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width: 209,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: (display_list_status
                                                                      .asMap()
                                                                      .containsKey(
                                                                          index))
                                                                  ? display_list_status[index]
                                                                              .calcula_valor ==
                                                                          false
                                                                      ? Colors.red[
                                                                          200]
                                                                      : Colors
                                                                          .white
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                            ),
                                                            child:
                                                                ValueListenableBuilder(
                                                                    valueListenable:
                                                                        ValueNotifier(
                                                                            ''),
                                                                    builder: (BuildContext
                                                                            context,
                                                                        String
                                                                            valuee,
                                                                        _) {
                                                                      return DropdownButton<
                                                                          String>(
                                                                        hint: Text(
                                                                            textAlign: TextAlign.center,
                                                                            style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 16.0,
                                                                            ),
                                                                            display_list_cargos.isNotEmpty ? display_list_cargos[index].titulo : "..."),
                                                                        value: (valuee.isEmpty)
                                                                            ? null
                                                                            : valuee,
                                                                        onChanged:
                                                                            (escolha) {
                                                                          setState(
                                                                              () {
                                                                            atualizaContainer(index);
                                                                          });
                                                                          this
                                                                              .widget
                                                                              .cargos
                                                                              .forEach(
                                                                            (element) {
                                                                              if (escolha.toString() == element.titulo)
                                                                                setState(() {
                                                                                  display_list_cargos[index].nome = element.nome;
                                                                                });
                                                                            },
                                                                          );
                                                                          setState(
                                                                              () {
                                                                            display_list_cargos[index].titulo =
                                                                                escolha.toString();
                                                                          });
                                                                          if (valuee
                                                                              .isNotEmpty)
                                                                            valuee =
                                                                                escolha.toString();
                                                                        },
                                                                        items: widget
                                                                            .cargos
                                                                            .map((op) =>
                                                                                DropdownMenuItem(
                                                                                  value: op.titulo,
                                                                                  child: Text(op.nome),
                                                                                ))
                                                                            .toList(),
                                                                      );
                                                                    })),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (display_list_status
                                                                    .asMap()
                                                                    .containsKey(
                                                                        index))
                                                                ? display_list_status[index]
                                                                            .calcula_valor ==
                                                                        false
                                                                    ? Colors.red[
                                                                        200]
                                                                    : Colors
                                                                        .white
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            onChanged:
                                                                (value) =>
                                                                    setState(
                                                                        () {
                                                              if (value
                                                                  .isNotEmpty)
                                                                display_list[
                                                                            index]
                                                                        .quantidade_aprovacao_concurso =
                                                                    double.parse(
                                                                        value);
                                                              atualizaContainer(
                                                                  index);
                                                              retornar_pontuacoes(
                                                                  index);
                                                              get_salario_ideal(
                                                                  index, "");
                                                            }),
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      r'[0-9]')),
                                                            ],
                                                            controller: widget
                                                                    .textEditingAprovacaoConcursoPublico[
                                                                index],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (display_list_status
                                                                    .asMap()
                                                                    .containsKey(
                                                                        index))
                                                                ? display_list_status[index]
                                                                            .calcula_valor ==
                                                                        false
                                                                    ? Colors.red[
                                                                        200]
                                                                    : Colors
                                                                        .white
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            onChanged: (value) {
                                                              setState(() {
                                                                if (value
                                                                    .isNotEmpty)
                                                                  display_list[
                                                                              index]
                                                                          .quantidade_stricto_sensu =
                                                                      double.parse(
                                                                          value);
                                                                atualizaContainer(
                                                                    index);
                                                                retornar_pontuacoes(
                                                                    index);
                                                                get_salario_ideal(
                                                                    index, "");
                                                              });
                                                            },
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      r'[0-9]')),
                                                            ],
                                                            controller: widget
                                                                    .textEditingCreditosPosGraduacao[
                                                                index],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (display_list_status
                                                                    .asMap()
                                                                    .containsKey(
                                                                        index))
                                                                ? display_list_status[index]
                                                                            .calcula_valor ==
                                                                        false
                                                                    ? Colors.red[
                                                                        200]
                                                                    : Colors
                                                                        .white
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            onChanged: (value) {
                                                              setState(() {
                                                                if (value
                                                                    .isNotEmpty)
                                                                  display_list[
                                                                              index]
                                                                          .quantidade_cursos_aperfeicoamento =
                                                                      double.parse(
                                                                          value);
                                                                atualizaContainer(
                                                                    index);
                                                                retornar_pontuacoes(
                                                                    index);
                                                                get_salario_ideal(
                                                                    index, "");
                                                              });
                                                            },
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      r'[0-9]')),
                                                            ],
                                                            controller: widget
                                                                    .textEditingCursosAperfeicoamento[
                                                                index],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (display_list_status
                                                                    .asMap()
                                                                    .containsKey(
                                                                        index))
                                                                ? display_list_status[index]
                                                                            .calcula_valor ==
                                                                        false
                                                                    ? Colors.red[
                                                                        200]
                                                                    : Colors
                                                                        .white
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            onChanged: (value) {
                                                              setState(() {
                                                                if (value
                                                                    .isNotEmpty)
                                                                  display_list[
                                                                              index]
                                                                          .quantidade_outros_cursos_realizados =
                                                                      double.parse(
                                                                          value);
                                                                atualizaContainer(
                                                                    index);
                                                                retornar_pontuacoes(
                                                                    index);
                                                                get_salario_ideal(
                                                                    index, "");
                                                              });
                                                            },
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      r'[0-9]')),
                                                            ],
                                                            controller: widget
                                                                    .textEditingOutrosCursos[
                                                                index],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (display_list_status
                                                                    .asMap()
                                                                    .containsKey(
                                                                        index))
                                                                ? display_list_status[index]
                                                                            .calcula_valor ==
                                                                        false
                                                                    ? Colors.red[
                                                                        200]
                                                                    : Colors
                                                                        .white
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            onChanged: (value) {
                                                              setState(() {
                                                                if (value
                                                                    .isNotEmpty)
                                                                  display_list[
                                                                              index]
                                                                          .quantidade_cursos_extensao_cultural =
                                                                      double.parse(
                                                                          value);
                                                                atualizaContainer(
                                                                    index);
                                                                retornar_pontuacoes(
                                                                    index);
                                                                get_salario_ideal(
                                                                    index, "");
                                                              });
                                                            },
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      r'[0-9]')),
                                                            ],
                                                            controller: widget
                                                                    .textEditingCursosExtensaoCultural[
                                                                index],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (display_list_status
                                                                    .asMap()
                                                                    .containsKey(
                                                                        index))
                                                                ? display_list_status[index]
                                                                            .calcula_valor ==
                                                                        false
                                                                    ? Colors.red[
                                                                        200]
                                                                    : Colors
                                                                        .white
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            onChanged: (value) {
                                                              setState(() {
                                                                if (value
                                                                    .isNotEmpty)
                                                                  display_list[
                                                                              index]
                                                                          .quantidade_variaveis =
                                                                      double.parse(
                                                                          value);
                                                                atualizaContainer(
                                                                    index);
                                                                retornar_pontuacoes(
                                                                    index);
                                                                get_salario_ideal(
                                                                    index, "");
                                                              });
                                                            },
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      r'[0-9]')),
                                                            ],
                                                            controller: widget
                                                                    .textEditingVariaveis[
                                                                index],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .blue[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            display_list_cargos
                                                                    .isNotEmpty
                                                                ? display_list_cargos[
                                                                        index]
                                                                    .pontuacaoFormacao
                                                                    .toString()
                                                                    .replaceAll(
                                                                        '.',
                                                                        ',')
                                                                : "...",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (display_list_status
                                                                    .asMap()
                                                                    .containsKey(
                                                                        index))
                                                                ? display_list_status[index]
                                                                            .calcula_valor ==
                                                                        false
                                                                    ? Colors.red[
                                                                        200]
                                                                    : Colors
                                                                        .white
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            onChanged: (value) {
                                                              setState(() {
                                                                if (value
                                                                    .isNotEmpty)
                                                                  display_list[
                                                                              index]
                                                                          .quantidade_livros =
                                                                      double.parse(
                                                                          value);
                                                                atualizaContainer(
                                                                    index);
                                                                retornar_pontuacoes(
                                                                    index);
                                                                get_salario_ideal(
                                                                    index, "");
                                                              });
                                                            },
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      r'[0-9]')),
                                                            ],
                                                            controller: widget
                                                                    .textEditingLivros[
                                                                index],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (display_list_status
                                                                    .asMap()
                                                                    .containsKey(
                                                                        index))
                                                                ? display_list_status[index]
                                                                            .calcula_valor ==
                                                                        false
                                                                    ? Colors.red[
                                                                        200]
                                                                    : Colors
                                                                        .white
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            onChanged: (value) {
                                                              setState(() {
                                                                if (value
                                                                    .isNotEmpty)
                                                                  display_list[
                                                                              index]
                                                                          .quantidade_pesquisas_aprovadas =
                                                                      double.parse(
                                                                          value);
                                                                atualizaContainer(
                                                                    index);
                                                                retornar_pontuacoes(
                                                                    index);
                                                                get_salario_ideal(
                                                                    index, "");
                                                              });
                                                            },
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      r'[0-9]')),
                                                            ],
                                                            controller: widget
                                                                    .textEditingPesquisasRealizadas[
                                                                index],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (display_list_status
                                                                    .asMap()
                                                                    .containsKey(
                                                                        index))
                                                                ? display_list_status[index]
                                                                            .calcula_valor ==
                                                                        false
                                                                    ? Colors.red[
                                                                        200]
                                                                    : Colors
                                                                        .white
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            onChanged: (value) {
                                                              if (value
                                                                  .isNotEmpty)
                                                                display_list[
                                                                            index]
                                                                        .quantidade_professor_universidade_publica =
                                                                    double.parse(
                                                                        value);
                                                              setState(() {
                                                                atualizaContainer(
                                                                    index);
                                                                retornar_pontuacoes(
                                                                    index);
                                                                get_salario_ideal(
                                                                    index, "");
                                                              });
                                                            },
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      r'[0-9]')),
                                                            ],
                                                            controller: widget
                                                                    .textEditingProfessorUniversidadePublica[
                                                                index],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (display_list_status
                                                                    .asMap()
                                                                    .containsKey(
                                                                        index))
                                                                ? display_list_status[index]
                                                                            .calcula_valor ==
                                                                        false
                                                                    ? Colors.red[
                                                                        200]
                                                                    : Colors
                                                                        .white
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            onChanged: (value) {
                                                              setState(() {
                                                                if (value
                                                                    .isNotEmpty)
                                                                  display_list[
                                                                              index]
                                                                          .quantidade_trabalhos_cientificos_revista =
                                                                      double.parse(
                                                                          value);
                                                                atualizaContainer(
                                                                    index);
                                                                retornar_pontuacoes(
                                                                    index);
                                                                get_salario_ideal(
                                                                    index, "");
                                                              });
                                                            },
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      r'[0-9]')),
                                                            ],
                                                            controller: widget
                                                                    .textEditingTrabalhosCientificosPublicados[
                                                                index],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .blue[400],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            display_list_cargos
                                                                    .isNotEmpty
                                                                ? display_list_cargos[
                                                                        index]
                                                                    .pontuacaoExperiencia
                                                                    .toString()
                                                                    .replaceAll(
                                                                        '.',
                                                                        ',')
                                                                : "...",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (display_list_status
                                                                    .asMap()
                                                                    .containsKey(
                                                                        index))
                                                                ? display_list_status[index]
                                                                            .calcula_valor ==
                                                                        false
                                                                    ? Colors.red[
                                                                        200]
                                                                    : Colors
                                                                        .white
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            onChanged: (value) {
                                                              setState(() {
                                                                if (value
                                                                    .isNotEmpty)
                                                                  display_list[
                                                                              index]
                                                                          .quantidade_faltas =
                                                                      double.parse(
                                                                          value);
                                                                atualizaContainer(
                                                                    index);
                                                                retornar_pontuacoes(
                                                                    index);
                                                                get_salario_ideal(
                                                                    index, "");
                                                              });
                                                            },
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      r'[0-9]')),
                                                            ],
                                                            controller: widget
                                                                    .textEditingAssiduidade[
                                                                index],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (display_list_status
                                                                    .asMap()
                                                                    .containsKey(
                                                                        index))
                                                                ? display_list_status[index]
                                                                            .calcula_valor ==
                                                                        false
                                                                    ? Colors.red[
                                                                        200]
                                                                    : Colors
                                                                        .white
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            onChanged: (value) {
                                                              setState(() {
                                                                atualizaContainer(
                                                                    index);
                                                                retornar_pontuacoes(
                                                                    index);
                                                                get_salario_ideal(
                                                                    index, "");
                                                              });
                                                            },
                                                            onTap: () async {
                                                              DateTime? pickerddate = await showDatePicker(
                                                                  context:
                                                                      context,
                                                                  initialDate:
                                                                      DateTime
                                                                          .now(),
                                                                  firstDate:
                                                                      DateTime(
                                                                          1900),
                                                                  lastDate:
                                                                      DateTime
                                                                          .now());
                                                              if (pickerddate !=
                                                                  null) {
                                                                setState(() {
                                                                  atualizaContainer(
                                                                      index);
                                                                  retornar_pontuacoes(
                                                                      index);
                                                                  get_salario_ideal(
                                                                      index,
                                                                      "");
                                                                  display_list[
                                                                              index]
                                                                          .data_admissao =
                                                                      pickerddate;
                                                                  widget
                                                                      .textEditingData[
                                                                          index]
                                                                      .text = DateFormat(
                                                                          "dd/MM/yyyy")
                                                                      .format(
                                                                          pickerddate);
                                                                });
                                                              }
                                                            },
                                                            controller: widget
                                                                    .textEditingData[
                                                                index],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (display_list_status
                                                                    .asMap()
                                                                    .containsKey(
                                                                        index))
                                                                ? display_list_status[index]
                                                                            .calcula_valor ==
                                                                        false
                                                                    ? Colors.red[
                                                                        200]
                                                                    : Colors
                                                                        .white
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            onChanged: (value) {
                                                              setState(() {
                                                                display_list[
                                                                        index]
                                                                    .obs = value;
                                                                atualizaContainer(
                                                                    index);
                                                                retornar_pontuacoes(
                                                                    index);
                                                                get_salario_ideal(
                                                                    index, "");
                                                              });
                                                            },
                                                            controller: widget
                                                                    .textEditingObservacoes[
                                                                index],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (display_list_status
                                                                    .asMap()
                                                                    .containsKey(
                                                                        index))
                                                                ? display_list_status[index]
                                                                            .calcula_valor ==
                                                                        false
                                                                    ? Colors.red[
                                                                        200]
                                                                    : Colors
                                                                        .white
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            onChanged: (value) {
                                                              setState(() {
                                                                display_list[
                                                                            index]
                                                                        .salario_atual =
                                                                    double.parse(
                                                                        value.replaceAll(
                                                                            ',',
                                                                            '.'));
                                                                atualizaContainer(
                                                                    index);
                                                              });
                                                            },
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      r'[0-9]+[,.]{0,1}[0-9]*')),
                                                              TextInputFormatter
                                                                  .withFunction(
                                                                (oldValue,
                                                                        newValue) =>
                                                                    newValue
                                                                        .copyWith(
                                                                  text: newValue
                                                                      .text
                                                                      .replaceAll(
                                                                          '.',
                                                                          ','),
                                                                ),
                                                              ),
                                                            ],
                                                            controller: widget
                                                                    .textEditingSalarios[
                                                                index],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            (display_list_cargos
                                                                    .asMap()
                                                                    .containsKey(
                                                                        index))
                                                                ? display_list_cargos[
                                                                        index]
                                                                    .pontuacao
                                                                    .toString()
                                                                    .replaceAll(
                                                                        '.',
                                                                        ',')
                                                                : "...",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

/*
                              
                                SizedBox(
                                    height: 250,
                                    child: SingleChildScrollView(
                                        controller: _scrollControllerTwo,
                                        child: Column(
                                          children: [
                                            IntrinsicHeight(
                                              child: Container(
                                                key: keyAltura[0],
                                                constraints: BoxConstraints(
                                                    maxHeight: 100),
                                                child: Row(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ValueListenableBuilder(
                                                                  valueListenable:
                                                                      dropValue,
                                                                  builder: (BuildContext
                                                                          context,
                                                                      String
                                                                          value,
                                                                      _) {
                                                                    return DropdownButton<
                                                                        String>(
                                                                      hint: Text(
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                          ),
                                                                          dropOpcoes[0]),
                                                                      value: (value
                                                                              .isEmpty)
                                                                          ? null
                                                                          : value,
                                                                      onChanged:
                                                                          (escolha) {
                                                                        dropValue.value =
                                                                            escolha.toString();
                                                                        setState(
                                                                            () {
                                                                          for (int i = 0;
                                                                              i < 3;
                                                                              i++)
                                                                            if (dropOpcoes[i] ==
                                                                                escolha)
                                                                              setState(() {
                                                                                statusCont = i + 1;
                                                                              });
                                                                        });
                                                                      },
                                                                      items: dropOpcoes
                                                                          .map((op) => DropdownMenuItem(
                                                                                value: op,
                                                                                child: Text(op),
                                                                              ))
                                                                          .toList(),
                                                                    );
                                                                  })
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          constraints:
                                                              BoxConstraints(
                                                                  minHeight:
                                                                      40),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl1[0],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                atualizaContainer(
                                                                    0);
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 300.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl1[1],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl1[2],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[3],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[4],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[5],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[6],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[7],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[8],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[9],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[
                                                                    10],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .blue[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[
                                                                    11],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[
                                                                    12],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[
                                                                    13],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[
                                                                    14],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .blue[400],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[
                                                                    15],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[
                                                                    16],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl1[
                                                                    17],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 8.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "26,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            IntrinsicHeight(
                                              child: Container(
                                                key: keyAltura[1],
                                                constraints: BoxConstraints(
                                                    maxHeight: 100),
                                                child: Row(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ValueListenableBuilder(
                                                                  valueListenable:
                                                                      dropValue,
                                                                  builder: (BuildContext
                                                                          context,
                                                                      String
                                                                          value,
                                                                      _) {
                                                                    return DropdownButton<
                                                                        String>(
                                                                      hint: Text(
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                          ),
                                                                          dropOpcoes[0]),
                                                                      value: (value
                                                                              .isEmpty)
                                                                          ? null
                                                                          : value,
                                                                      onChanged:
                                                                          (escolha) {
                                                                        dropValue.value =
                                                                            escolha.toString();
                                                                        setState(
                                                                            () {
                                                                          for (int i = 0;
                                                                              i < 3;
                                                                              i++)
                                                                            if (dropOpcoes[i] ==
                                                                                escolha)
                                                                              setState(() {
                                                                                statusCont = i + 1;
                                                                              });
                                                                        });
                                                                      },
                                                                      items: dropOpcoes
                                                                          .map((op) => DropdownMenuItem(
                                                                                value: op,
                                                                                child: Text(op),
                                                                              ))
                                                                          .toList(),
                                                                    );
                                                                  })
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          constraints:
                                                              BoxConstraints(
                                                                  minHeight:
                                                                      40),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[0],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                atualizaContainer(
                                                                    1);
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 300.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[1],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[2],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[3],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[4],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[5],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[6],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[7],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[8],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[9],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    10],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .blue[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    11],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    12],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    13],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    14],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .blue[400],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    15],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    16],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    17],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 8.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "26,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            IntrinsicHeight(
                                              child: Container(
                                                key: keyAltura[2],
                                                constraints: BoxConstraints(
                                                    maxHeight: 100),
                                                child: Row(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ValueListenableBuilder(
                                                                  valueListenable:
                                                                      dropValue,
                                                                  builder: (BuildContext
                                                                          context,
                                                                      String
                                                                          value,
                                                                      _) {
                                                                    return DropdownButton<
                                                                        String>(
                                                                      hint: Text(
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                          ),
                                                                          dropOpcoes[0]),
                                                                      value: (value
                                                                              .isEmpty)
                                                                          ? null
                                                                          : value,
                                                                      onChanged:
                                                                          (escolha) {
                                                                        dropValue.value =
                                                                            escolha.toString();
                                                                        setState(
                                                                            () {
                                                                          for (int i = 0;
                                                                              i < 3;
                                                                              i++)
                                                                            if (dropOpcoes[i] ==
                                                                                escolha)
                                                                              setState(() {
                                                                                statusCont = i + 1;
                                                                              });
                                                                        });
                                                                      },
                                                                      items: dropOpcoes
                                                                          .map((op) => DropdownMenuItem(
                                                                                value: op,
                                                                                child: Text(op),
                                                                              ))
                                                                          .toList(),
                                                                    );
                                                                  })
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          constraints:
                                                              BoxConstraints(
                                                                  minHeight:
                                                                      40),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[0],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                atualizaContainer(
                                                                    2);
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 300.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[1],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[2],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[3],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[4],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[5],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[6],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[7],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[8],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[9],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    10],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .blue[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    11],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    12],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    13],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    14],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .blue[400],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    15],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    16],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    17],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 8.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "26,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            IntrinsicHeight(
                                              child: Container(
                                                key: keyAltura[3],
                                                constraints: BoxConstraints(
                                                    maxHeight: 100),
                                                child: Row(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ValueListenableBuilder(
                                                                  valueListenable:
                                                                      dropValue,
                                                                  builder: (BuildContext
                                                                          context,
                                                                      String
                                                                          value,
                                                                      _) {
                                                                    return DropdownButton<
                                                                        String>(
                                                                      hint: Text(
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                          ),
                                                                          dropOpcoes[0]),
                                                                      value: (value
                                                                              .isEmpty)
                                                                          ? null
                                                                          : value,
                                                                      onChanged:
                                                                          (escolha) {
                                                                        dropValue.value =
                                                                            escolha.toString();
                                                                        setState(
                                                                            () {
                                                                          for (int i = 0;
                                                                              i < 3;
                                                                              i++)
                                                                            if (dropOpcoes[i] ==
                                                                                escolha)
                                                                              setState(() {
                                                                                statusCont = i + 1;
                                                                              });
                                                                        });
                                                                      },
                                                                      items: dropOpcoes
                                                                          .map((op) => DropdownMenuItem(
                                                                                value: op,
                                                                                child: Text(op),
                                                                              ))
                                                                          .toList(),
                                                                    );
                                                                  })
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          constraints:
                                                              BoxConstraints(
                                                                  minHeight:
                                                                      40),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[0],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                atualizaContainer(
                                                                    3);
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 300.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[1],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[2],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[3],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[4],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[5],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[6],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[7],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[8],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[9],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    10],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .blue[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    11],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    12],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    13],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    14],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .blue[400],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    15],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    16],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    17],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 8.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "26,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            IntrinsicHeight(
                                              child: Container(
                                                key: keyAltura[4],
                                                constraints: BoxConstraints(
                                                    maxHeight: 100),
                                                child: Row(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ValueListenableBuilder(
                                                                  valueListenable:
                                                                      dropValue,
                                                                  builder: (BuildContext
                                                                          context,
                                                                      String
                                                                          value,
                                                                      _) {
                                                                    return DropdownButton<
                                                                        String>(
                                                                      hint: Text(
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                          ),
                                                                          dropOpcoes[0]),
                                                                      value: (value
                                                                              .isEmpty)
                                                                          ? null
                                                                          : value,
                                                                      onChanged:
                                                                          (escolha) {
                                                                        dropValue.value =
                                                                            escolha.toString();
                                                                        setState(
                                                                            () {
                                                                          for (int i = 0;
                                                                              i < 3;
                                                                              i++)
                                                                            if (dropOpcoes[i] ==
                                                                                escolha)
                                                                              setState(() {
                                                                                statusCont = i + 1;
                                                                              });
                                                                        });
                                                                      },
                                                                      items: dropOpcoes
                                                                          .map((op) => DropdownMenuItem(
                                                                                value: op,
                                                                                child: Text(op),
                                                                              ))
                                                                          .toList(),
                                                                    );
                                                                  })
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          constraints:
                                                              BoxConstraints(
                                                                  minHeight:
                                                                      40),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[0],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                atualizaContainer(
                                                                    4);
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 300.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[1],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[2],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[3],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[4],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[5],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[6],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[7],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[8],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[9],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    10],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .blue[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    11],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    12],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    13],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    14],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .blue[400],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    15],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    16],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    17],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 8.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "26,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            IntrinsicHeight(
                                              child: Container(
                                                key: keyAltura[5],
                                                constraints: BoxConstraints(
                                                    maxHeight: 100),
                                                child: Row(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ValueListenableBuilder(
                                                                  valueListenable:
                                                                      dropValue,
                                                                  builder: (BuildContext
                                                                          context,
                                                                      String
                                                                          value,
                                                                      _) {
                                                                    return DropdownButton<
                                                                        String>(
                                                                      hint: Text(
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                          ),
                                                                          dropOpcoes[0]),
                                                                      value: (value
                                                                              .isEmpty)
                                                                          ? null
                                                                          : value,
                                                                      onChanged:
                                                                          (escolha) {
                                                                        dropValue.value =
                                                                            escolha.toString();
                                                                        setState(
                                                                            () {
                                                                          for (int i = 0;
                                                                              i < 3;
                                                                              i++)
                                                                            if (dropOpcoes[i] ==
                                                                                escolha)
                                                                              setState(() {
                                                                                statusCont = i + 1;
                                                                              });
                                                                        });
                                                                      },
                                                                      items: dropOpcoes
                                                                          .map((op) => DropdownMenuItem(
                                                                                value: op,
                                                                                child: Text(op),
                                                                              ))
                                                                          .toList(),
                                                                    );
                                                                  })
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          constraints:
                                                              BoxConstraints(
                                                                  minHeight:
                                                                      40),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[0],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                atualizaContainer(
                                                                    5);
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 300.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[1],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[2],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[3],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[4],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[5],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[6],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[7],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[8],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[9],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    10],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .blue[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    11],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    12],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    13],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    14],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .blue[400],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    15],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    16],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    17],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 8.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "26,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            IntrinsicHeight(
                                              child: Container(
                                                key: keyAltura[6],
                                                constraints: BoxConstraints(
                                                    maxHeight: 100),
                                                child: Row(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ValueListenableBuilder(
                                                                  valueListenable:
                                                                      dropValue,
                                                                  builder: (BuildContext
                                                                          context,
                                                                      String
                                                                          value,
                                                                      _) {
                                                                    return DropdownButton<
                                                                        String>(
                                                                      hint: Text(
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                          ),
                                                                          dropOpcoes[0]),
                                                                      value: (value
                                                                              .isEmpty)
                                                                          ? null
                                                                          : value,
                                                                      onChanged:
                                                                          (escolha) {
                                                                        dropValue.value =
                                                                            escolha.toString();
                                                                        setState(
                                                                            () {
                                                                          for (int i = 0;
                                                                              i < 3;
                                                                              i++)
                                                                            if (dropOpcoes[i] ==
                                                                                escolha)
                                                                              setState(() {
                                                                                statusCont = i + 1;
                                                                              });
                                                                        });
                                                                      },
                                                                      items: dropOpcoes
                                                                          .map((op) => DropdownMenuItem(
                                                                                value: op,
                                                                                child: Text(op),
                                                                              ))
                                                                          .toList(),
                                                                    );
                                                                  })
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          constraints:
                                                              BoxConstraints(
                                                                  minHeight:
                                                                      40),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[0],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                atualizaContainer(
                                                                    6);
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 300.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[1],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller:
                                                                controllerl2[2],
                                                            maxLines: null,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[3],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[4],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[5],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[6],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[7],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[8],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[9],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    10],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .blue[300],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    11],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    12],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    13],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    14],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .blue[400],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "0,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    15],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    16],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 209,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: statusCont ==
                                                                    2
                                                                ? Colors
                                                                    .red[200]
                                                                : Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: TextField(
                                                            controller:
                                                                controllerl2[
                                                                    17],
                                                            maxLines: null,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 8.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 104.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Text(
                                                            "26,00",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )))*/
                                ////////////////////
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 22,
                          ),
                          BotaoNovofuncionario(),
                          const SizedBox(
                            width: 18,
                          ),
                          BotaoPlanilha(
                            instituicao: widget.instituicao,
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          BotaoStatus(),
                          const SizedBox(
                            width: 18,
                          ),
                          BotaoSalvar()
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: ind == 0 ? 10 : 5,
                            height: ind == 0 ? 10 : 5,
                            margin: EdgeInsets.symmetric(
                                horizontal: mediaQuery.width * 0.01),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color:
                                    ind == 0 ? Colors.blue : Colors.grey[300]),
                            child: OutlinedButton(
                              onPressed: () {
                                scrollTo(0);
                              },
                              child: Text("teste"),
                            )),
                        Container(
                            width: ind == 1 ? 10 : 5,
                            height: ind == 1 ? 10 : 5,
                            margin: EdgeInsets.symmetric(
                                horizontal: mediaQuery.width * 0.01),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color:
                                    ind == 1 ? Colors.blue : Colors.grey[300]),
                            child: OutlinedButton(
                              onPressed: () {
                                scrollTo(1);
                              },
                              child: Text("teste"),
                            )),
                        Container(
                            width: ind == 2 ? 10 : 5,
                            height: ind == 2 ? 10 : 5,
                            margin: EdgeInsets.symmetric(
                                horizontal: mediaQuery.width * 0.01),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color:
                                    ind == 2 ? Colors.blue : Colors.grey[300]),
                            child: OutlinedButton(
                              onPressed: () {
                                scrollTo(2);
                              },
                              child: Text("teste"),
                            )),
                        Container(
                            width: ind == 3 ? 10 : 5,
                            height: ind == 3 ? 10 : 5,
                            margin: EdgeInsets.symmetric(
                                horizontal: mediaQuery.width * 0.01),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color:
                                    ind == 3 ? Colors.blue : Colors.grey[300]),
                            child: OutlinedButton(
                              onPressed: () {
                                scrollTo(3);
                              },
                              child: Text("teste"),
                            )),
                        Container(
                            width: ind == 4 ? 10 : 5,
                            height: ind == 4 ? 10 : 5,
                            margin: EdgeInsets.symmetric(
                                horizontal: mediaQuery.width * 0.01),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color:
                                    ind == 4 ? Colors.blue : Colors.grey[300]),
                            child: OutlinedButton(
                              onPressed: () {
                                scrollTo(4);
                              },
                              child: Text("teste"),
                            ))
                      ],
                    )
                  ]),
            ),
          ],
        ),
      );
    });
  }
}

class Professores extends StatefulWidget {
  List<int> adicionados = [];
  List<int> deletados = [];
  String instituicao;
  List<Size> sizeAlturas;
  List<GlobalKey> keysAltura;
  List<GlobalKey> keysAlturaX;
  bool verificador_nome = false;
  bool verificar = false;
  List<Cargo> cargos_antigo;
  double valor;
  List<TextEditingController> textEditingMatriculas;
  List<TextEditingController> textEditingNomes;
  List<TextEditingController> textEditingAprovacaoConcursoPublico;
  List<TextEditingController> textEditingCreditosPosGraduacao;
  List<TextEditingController> textEditingCursosAperfeicoamento;
  List<TextEditingController> textEditingOutrosCursos;
  List<TextEditingController> textEditingCursosExtensaoCultural;
  List<TextEditingController> textEditingVariaveis;
  List<TextEditingController> textEditingLivros;
  List<TextEditingController> textEditingPesquisasRealizadas;
  List<TextEditingController> textEditingProfessorUniversidadePublica;
  List<TextEditingController> textEditingTrabalhosCientificosPublicados;
  List<TextEditingController> textEditingAssiduidade;
  List<TextEditingController> textEditingData;
  List<TextEditingController> textEditingObservacoes;
  List<TextEditingController> textEditingSalarios;
  List<Cargo> cargos_usuarios;
  List<SituacaoAdmissional> situacoes_usuarios;
  List<Cargo> cargos;
  List<SituacaoAdmissional> situacoes;
  List<Usuario> usuarios;
  Professores(
      {Key? key,
      required this.instituicao,
      required this.sizeAlturas,
      required this.valor,
      required this.usuarios,
      required this.textEditingMatriculas,
      required this.textEditingNomes,
      required this.textEditingAprovacaoConcursoPublico,
      required this.textEditingCreditosPosGraduacao,
      required this.textEditingCursosAperfeicoamento,
      required this.textEditingOutrosCursos,
      required this.textEditingCursosExtensaoCultural,
      required this.textEditingVariaveis,
      required this.textEditingLivros,
      required this.textEditingPesquisasRealizadas,
      required this.textEditingProfessorUniversidadePublica,
      required this.textEditingTrabalhosCientificosPublicados,
      required this.textEditingAssiduidade,
      required this.textEditingData,
      required this.textEditingObservacoes,
      required this.textEditingSalarios,
      required this.cargos_usuarios,
      required this.situacoes_usuarios,
      required this.cargos,
      required this.situacoes,
      required this.cargos_antigo,
      required this.keysAltura,
      required this.keysAlturaX})
      : super(key: key);
  @override
  @override
  State<StatefulWidget> createState() {
    return _ProfessoresState(this.valor);
  }
}

class TitleProfessores extends StatelessWidget {
  double tamanho;
  TitleProfessores({Key? key, required this.tamanho}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: tamanho,
      child: const AutoSizeText(
        "Dados dos funcionários",
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.blue,
          fontSize: 30.0,
          fontWeight: FontWeight.w900,
          fontFamily: 'Santana',
        ),
      ),
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
        paginaS = 0;
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
