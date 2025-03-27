import 'package:flutter/material.dart';

class SecaoTitulo extends StatelessWidget {
  const SecaoTitulo({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}
