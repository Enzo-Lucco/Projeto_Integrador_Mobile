import 'package:flutter/material.dart';
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
  String _nomeC = "";
  String _emailC = "";
  List<Cliente> ListaCCliente = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
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
            child: Container(
              padding: EdgeInsets.all(50),
              child: Form(
                key: cliKey,
                child: Column(
                  children: [
                    SizedBox(height: 150),
                      Text(
                      'CADASTRO DE CLIENTES',
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
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        filled: true,
                        fillColor:Color.fromARGB(255, 1, 37, 54),
                      ),
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
                        fillColor:Color.fromARGB(255, 1, 37, 54),
                      ),
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
                              if (cliKey.currentState!.validate()) {
                                print("********");
                              }
                              _nomeC = nome1.text;
                              print("Nome: " + _nomeC);
                              _emailC = email1.text;
                              print("Email: " + _emailC);

                              Cliente C = new Cliente(_emailC, _nomeC);
                              ListaCCliente.add(C);
                              mostrar();
                              setState(() {});
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
                              setState(() {});
                            },
                            child: Text("Cancelar")),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Você é uma ONG?"),
                        SizedBox(
                  width: 130,
                  height: 35,
                  child: ElevatedButton(
                    onPressed: () {
                       Navigator.pushNamed(context, '/CadOng');
                    },
                    child: Text(
                      "Cadastre-se aqui!",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      foregroundColor: const Color.fromARGB(120, 1, 37, 54),
                      padding: EdgeInsets.zero,
                      side: BorderSide.none,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                  ),
                ),
                ],
                    ),   
                  ],
                ),
              ),
            ),
          ),
        ),
        //BANNER DO APP
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
      top: 1.0, // Ajuste conforme necessário
      left: 1.0, // Ajuste conforme necessário
      child: IconButton(
        onPressed: () {
          Navigator.pop(context); // Voltar para a tela anterior
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 20,
        ),
      ),
    ),

      ]),
    );
  }

  void mostrar() {
    ListaCCliente.forEach((Cliente C) {
      print("Nome : " + C.nome);
      print("Email : " + C.email);
    });
  }
}                