import 'package:flutter/material.dart';

class PlacarColumn extends StatelessWidget {
  const PlacarColumn({super.key, required this.text, required this.score});
  final String text;
  final int score;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(text, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        Container(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
          padding: EdgeInsets.all(40),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            score.toString(),
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
