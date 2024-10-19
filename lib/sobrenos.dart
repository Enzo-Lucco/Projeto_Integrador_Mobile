// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MySN extends StatefulWidget {
  const MySN({super.key});

  @override
  State<MySN> createState() => _MySNState();
}

class _MySNState extends State<MySN> {
  final imgGusta = CircleAvatar(
    backgroundImage: AssetImage('assets/images/Gusta.jpg'),
    radius: 150,
  );

  final imgEdu = CircleAvatar(
    backgroundImage: AssetImage('assets/images/Edu.JPEG'),
    radius: 250,
  );

  final imgGraca = CircleAvatar(
    backgroundImage: AssetImage('assets/images/Graca.jpg'),
    radius: 150,
  );

  final imgEnzo = CircleAvatar(
    backgroundImage: AssetImage('assets/images/Lucco.JPG'),
    radius: 150,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //IMAGEM DE FUNDO
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Images/fundo.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          //TELA BRANCA NA FRENTE DA IMAGEM
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.90,
              width: MediaQuery.of(context).size.width * 0.95,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ),

          Container(
            height: MediaQuery.of(context).size.height * 0.96,
            width: MediaQuery.of(context).size.width * 1,
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.all(50),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 150,
                          ),
                          Text(
                            'SOBRE NÓS',
                            style: TextStyle(fontSize: 60, fontFamily: 'Anta'),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Text(
                                'Eduardo, Enzo, Matheus e Gustavo eram amigos que compartilhavam um interesse em causas sociais. Certo dia, discutindo sobre como poderiam contribuir de maneira significativa, surgiu a ideia de criar um portal de ONGs. Cada um deles trouxe suas habilidades únicas para o projeto: Eduardo, com sua experiência técnica; Enzo, com talento para design; Matheus, com habilidades em marketing; e Gustavo, com sua visão inspiradora. Juntos, eles começaram a trabalhar na plataforma, almejando conectar pessoas com organizações que precisavam de apoio.',
                                style:
                                    TextStyle(fontSize: 30, fontFamily: 'Anta'),
                              )),
                              imgGusta,
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              imgGraca,
                              Expanded(
                                  child: Text(
                                'Com determinação e trabalho em equipe, o projeto começou a tomar forma. Eduardo desenvolveu a estrutura técnica do portal, enquanto Enzo criava uma interface amigável e atraente. Matheus focava em estratégias de divulgação para atrair usuários, e Gustavo garantia que a missão do portal estivesse clara e inspiradora. À medida que o trabalho progredia, o entusiasmo do grupo crescia.',
                                style:
                                    TextStyle(fontSize: 30, fontFamily: 'Anta'),
                                    
                              )),
                              
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Text(
                                'Após meses de dedicação, o portal de ONGs estava pronto para ser lançado. Com grande expectativa, eles compartilharam a plataforma com o mundo. O portal logo se tornou um sucesso, conectando pessoas com ONGs de maneira simples e eficaz. Eduardo, Enzo, Matheus e Gustavo sentiram-se orgulhosos de seu trabalho em equipe, sabendo que haviam criado algo que realmente fazia a diferença na vida das pessoas.',
                                style:
                                    TextStyle(fontSize: 30, fontFamily: 'Anta'),
                              )),
                              imgEnzo,
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),

                          imgEdu,
                          SizedBox(
                            height: 150,
                          ),
                          SizedBox(
                          width: 150,
                           height: 50,
                          child: ElevatedButton(
                        onPressed: () {
                          print(
                              "VOCÊ SERÁ ENCAMINHADO PARA A TELA INICIAL");
                        },
                        child: Text("Voltar"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 1, 37, 54),
                          foregroundColor: Colors.white,
                        ),
                      ),),
                        ],
                      )),
                )),
          ),

          //BANNER DO APP
          Center(
            child: Column(
              children: [
                FractionallySizedBox(
                  widthFactor: 0.95,
                  child: Container(
                    height: 150,
                    child: Image.asset(
                      'assets/Images/logo.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
