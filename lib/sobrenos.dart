// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MySN extends StatefulWidget {
  const MySN({super.key});

  @override
  State<MySN> createState() => _MySNState();
}

class _MySNState extends State<MySN> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // IMAGEM DE FUNDO
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Images/fundo.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // TELA BRANCA NA FRENTE DA IMAGEM
          Center(
            child: Container(
              height: screenHeight * 0.90,
              width: screenWidth * 0.95,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.96,
            width: screenWidth,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      Text(
                        'SOBRE NÓS',
                        style: TextStyle(
                          fontSize: screenWidth * 0.1,
                          fontFamily: 'Anta',
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'Eduardo, Enzo, Matheus e Gustavo eram amigos que compartilhavam um interesse em causas sociais. Certo dia, discutindo sobre como poderiam contribuir de maneira significativa, surgiu a ideia de criar um portal de ONGs...',
                              style: TextStyle(
                                fontSize: screenWidth * 0.05,
                                fontFamily: 'Anta',
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/Gusta.jpg'),
                            radius: screenWidth * 0.15,
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/Graca.jpg'),
                            radius: screenWidth * 0.15,
                          ),
                          Expanded(
                            child: Text(
                              'Com determinação e trabalho em equipe, o projeto começou a tomar forma. Eduardo desenvolveu a estrutura técnica do portal, enquanto Enzo criava uma interface amigável e atraente...',
                              style: TextStyle(
                                fontSize: screenWidth * 0.05,
                                fontFamily: 'Anta',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'Após meses de dedicação, o portal de ONGs estava pronto para ser lançado. Com grande expectativa, eles compartilharam a plataforma com o mundo...',
                              style: TextStyle(
                                fontSize: screenWidth * 0.05,
                                fontFamily: 'Anta',
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/Lucco.JPG'),
                            radius: screenWidth * 0.15,
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/Edu.JPEG'),
                        radius: screenWidth * 0.25,
                      ),
                      SizedBox(height: screenHeight * 0.1),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // BANNER DO APP
          Center(
            child: Column(
              children: [
                FractionallySizedBox(
                  widthFactor: 0.95,
                  child: SizedBox(
                    height: screenHeight * 0.15,
                    child: Image.asset(
                      'assets/Images/logo.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 1.0,
            left: 1.0,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 1, 37, 54),
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
