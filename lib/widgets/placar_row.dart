import 'package:flutter/material.dart';
import 'package:pedrapapeltesoura/widgets/placar_column.dart';

class PlacarRow extends StatelessWidget {
  const PlacarRow({
    super.key,
    required this.userScore,
    required this.ties,
    required this.cpuScore,
  });

  final int userScore;
  final int ties;
  final int cpuScore;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        PlacarColumn(text: 'Você', score: userScore),
        PlacarColumn(text: 'Empate', score: ties),
        PlacarColumn(text: 'Máquina', score: cpuScore),
      ],
    );
  }
}
