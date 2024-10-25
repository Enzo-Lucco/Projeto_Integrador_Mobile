import 'package:flutter/material.dart';
import 'package:flutter_application_projeto_integrador/PostagemDados.dart';

class CriarPost extends StatefulWidget {
  const CriarPost({super.key});

  @override
  State<CriarPost> createState() => _CriarPostState();
}

class _CriarPostState extends State<CriarPost> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController tituloController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();

  List<Dados> ListaDeDados = [];

  void mostrar() {
    for (var D in ListaDeDados) {
      print("Titulo: ${D.titulo}");
      print("******************************");
      print("Descricao: ${D.descricao}");
    }
  }

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
              width: MediaQuery.of(context).size.width * 0.95,
              color: Colors.white,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.90,
            width: MediaQuery.of(context).size.width * 0.98,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 200,
                      ),
                      const Text(
                        'Nova postagem',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: tituloController,
                        decoration: InputDecoration(
                          labelText: 'Título',
                          icon: const Icon(Icons.title, color: Colors.blue),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, insira um título';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: descricaoController,
                        decoration: InputDecoration(
                          labelText: 'Descrição',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          icon: const Icon(Icons.info, color: Colors.blue),
                        ),
                        maxLines: 6,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, insira uma descrição';
                          } else {
                            if (value.length < 30) {
                              return 'A descrição deve ter pelo menos 30 caracteres';
                            }
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/dog.png',
                              width: 200,
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Dados D = Dados(
                                    tituloController.text,
                                    descricaoController.text,
                                  );
                                  ListaDeDados.add(D);
                                  mostrar();
                                  setState(() {});
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                child: Text(
                                  'Enviar',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                const SizedBox(height: 30),
                FractionallySizedBox(
                  widthFactor: 0.95,
                  child: SizedBox(
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
        ],
      ),
    );
  }
}
