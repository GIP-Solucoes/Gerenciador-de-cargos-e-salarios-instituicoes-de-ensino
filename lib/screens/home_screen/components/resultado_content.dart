import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:starbucks_landing_page/screens/home_screen/components/name_color.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:my_portfolio/models/name_color.dart';

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
class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0,
      height: 45.0,
      child: TextField(
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(Icons.search, color: Colors.black, size: 20.0),
          hintText: 'Pesquisar...',
          alignLabelWithHint: true,
          hintStyle: const TextStyle(
            color: Colors.black87,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}

class Resultados extends StatelessWidget {
  Resultados({
    Key? key,
  }) : super(key: key);
  /*final whatIDo = [
    NameIconColor(
      title: "Meu cargo",
      iconData: Icons.business_center, //assigment_indbusiness center
      color: Colors.blue[600]!,
    ),
    NameIconColor(
      title: "Resultado",
      iconData: Icons.trending_up,
      color: Colors.blue[600]!,
    ),
    NameIconColor(
      title: "Dados dos cargos",
      iconData: Icons.assignment_outlined,
      color: Colors.blue[600]!,
    ),
    NameIconColor(
      title: "Dados dos funcionários",
      iconData: Icons.file_copy, //file copy
      color: Colors.blue[600]!,
    ),
    NameIconColor(
      title: "Pontuação",
      iconData: Icons.insert_chart,
      color: Colors.blue[600]!,
    ),
    NameIconColor(
      title: "Simulador",
      iconData: Icons.play_circle,
      color: Colors.blue[600]!,
    ),
  ];*/
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: 400,
      width: 1000,
      //margin: const EdgeInsets.all(20),
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
            vertical: 10.0, horizontal: mediaQuery.width * 0.01),
            child:
              Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    SizedBox(
                width: 209,
                //height: 300,
              ),
                Container(
                width: 2,
                height: 55,
                color: Colors.grey[400]
              ),
                  ],),
                  
              
              SizedBox(
      width: 350.0,
      height: 45.0,
      child: TextField(
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
          prefixIcon: const Icon(Icons.search, color: Colors.black, size: 20.0),
          hintText: 'Pesquisar...',
          alignLabelWithHint: true,
          hintStyle: const TextStyle(
            color: Colors.black87,
            fontSize: 18.0,
          ),
        ),
      ),
    ),
              ],),
              Row(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Row(children: [
                    Container(
      alignment: Alignment.center,
      width: 209.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.blue[200],
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        //Row(
        
        //children: [
          Text(
            "Salario Total - Atual",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
            ),
          ),         
        //],
      //),
      ],),
    ),
    Container(
        
                width: 2,
                height: 42,
                color: Colors.grey[400]
              ),
                  ],),
                  Row(children: [
                    Container(
      alignment: Alignment.center,
      width: 209.0,
      height: 82.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        //Row(
        
        //children: [
          Text(
            "R\$ XXXXX,XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              //fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
            ),
          ),         
        //],
      //),
      ],),
    ),
    Container(
        
                width: 2,
                height: 86,
                color: Colors.grey[400]
              ),
                  ],),
                  Row(children: [
                    Container(
      alignment: Alignment.center,
      width: 209.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.blue[200],
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        //Row(
        
        //children: [
          Text(
            "Salario Total - Ideal",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
            ),
          ),         
        //],
      //),
      ],),
    ),
    Container(
        
                width: 2,
                height: 42,
                color: Colors.grey[400]
              ),
                  ],),
                  Row(children: [
                    Container(
      alignment: Alignment.center,
      width: 209.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        //Row(
        
        //children: [
          Text(
            "R\$ XXXXX,XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              //fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
            ),
          ),         
        //],
      //),
      ],),
    ),
    Container(
        
                width: 2,
                height: 42,
                color: Colors.grey[400]
              ),
                  ],),
                  Row(children: [
                    Container(
      alignment: Alignment.center,
      width: 209.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.blue[200],
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        //Row(
        
        //children: [
          Text(
            "% - Impacto",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
            ),
          ),         
        //],
      //),
      ],),
    ),
    Container(
        
                width: 2,
                height: 42,
                color: Colors.grey[400]
              ),
                  ],),
                  Row(children: [
                    Container(
      alignment: Alignment.center,
      width: 69.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        //Row(
        
        //children: [
          Text(
            "XX,XX%",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              //fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
            ),
          ),         
        //],
      //),
      ],),
    ),
    SizedBox(
      width: 2,
    ),
    Container(
      alignment: Alignment.center,
      width: 138.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        //Row(
        
        //children: [
          Text(
            "R\$ XXXX,XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              //fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
            ),
          ),         
        //],
      //),
      ],),
    ),
    
    Container(
        
                width: 2,
                height: 42,
                color: Colors.grey[400]
              ),
                  ],),
                  
                ],),
                //Column(children: [
                  SizedBox(
                  width: (mediaQuery.width*0.63)-211,
                  //height: 40,
                  child:SingleChildScrollView(
            
            //padding: EdgeInsets.symmetric(
            //vertical: 10.0, horizontal: mediaQuery.width * 0.1),
      scrollDirection: Axis.horizontal,
      child: /*Row(
        children: [
        Text("Teste"),
        Text("Teste"),
        Text("Teste"),
        Text("Teste"),
        Text("Teste"),
        Text("Teste"),Text("Teste"),
        Text("Teste"),
        Text("Teste"),
        Text("Teste"),
        Text("Teste"),
        Text("Teste"),
        Text("Teste"),
        Text("Teste"),
        Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),
        Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),
        Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),
        Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),
        Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),
        Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),
        Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),Text("Teste"),
      ],)*/
      Column(children: [
        Row(children: [
          SizedBox(height: 1,)
        ],),
        Row(
        children: [
        
    Container(
      alignment: Alignment.center,
      width: 104.5,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Status",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
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
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Matrícula",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
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
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Nome Funcionário",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
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
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Título",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
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
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Aprovação em\nconcurso público",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 8.0,
              fontWeight: FontWeight.bold,
              
              // fontWeight: FontWeight.bold,
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
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "Créditos de pós-\ngraduação",
            style: TextStyle(
              color: Colors.black,
              fontSize: 8.0,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
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
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "Cursos de\naperfeiçoamento",
            style: TextStyle(
              color: Colors.black,
              fontSize: 8.0,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
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
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "Outros cursos de\ngraduação",
            style: TextStyle(
              color: Colors.black,
              fontSize: 8.0,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
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
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "Cursos de extensão\ncultural",
            style: TextStyle(
              color: Colors.black,
              fontSize: 8.0,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
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
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "Variáveis",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
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
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "Livros publicados",
            style: TextStyle(
              color: Colors.black,
              fontSize: 8.0,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
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
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "Realização de\npesquisas",
            style: TextStyle(
              color: Colors.black,
              fontSize: 8.0,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
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
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "Professor de\nuniversidade pública",
            style: TextStyle(
              color: Colors.black,
              fontSize: 8.0,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
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
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "Trabalhos científicos",
            style: TextStyle(
              color: Colors.black,
              fontSize: 8.0,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
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
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "Assiduidade",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
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
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "Tempo de empresa",
            style: TextStyle(
              color: Colors.black,
              fontSize: 8.0,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
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
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "Pontos",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
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
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "Cargo",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
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
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "Faixa Salarial",
            style: TextStyle(
              color: Colors.black,
              fontSize: 8.0,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
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
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "Salário Atual",
            style: TextStyle(
              color: Colors.black,
              fontSize: 8.0,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
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
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "Salário Ideal",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
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
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "Reajuste %",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
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
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "Impacto Atual",
            style: TextStyle(
              color: Colors.black,
              fontSize: 8.0,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
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
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "Impacto Financeiro",
            style: TextStyle(
              color: Colors.black,
              fontSize: 8.0,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
    
      ],),
      SizedBox(
        height: 2,
      ),
      SizedBox(
                  height: 250,
                  child:     SingleChildScrollView(
        child:Column(children: [
          Row(
        children: [
        
    Container(
      alignment: Alignment.center,
      width: 104.5,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Ativo",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XXXXX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XXXXX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XX",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    ),
    
      ],),
      SizedBox(height:2),
      Row(
        children: [
        
    Container(
      alignment: Alignment.center,
      width: 104.5,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Inativo",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XXXXX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XXXXX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XX",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    ),
    
      ],),
      SizedBox(height:2),
      Row(
        children: [
        
    Container(
      alignment: Alignment.center,
      width: 104.5,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Ativo",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XXXXX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XXXXX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XX",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    ),
    
      ],),
      SizedBox(height:2),
      Row(
        children: [
        
    Container(
      alignment: Alignment.center,
      width: 104.5,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Inativo",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XXXXX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XXXXX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XX",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    ),
    
      ],),
      SizedBox(height:2),
      Row(
        children: [
        
    Container(
      alignment: Alignment.center,
      width: 104.5,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Ativo",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XXXXX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XXXXX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XX",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    ),
    
      ],),
      SizedBox(height:2),
      Row(
        children: [
        
    Container(
      alignment: Alignment.center,
      width: 104.5,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Inativo",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XXXXX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XXXXX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XX",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    ),
    
      ],),
      SizedBox(height:2),
      Row(
        children: [
        
    Container(
      alignment: Alignment.center,
      width: 104.5,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Ativo",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XXXXX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XXXXX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "XX",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            "XX",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    ),
    
      ],),
        ],)
      )
              )
      ],),
      
      ),
                  //height: double.infinity,
                ),
              //  ],)
              //Row(children: [
                //Row(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  //children: [
                  
                //],//)
                
                
              //],)
    
    
              ],)
              
            ]
              
          ),
            ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),

    );
  }
}

class TitleResultado extends StatelessWidget {
  TitleResultado({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AutoSizeText(
      "Resultado",
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

class BotaoVoltar extends StatelessWidget {
  BotaoVoltar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              // fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}


/**/