import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Firebase Firestore
import 'package:flutter_application_projeto_integrador/cliente.dart';

class cliente extends StatefulWidget {
  const cliente({super.key});

  @override
  State<cliente> createState() => _clienteState();
}

class _clienteState extends State<cliente> {
  GlobalKey<FormState> cliKey = GlobalKey<FormState>();
  TextEditingController nome1 = TextEditingController();
  TextEditingController email1 = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController cpfController = TextEditingController();

  String _nomeC = "";
  String _emailC = "";
  List<Cliente> ListaCCliente = [];

  @override
  Widget build(BuildContext context) {
    final double larguraTela = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/fundo.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                SafeArea(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: SizedBox(
                    width: larguraTela * 0.9,
                    height: 150,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: larguraTela * 0.9,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                  child: Form(
                    key: cliKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 10),
                        const FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'CADASTRO DE CLIENTES',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 40),
                        TextFormField(
                          controller: nome1,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "Nome:",
                            labelStyle: const TextStyle(color: Colors.white),
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 1, 37, 54),
                          ),
                          style: const TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
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
                            if (value == null || value.isEmpty) {
                              return "O Email não deve ser vazio";
                            } else if (!value.contains('@') ||
                                !value.contains('.')) {
                              return "Por favor, insira um endereço de email válido";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: senhaController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Senha:',
                            labelStyle: const TextStyle(color: Colors.white),
                            prefixIcon: const Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 1, 37, 54),
                          ),
                          style: const TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira sua senha';
                            } else if (value.length < 3) {
                              return "A senha deve ter pelo menos 3 caracteres";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: cpfController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'CPF:',
                            labelStyle: const TextStyle(color: Colors.white),
                            prefixIcon: const Icon(Icons.credit_card),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 1, 37, 54),
                          ),
                          style: const TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira seu CPF';
                            } else if (value.length != 11) {
                              return 'O CPF deve ter 11 dígitos';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (cliKey.currentState!.validate()) {
                                      String nome = nome1.text;
                                      String email = email1.text;
                                      String senha = senhaController.text;
                                      String cpf = cpfController.text;

                                      try {
                                        await FirebaseFirestore.instance
                                            .collection('users')
                                            .add({
                                          'nome': nome,
                                          'email': email,
                                          'senha': senha,
                                          'cpf': cpf,
                                          'tipo': 'cliente',
                                          'created_at': Timestamp.now(),
                                        });

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text(
                                              'Cadastro realizado com sucesso!'),
                                        ));

                                        nome1.clear();
                                        email1.clear();
                                        senhaController.clear();
                                        cpfController.clear();
                                        setState(() {});
                                      } catch (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content:
                                              Text('Erro ao cadastrar: $e'),
                                        ));
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 1, 37, 54),
                                  ),
                                  child: const Text(
                                    "Cadastrar",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    nome1.clear();
                                    email1.clear();
                                    senhaController.clear();
                                    cpfController.clear();
                                    setState(() {});
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 1, 37, 54),
                                  ),
                                  child: const Text(
                                    "Cancelar",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Você é uma ONG? "),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/CadOng');
                              },
                              child: const Text(
                                "Cadastre-se aqui!",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Color.fromARGB(255, 1, 37, 54),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
