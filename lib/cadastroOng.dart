import 'package:flutter/material.dart';
import 'package:flutter_application_projeto_integrador/ong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ong extends StatefulWidget {
  const ong({super.key});

  @override
  State<ong> createState() => _ongState();
}

class _ongState extends State<ong> {
  GlobalKey<FormState> ongKey = GlobalKey<FormState>();
  TextEditingController nome1 = TextEditingController();
  TextEditingController email1 = TextEditingController();
  TextEditingController cnpj1 = TextEditingController();
  Ong O = Ong();

  List<Ong> ListaOOng = [];

  Future<void> gravarBD() async {
    var url = Uri.parse('http://localhost:8080/apiOng/inserirOng');
    await http.post(url,
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          "cnpj": O.cnpj,
          "email": O.email,
          "nome": O.nome,
        }));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // IMAGEM DE FUNDO
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/fundo.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          // TELA BRANCA NA FRENTE DA IMAGEM
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
            height: MediaQuery.of(context).size.height * 0.90,
            width: MediaQuery.of(context).size.width * 0.98,
            child: SingleChildScrollView(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(50),
                  child: Form(
                    key: ongKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150,
                        ),
                        Text(
                          'CADASTRO DE ONGS',
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 50),
                        TextFormField(
                          controller: nome1,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "Nome:",
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.badge),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            filled: true,
                            fillColor: Color.fromARGB(255, 1, 37, 54),
                          ),
                          style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "O nome não pode estar vazio";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          controller: email1,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "Email:",
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            filled: true,
                            fillColor: Color.fromARGB(255, 1, 37, 54),
                          ),
                          style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "O Email não deve ser vazio";
                            } else if (!value.contains('@') ||
                                !value.contains('.')) {
                              return "Por favor, insira um endereço de email válido";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          controller: cnpj1,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "CNPJ:",
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.document_scanner),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            filled: true,
                            fillColor: Color.fromARGB(255, 1, 37, 54),
                          ),
                          style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "O CNPJ não pode estar vazio";
                            } else if (value.length != 3) {
                              return "CNPJ inválido (3)";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 130,
                              height: 35,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (ongKey.currentState!.validate()) {
                                      int cnpj = int.parse(cnpj1.text);
                                      String email = email1.text;
                                      String nome = nome1.text;
                                      O.cnpj = cnpj;
                                      O.email = email;
                                      O.nome = nome;
                                      gravarBD();
                                      nome1.text = "";
                                      email1.text = "";
                                      cnpj1.text = "";
                                      setState(() {});
                                    }
                                  },
                                  child: Text("Cadastrar")),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            SizedBox(
                              width: 130,
                              height: 35,
                              child: ElevatedButton(
                                  onPressed: () {
                                    nome1.text = "";
                                    email1.text = "";
                                    cnpj1.text = "";
                                    setState(() {});
                                  },
                                  child: Text("Cancelar")),
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
          // BANNER DO APP
          Center(
            child: Column(
              children: [
                SizedBox(height: 30),
                FractionallySizedBox(
                  widthFactor: 0.95,
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
          Positioned(
            top: 1.0,
            left: 1.0,
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/registro');
              },
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
