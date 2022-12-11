import 'package:flutter/material.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Cargo.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/SituacaoAdmissional.dart';
import 'package:gip_solucoes/screens/home_screen/components/model/Usuario.dart';
import 'package:gip_solucoes/screens/home_screen/components/view/content/professores_content.dart';
import 'package:intl/intl.dart';

class DesktopProfessores extends StatefulWidget {
  List<Usuario> usuarios;
  List<Cargo> cargos_antigo;
  List<Cargo> cargos_antigo_final=[];
  List<Size> sizeAlturas = [];
  List<GlobalKey> keysAltura = [];
  List<GlobalKey> keysAlturaX = [];
  List<TextEditingController> textEditingMatriculas = [];
  List<TextEditingController> textEditingNomes = [];
  List<TextEditingController> textEditingAprovacaoConcursoPublico = [];
  List<TextEditingController> textEditingCreditosPosGraduacao = [];
  List<TextEditingController> textEditingCursosAperfeicoamento = [];
  List<TextEditingController> textEditingOutrosCursos = [];
  List<TextEditingController> textEditingCursosExtensaoCultural = [];
  List<TextEditingController> textEditingVariaveis = [];
  List<TextEditingController> textEditingLivros = [];
  List<TextEditingController> textEditingPesquisasRealizadas = [];
  List<TextEditingController> textEditingProfessorUniversidadePublica = [];
  List<TextEditingController> textEditingTrabalhosCientificosPublicados = [];
  List<TextEditingController> textEditingAssiduidade = [];
  List<TextEditingController> textEditingData = [];
  List<TextEditingController> textEditingObservacoes = [];
  List<TextEditingController> textEditingSalario = [];
  List<Cargo> cargos_usuarios;
  List<Cargo> cargos_usuarios_final = [];
  List<SituacaoAdmissional> situacoes_usuarios;
  List<SituacaoAdmissional> situacoes_usuarios_final=[];
  List<Cargo> cargos;
  List<SituacaoAdmissional> situacoes;
  String instituicao;
  DesktopProfessores(
      {Key? key,
      required this.usuarios,
      required this.cargos_usuarios,
      required this.situacoes_usuarios,
      required this.cargos,
      required this.situacoes,
      required this.cargos_antigo,
      required this.instituicao})
      : super(key: key);

  @override
  State<DesktopProfessores> createState() {
    return _StateDesktopProfessores();
  }
}

class _StateDesktopProfessores extends State<DesktopProfessores> {
  @override
  Widget build(BuildContext context) {
    widget.usuarios.forEach((element) {
      widget.cargos_usuarios.forEach((elementt) {
        if (element.id_usuario == elementt.usuario_id) {
          setState(() {
            widget.cargos_usuarios_final.add(elementt);
          });
        }
      });
      widget.cargos_antigo.forEach((elementt) {
        if (element.id_usuario == elementt.usuario_id) {
          setState(() {
            widget.cargos_antigo_final.add(elementt);
          });
        }
      });
      widget.situacoes_usuarios.forEach((elementt) {
        if (element.id_usuario == elementt.id_usuario) {
          setState(() {
            widget.situacoes_usuarios_final.add(elementt);
          });
        }
      });
      widget.sizeAlturas.add(Size(0, 49));
      widget.keysAltura.add(GlobalKey());
      widget.keysAlturaX.add(GlobalKey());
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
      widget.textEditingVariaveis.add(
          TextEditingController(text: element.quantidade_variaveis.toString()));
      widget.textEditingLivros.add(
          TextEditingController(text: element.quantidade_livros.toString()));
      widget.textEditingPesquisasRealizadas.add(TextEditingController(
          text: element.quantidade_pesquisas_aprovadas.toString()));
      widget.textEditingProfessorUniversidadePublica.add(TextEditingController(
          text: element.quantidade_professor_universidade_publica.toString()));
      widget.textEditingTrabalhosCientificosPublicados.add(
          TextEditingController(
              text:
                  element.quantidade_trabalhos_cientificos_revista.toString()));
      widget.textEditingAssiduidade.add(
          TextEditingController(text: element.quantidade_faltas.toString()));
          widget.textEditingSalario.add(
          TextEditingController(text: element.salario_atual.toString().replaceAll('.', ',')));
      widget.textEditingData.add(TextEditingController(
          text: DateFormat("dd/MM/yyyy").format(element.data_admissao)));
      widget.textEditingObservacoes
          .add(TextEditingController(text: element.obs));
    });
    int ind = 1;
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.175),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(width: 5),
                TitleProfessores(tamanho: mediaQuery.width * 0.5),
              ],
            ),
            Professores(
              key: keyProfessores,
              instituicao: widget.instituicao,
              sizeAlturas: widget.sizeAlturas,
              cargos_antigo: widget.cargos_antigo_final,
              valor: 0.63,
              usuarios: widget.usuarios,
              textEditingAprovacaoConcursoPublico:
                  widget.textEditingAprovacaoConcursoPublico,
                 textEditingSalarios:widget.textEditingSalario,
              textEditingAssiduidade: widget.textEditingAssiduidade,
              textEditingCreditosPosGraduacao:
                  widget.textEditingCreditosPosGraduacao,
              textEditingCursosAperfeicoamento:
                  widget.textEditingCursosAperfeicoamento,
              textEditingCursosExtensaoCultural:
                  widget.textEditingCursosExtensaoCultural,
              textEditingData: widget.textEditingData,
              textEditingLivros: widget.textEditingLivros,
              textEditingMatriculas: widget.textEditingMatriculas,
              textEditingNomes: widget.textEditingNomes,
              textEditingObservacoes: widget.textEditingObservacoes,
              textEditingOutrosCursos: widget.textEditingOutrosCursos,
              textEditingPesquisasRealizadas:
                  widget.textEditingPesquisasRealizadas,
              textEditingProfessorUniversidadePublica:
                  widget.textEditingProfessorUniversidadePublica,
              textEditingTrabalhosCientificosPublicados:
                  widget.textEditingTrabalhosCientificosPublicados,
              textEditingVariaveis: widget.textEditingVariaveis,
              cargos: widget.cargos,
              cargos_usuarios: widget.cargos_usuarios_final,
              situacoes: widget.situacoes,
              situacoes_usuarios: widget.situacoes_usuarios_final,
              keysAltura: widget.keysAltura,
              keysAlturaX: widget.keysAlturaX,
            ),
            SizedBox(
              height: 17,
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
