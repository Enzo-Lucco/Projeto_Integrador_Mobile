import 'package:flutter/material.dart';

class MyTela extends StatefulWidget {
  const MyTela({super.key});

  @override
  State<MyTela> createState() => _MyTelaState();
}

class _MyTelaState extends State<MyTela> {
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
                  image: AssetImage("assets/images/fundo.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          //TELA BRANCA NA FRENTE DA IMAGEM
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.90,
              width: MediaQuery.of(context).size.width * 0.90,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ),
          //BANNER DO APP
          Center(
            child: Column(
              children: [
                SizedBox(height: 30),
                FractionallySizedBox(
                  widthFactor: 0.90,
                  child: Container(
                    height: 150,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //TEXTOS
          Center(
            child: Column(
              children: [
                SizedBox(height: 200),
                Text(
                  "PORTAL DAS ONG'S",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text("Seja Bem-Vindo!", style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          //BOTÃO SOBRE NÓS
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 255,
                ),
                SizedBox(
                  width: 90,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      print("VOCÊ SERÁ ENCAMINHADO PARA A TELA SOBRE NÓS!");
                    },
                    child: Text(
                      "Sobre Nós",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 1, 37, 54),
                      padding: EdgeInsets.zero,
                      side: BorderSide.none,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
          ),

          //PARTE DOS BOTÕES
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          print(
                              "VOCÊ SERÁ ENCAMINHADO PARA A TELA DE CADASTRO!");
                        },
                        child: Text("Cadastrar-se"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 1, 37, 54),
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 50),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          print("VOCÊ SERÁ ENCAMINHADO PARA A TELA DE LOGIN!");
                        },
                        child: Text("Login"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 1, 37, 54),
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
