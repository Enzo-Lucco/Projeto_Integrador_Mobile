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
    final double larguraTela = MediaQuery.of(context).size.width;
    final double alturaTela = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/fundo.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: SizedBox(
                      width: larguraTela * 0.88,
                      height: 150,
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: larguraTela * 0.88,
                    height: alturaTela * 0.68,
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Form(
                      key: ongKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'CADASTRO DE ONGS',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: nome1,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: "Nome:",
                              labelStyle: const TextStyle(color: Colors.white),
                              prefixIcon: const Icon(Icons.badge),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 1, 37, 54),
                            ),
                            style: const TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "O nome não pode estar vazio";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: email1,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "Email:",
                              labelStyle: const TextStyle(color: Colors.white),
                              prefixIcon: const Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 1, 37, 54),
                            ),
                            style: const TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "O Email não deve ser vazio";
                              } else if (!value.contains('@') ||
                                  !value.contains('.')) {
                                return "Por favor, insira um email válido";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: cnpj1,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "CNPJ:",
                              labelStyle: const TextStyle(color: Colors.white),
                              prefixIcon: const Icon(Icons.document_scanner),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 1, 37, 54),
                            ),
                            style: const TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "O CNPJ não pode estar vazio";
                              } else if (value.length < 14) {
                                return "CNPJ inválido";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 40),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 1, 37, 54),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                  ),
                                  onPressed: () {
                                    if (ongKey.currentState!.validate()) {
                                      int cnpj = int.parse(cnpj1.text);
                                      String email = email1.text;
                                      String nome = nome1.text;
                                      O.cnpj = cnpj;
                                      O.email = email;
                                      O.nome = nome;
                                      gravarBD();
                                      nome1.clear();
                                      email1.clear();
                                      cnpj1.clear();
                                    }
                                  },
                                  child: const Text("Cadastrar",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 1, 37, 54),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                  ),
                                  onPressed: () {
                                    nome1.clear();
                                    email1.clear();
                                    cnpj1.clear();
                                  },
                                  child: const Text("Cancelar",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 0,
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
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
