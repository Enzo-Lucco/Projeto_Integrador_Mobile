import 'package:flutter/material.dart';

class InfoOng extends StatefulWidget {
  const InfoOng({super.key});

  @override
  State<InfoOng> createState() => _InfoOngState();
}

class _InfoOngState extends State<InfoOng> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela de Registro de ONGs",style: TextStyle(color: Colors.white),),centerTitle:true, backgroundColor:Color.fromARGB(255, 1, 37, 54),),
    );

  }
}