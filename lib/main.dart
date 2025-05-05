import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Auth

import 'package:flutter_application_projeto_integrador/cadastroOng.dart';
import 'package:flutter_application_projeto_integrador/cadastroUsuario.dart';
import 'package:flutter_application_projeto_integrador/home.dart';
import 'package:flutter_application_projeto_integrador/infoOng.dart';
import 'package:flutter_application_projeto_integrador/login.dart';
import 'package:flutter_application_projeto_integrador/postagem.dart';
import 'package:flutter_application_projeto_integrador/sobrenos.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();
    print('Firebase conectado! UID anônimo: ${userCredential.user?.uid}');
  } catch (e) {
    print('Erro ao conectar com Firebase: $e');
  }

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
        '/': (context) => MyTela(),
        '/registro': (context) => InfoOng(),
        '/login': (context) => MyLogin(),
        '/postagem': (context) => CriarPost(),
        '/SN': (context) => MySN(),
        '/CadUsuario': (context) => cliente(),
        '/CadOng': (context) => ong(),
      },
    );
  }
}
