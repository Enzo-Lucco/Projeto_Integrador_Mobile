import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController loginController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  Future<void> fazerLogin(String email, String senha) async {
    try {
      // Realiza a autenticação com Firebase
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: senha);

      final uid = userCredential.user!.uid;

      // Verifica se o usuário é uma ONG
      final ongSnapshot =
          await FirebaseFirestore.instance.collection('ongs').doc(uid).get();

      if (ongSnapshot.exists) {
        // Caso seja ONG, redireciona para a página correspondente
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Login como ONG')));
        Navigator.pushReplacementNamed(context, '/hong');
        return;
      }

      // Verifica se o usuário é um usuário comum
      final userSnapshot = await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(uid)
          .get();

      if (userSnapshot.exists) {
        // Caso seja Usuário, redireciona para a página do usuário
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Login como Usuário')));
        Navigator.pushReplacementNamed(context, '/HomeUsuario');
        return;
      }

      // Se não encontrar o usuário nem a ONG, mostra mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tipo de conta não identificado.')));
    } on FirebaseAuthException catch (e) {
      // Caso o erro de autenticação aconteça, mostra a mensagem do erro
      String mensagemErro;
      switch (e.code) {
        case 'user-not-found':
          mensagemErro = 'Nenhum usuário encontrado para esse e-mail.';
          break;
        case 'wrong-password':
          mensagemErro = 'Senha incorreta.';
          break;
        default:
          mensagemErro = 'Erro desconhecido: ${e.message}';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(mensagemErro)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double larguraTela = MediaQuery.of(context).size.width;

    return Scaffold(
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    constraints: const BoxConstraints(minHeight: 600),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30),
                          campoTexto(
                            controller: loginController,
                            label: "Email:",
                            icon: Icons.email,
                            validator: (value) => value == null || value.isEmpty
                                ? "Por favor, insira seu email"
                                : null,
                          ),
                          const SizedBox(height: 30),
                          campoTexto(
                            controller: senhaController,
                            label: "Senha",
                            icon: Icons.lock,
                            obscure: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Por favor, insira sua senha";
                              } else if (value.length < 6) {
                                return "A senha deve ter pelo menos 6 caracteres";
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
                                    if (_formKey.currentState!.validate()) {
                                      fazerLogin(
                                        loginController.text.trim(),
                                        senhaController.text.trim(),
                                      );
                                    }
                                  },
                                  child: const Text("Login",
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
                                    loginController.clear();
                                    senhaController.clear();
                                  },
                                  child: const Text("Cancelar",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Não é cadastrado?"),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/CadUsuario');
                                },
                                child: const Text(
                                  "Clique aqui!",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 1, 37, 54),
                                    decoration: TextDecoration.underline,
                                  ),
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
        ],
      ),
    );
  }

  Widget campoTexto({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType tipoTeclado = TextInputType.text,
    bool obscure = false,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: tipoTeclado,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 1, 37, 54),
      ),
      style: const TextStyle(color: Colors.white),
      validator: validator,
    );
  }
}
