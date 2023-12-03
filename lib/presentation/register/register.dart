import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {

    final logger = Logger();
    logger.d("Height: ${MediaQuery.of(context).size.height}");
    logger.d("Widht: ${MediaQuery.of(context).size.width}");
    logger.d("Font Size: ${MediaQuery.of(context).textScaleFactor}");

    return const Scaffold(
      body: Column(
        children: [
          Center(child: Text("Register Page",))
        ],
      ),
    );
  }
}