import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AutoSizeText(
      "Login",
      maxLines: 2,
      style: TextStyle(
        color: Colors.black,
        fontSize: 40.0,
        fontWeight: FontWeight.w900,
        fontFamily: 'Santana',
      ),
    ),
    SizedBox(height: 15,),
        SizedBox(width:300,
        
        child:TextField(
          decoration: InputDecoration(
            hintText: 'E-mail',
            fillColor: Colors.grey.shade200,
            filled: true,
            labelStyle: TextStyle(fontSize: 12),
            contentPadding: EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(15)),
          ),
        ),
        ),
        
        SizedBox(height:15,),
        SizedBox(width: 300,child:TextField(
          decoration: InputDecoration(
            hintText: 'Password',
            counterText:'Esqueci minha senha',
            counterStyle: TextStyle(color: Colors.blue),
            suffixIcon: Icon(Icons.visibility_off_outlined,color:Colors.grey),
            fillColor: Colors.grey.shade200,
            filled: true,
            labelStyle: TextStyle(fontSize: 12),
            contentPadding: EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(15)),
          ),
        ),),
        SizedBox(height: 15,),
        Container(
      alignment: Alignment.center,
      width: 300.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              // fontWeight: FontWeight.bold,
            ),
          ),
          Icon(Icons.navigate_next_rounded,
              color: Colors.black, size: 30.0),
        ],
      ),
    ),
        
      ],
    );
  }
}
