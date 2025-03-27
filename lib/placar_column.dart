import 'package:flutter/material.dart';

class PlacarColumn extends StatelessWidget {
  const PlacarColumn({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[Text(text), Container(child: Text('pontos'))],
    );
  }
}
