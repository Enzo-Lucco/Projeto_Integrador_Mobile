import 'package:flutter/material.dart';
import 'package:flutter_application_projeto_integrador/InfoOng.dart';
import 'package:flutter_application_projeto_integrador/cadastroOng.dart';
import 'package:flutter_application_projeto_integrador/cadastroUsuario.dart';
import 'package:flutter_application_projeto_integrador/home.dart';
import 'package:flutter_application_projeto_integrador/login.dart';
import 'package:flutter_application_projeto_integrador/postagem.dart';
import 'package:flutter_application_projeto_integrador/sobrenos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/CadUsuario': (context) => MyTela(),
        '/registro': (context) => InfoOng(),
        '/login': (context) => MyLogin(),
        '/postagem': (context) => CriarPost(),
        '/SN': (context) => MySN(),
        "/": (context) => cliente(),
        "/CadOng": (context) => ong(),
      },
      );
  }
}
