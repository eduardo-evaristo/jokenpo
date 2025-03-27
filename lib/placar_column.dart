import 'package:flutter/material.dart';

class PlacarColumn extends StatelessWidget {
  const PlacarColumn({super.key, required this.text, required this.score});
  final String text;
  final int score;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[Text(text), Container(child: Text(score.toString()))],
    );
  }
}
